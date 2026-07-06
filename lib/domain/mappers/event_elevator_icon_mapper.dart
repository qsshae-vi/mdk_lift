class EventElevatorIconMapper {
  static final String  _basePath = 'assets/icons/lift_event/';

  static String path(String iconName) {
    return '${_basePath + iconName}.png';
  }
}
