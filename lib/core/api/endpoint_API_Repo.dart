class EndPoint {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
  static const String posts = "/posts";
  static String postById(int id) => "/posts/$id";
}
class ApiRepository {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
}