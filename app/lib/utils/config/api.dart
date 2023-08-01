class ApiConfig {
  static const apiBaseUrl = 'https://my-finances-backend.ddev.site/api';
  static const apiConnextionTimeout = Duration(seconds: 30000);
  static const apiReceiveTimeout = Duration(seconds: 15000);
}

enum ApiEndpoints {
  login('/auth/login'),
  logout('/auth/logout'),
  register('/auth/register'),
  user('/user'),
  avatar('/user/avatar');

  const ApiEndpoints(this.path);

  final String path;
}
