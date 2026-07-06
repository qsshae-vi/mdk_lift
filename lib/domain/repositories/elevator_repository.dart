import 'package:mdklift/domain/entities/elevator.dart';

abstract class ElevatorRepository {
  Future<List<Elevator>> getElevators();
  Stream<List<Elevator>> watchElevators();
}