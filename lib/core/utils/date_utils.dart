String formatDate(DateTime date) {
  return "${date.day}.${date.month.toString().padLeft(2, '0')}.${date.year}";
}