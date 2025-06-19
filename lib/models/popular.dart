class PopularDiet {
  String name;
  String time;
  String rating;
  String iconPath;

  PopularDiet({
    required this.name,
    required this.time,
    required this.rating,
    required this.iconPath
  });
  
  static List <PopularDiet> getPopular()
  {
    List <PopularDiet> popular = [];

    popular.add(
     PopularDiet(name: "Burger", time: "20 min", rating: "Rating : 4/5", iconPath: "assets/icons/download.jpg")
    );
    popular.add(
      PopularDiet(name: "Fries", time: " 5 min", rating: "Rating : 5/5", iconPath: "assets/icons/fr.png")
    );
    return popular;
  }
}