class ServidorLanguageApp {
  final String hostname;
  final String idioma;
  final int puerto;
  final bool usaSsl;

  ServidorLanguageApp({required this.hostname, required this.idioma, required this.puerto, this.usaSsl = true});

  ServidorLanguageApp.local()
      : hostname = 'localhost', idioma = 'demo', puerto = 8080, usaSsl = false;

  ServidorLanguageApp.produccion({required this.idioma})
      : hostname = 'api.language.app', puerto = 443, usaSsl = true;

  factory ServidorLanguageApp.desdeUrl(String url) {
    final uri = Uri.parse(url);
    return ServidorLanguageApp(
      hostname: uri.host,
      idioma: uri.pathSegments.isNotEmpty ? uri.pathSegments.first : 'general',
      puerto: uri.port != 0 ? uri.port : (uri.scheme == 'https' ? 443 : 80),
      usaSsl: uri.scheme == 'https',
    );
  }

  @override
  String toString() => '${usaSsl ? "https" : "http"}://$hostname:$puerto/$idioma';
}

void main() {
  print(ServidorLanguageApp.local());
  print(ServidorLanguageApp.produccion(idioma: 'ingles'));
  print(ServidorLanguageApp.desdeUrl('https://api.language.app/frances'));
}
