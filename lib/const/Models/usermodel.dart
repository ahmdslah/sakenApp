class usermodel {
  String username;
  String userrole;
  double rate;
  usermodel(this.username,this.userrole,this.rate);
  static List<usermodel>tenents=[
    usermodel("احمد", "ساكن", 4.3),
    usermodel("عبدالرحمن", "ساكن مؤقت", 5),
    usermodel("محمد", "باحث", 3.3),
    usermodel("فاديه", "باحث", 2.2),
    usermodel("شمس", "ساكن مؤقت ",3.7 ),
    usermodel("احمد", "باحث", 4.3),
    usermodel("هبه", "ساكن", 4.7),
    usermodel("عبدالعزيز", "حاجز", 4.3),
    usermodel("احمد", "ساكن", 4.3),
    usermodel("ايهاب", "ساكن", 5),
    usermodel("اسماء", "ساكن مؤقت", 4.3),
    usermodel("احمد", "ساكن", 4.3),
  ];
  static List<usermodel>renters=[
    usermodel("احمد", "صاحب عقار", 4.3),
    usermodel("عبدالرحمن", "سمسار", 5),
    usermodel("محمد", "صاحب عقار", 3.3),
    usermodel("فاديه", "حاجز", 2.2),
    usermodel("شمس", "سمسار باجر العقار فقط",3.7 ),
    usermodel("احمد", "سمسار ياجر ويدير العقار", 4.3),
    usermodel("هبه", "صاحب عقار", 4.7),
    usermodel("عبدالعزيز", "حاجز", 4.3),
    usermodel("احمد", "سمسار ياجر ويدير العقار", 4.3),
    usermodel("ايهاب", "صاحب عقار", 5),
    usermodel("اسماء", "سمسار ياجر العقار فقط", 4.3),
    usermodel("احمد", "صاحب عقار", 4.3),
  ];
}