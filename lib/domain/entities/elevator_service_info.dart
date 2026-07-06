class ElevatorServiceInfo {
  final DateTime commissioningDate;
  final DateTime lastInspectionDate;
  final DateTime nextInspectionDate;
  final String address;
  final int? maxPeople;
  final int capacityKg;
  //final int? currentFloor;

  const ElevatorServiceInfo({
    required this.commissioningDate,
    required this.lastInspectionDate,
    required this.nextInspectionDate,
    required this.address,
    this.maxPeople,
    required this.capacityKg,
    //required this.currentFloor,
  });
}