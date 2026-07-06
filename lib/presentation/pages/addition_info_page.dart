import 'package:flutter/material.dart';
import 'package:mdklift/core/utils/date_utils.dart';
import 'package:mdklift/domain/entities/elevator.dart';
import 'package:mdklift/domain/repositories/history_elevator_events_repository.dart';
import 'package:mdklift/presentation/screens/elevator_events_history_screen.dart';
import 'package:mdklift/presentation/widgets/info_tile.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';


class AdditionInfoPage extends StatefulWidget {
  final Elevator elevator;
  final HistoryElevatorEventsRepository historyRepository;

  const AdditionInfoPage({
    super.key,
    required this.elevator,
    required this.historyRepository,
  });

  @override
  State<AdditionInfoPage> createState() => _AdditionInfoPageState();
}

class _AdditionInfoPageState extends State<AdditionInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                InfoTile(
                  title: "Грузоподъёмность",
                  value: "${widget.elevator.serviceInfo.capacityKg} кг",
                ),
                InfoTile(
                  title: "Вместимость",
                  value: "${widget.elevator.serviceInfo.maxPeople} человек",
                ),
                InfoTile(
                  title: "Введён в эксплуатацию",
                  value: formatDate(
                    widget.elevator.serviceInfo.commissioningDate,
                  ),
                ),
                InfoTile(
                  title: "Последняя проверка",
                  value: formatDate(
                    widget.elevator.serviceInfo.lastInspectionDate,
                  ),
                ),
                InfoTile(
                  title: "Следующая проверка",
                  value: formatDate(
                    widget.elevator.serviceInfo.nextInspectionDate,
                  ),
                ),
                InfoTile(
                  title: "Номер телефона",
                  value: "+7 900 000 003",
                  trailing: IconButton(
                    icon: const Icon(Icons.phone, size: 25, color: AppColors.essanGrey,),
                    onPressed: () {
                      _makePhoneCall('+7900000003');
                    },
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.history, color: Colors.white),
                  label: const Text(
                    'История событий',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightBlue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    elevation: 1,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ElevatorEventsHistoryScreen(
                          elevator: widget.elevator,
                          historyRepository: widget.historyRepository,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri uri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  if (!await launchUrl(uri)) {
    throw Exception('Не удалось открыть приложение для звонка');
  }
}
