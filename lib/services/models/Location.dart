class SearchLocation {
  final String name;
  final double longitude;
  final double latitude;

  SearchLocation(this.name, this.longitude, this.latitude);
}

final List<SearchLocation> searchLocations = [
  SearchLocation('N Block', 73.36315041296808, 22.291302981630267),
  SearchLocation('A Block', 73.36398169852339, 22.288293911870753),
  SearchLocation('Theresa D', 73.3676921995426, 22.29431917371096),
  SearchLocation('Faculty of Arts', 73.36429739247876, 22.294749731067895),
  SearchLocation('Belgium Waffle',  73.3627873978221, 22.288325854059437),
  SearchLocation('New Food Court', 73.3649585222312, 22.288971868186664),
  SearchLocation('Shrastri Bhawan', 73.36529388399427, 22.290882443337892),
  SearchLocation('L Block', 73.36287900915377, 22.292244575021513),
  SearchLocation('Kathi Junction', 73.36458188742094, 22.29257778478683),
  // Add more locations here
];