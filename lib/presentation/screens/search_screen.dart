import 'package:flutter/material.dart';
import 'package:mdklift/core/utils/highlight_text.dart';
import 'package:mdklift/data/database/dao/elevators_dao.dart';
import 'package:mdklift/data/remote/okean_events_sync_service.dart';
import 'package:mdklift/domain/repositories/active_elevator_events_repository.dart';
import 'package:mdklift/domain/repositories/history_elevator_events_repository.dart';
import 'package:mdklift/presentation/screens/elevator_card_screen.dart';
//import 'package:vkrb/presentation/screens/elevator_events_history_screen.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

class SearchScreen extends StatefulWidget {
  final ActiveElevatorEventsRepository activeRepository;
  final HistoryElevatorEventsRepository historyRepository;
  final ElevatorsDao elevatorsDao;
  final OkeanEventsSyncService okeanEventsSyncService;

  const SearchScreen({
    super.key,
    required this.activeRepository,
    required this.historyRepository,
    required this.elevatorsDao,
    required this.okeanEventsSyncService,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // вызывается при каждом setState()

    String normalizeAddress(String text) {
      return text
          .toLowerCase()
          .replaceAll(RegExp(r'[.,]'), ' ') // не обращая внимания на символы
          .replaceAll(
            RegExp(r'\s+'),
            ' ',
          ) // один или больше пробельных символов
          .trim();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.lightBlue,
            size: 22,
          ),
        ),
        centerTitle: true,
        title: TextField(
          autofocus: true,
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Введите адрес',
            prefixIcon: Icon(Icons.search, color: AppColors.essanGrey),
            suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear, color: AppColors.essanGrey),
                    onPressed: () {
                      setState(() {
                        _controller.clear(); // очистили текст
                        _searchQuery = ''; // сбросили поиск

                        FocusScope.of(context).unfocus(); // сбросили фокус
                      });
                    },
                  )
                : null,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.lightBlue, width: 1),
            ),

            // при фокусе
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.darkBlue, width: 1.5),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value.toLowerCase();
            });
          },
        ),
      ),
      body: FutureBuilder(
        future: widget.elevatorsDao.getElevators(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          }

          final elevators = snapshot.data ?? [];

          final filteredElevatorsList = elevators.where((elEv) {
            final address = normalizeAddress(elEv.serviceInfo.address);
            final queryWords = normalizeAddress(
              _searchQuery,
            ).split(' '); // список слов, которые будем искать

            if (_searchQuery.trim().isEmpty) return true;

            return queryWords.every(
              (word) => address.contains(word),
            ); // все слова (или символы в словах) должны встречаться
          }).toList();

          return Padding(
            padding: const EdgeInsets.all(5),
            child: ListView(
              children: filteredElevatorsList.map((el) {
                return Padding(
                  padding: EdgeInsets.all(5),
                  child: Card(
                    elevation: 1, // тень
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(el.inventoryNumber),
                      subtitle: highlightText(
                        el.serviceInfo.address,
                        _searchQuery,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: AppColors.darkBlue,
                      ),
                      tileColor: Colors.white,
                      splashColor: AppColors.lightBlue.withValues(alpha: 0.2),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ElevatorCardPage(
                              // Переход на подробную информацию о лифте
                              elevator: el,
                              activeRepository: widget.activeRepository,
                              historyRepository: widget.historyRepository,
                              okeanEventsSyncService: widget.okeanEventsSyncService,
                            ),

                            // builder: (_) => ElevatorEventsHistoryScreen(
                            //   elevator: el,
                            //   historyRepository: widget.historyRepository,
                            // ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
