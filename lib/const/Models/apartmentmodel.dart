class apartmentmodel {
  final String photo;
  final String type;
  final String address;
  final double fees;
  final double rate;
  apartmentmodel(this.photo, this.type, this.rate, this.address, this.fees);
  static List<apartmentmodel> apartments = [
    apartmentmodel(
        "assets/images/Room.png", "شقه", 5, "حدائق المعادي-القاهره", 6000),
    apartmentmodel(
        "assets/images/Room2.png", "غرفه", 0, "المنشيه-الاسكندريه", 2000),
    apartmentmodel(
        "assets/images/room3.png", "استوديو", 4.3, "كفرالشيخ-كفرالشيخ", 3000),
    apartmentmodel(
        "assets/images/room4.png", "سرير", 4.5, "مدينة نصر-القاهره", 900),
    apartmentmodel("assets/images/room5.png", "شقه", 4.9, "شبرا-القاهره", 7000),
    apartmentmodel(
        "assets/images/Room6.png", "استوديو", 3.3, "طنطا-الغربيه", 1800),
  ];
}
