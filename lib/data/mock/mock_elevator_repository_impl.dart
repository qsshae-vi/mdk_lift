import 'package:mdklift/data/mock/mock_elevator_server.dart';
import 'package:mdklift/domain/entities/elevator.dart';
import 'package:mdklift/domain/repositories/elevator_repository.dart';

class MockElevatorRepository implements ElevatorRepository {
  final MockElevatorServer server;

  MockElevatorRepository(this.server);

  @override
  Future<List<Elevator>> getElevators() async {
    return await server.fetchElevators(); // GET /elevators
  }

  @override
  Stream<List<Elevator>> watchElevators() async* { // генератор потока,  много значений
    final initialData = await server.fetchElevators();
    yield initialData; // отправляем начальное состояние в поток (всем, кто слушает)

    yield* server.elevatorsStream;
  }
}
