class Students {
  String name = "";
  String schoolName = "";
  String imageUrl = "";
  String uuid = "";

  Students({required String name, required String schoolName, required String imageUrl, required String uuid}) {
    this.uuid = uuid;
    this.name = name;
    this.imageUrl = imageUrl;
    this.schoolName = schoolName;
  }
}


