
String ReverseDate(String date) {
  if (date.isNotEmpty) {
    List<String> splitDate = date.split("-");
    return splitDate[2] + "-" + splitDate[1] + "-" + splitDate[0];
  }
  return "";
}

int CountListResult(){
  return 0;
}