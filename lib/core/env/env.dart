class Env {
  final EnvMode? m;
  Env(this.m);

  static final String? pathUrlImage = "https://image.tmdb.org/t/p/w500";
  static final String? _apiProduction = "https://api.themoviedb.org/3/";


  String? get api {
    switch (m) {
      case EnvMode.production:
        return _apiProduction!;
       default:
      return null;
    }
  }

  String? get stage {
    switch (m) {
      case EnvMode.production:
        return "";

      case EnvMode.sandBox:
        return "";

      default:
        return null;
    }
  }

  String? get stageLabel {
    switch (m) {
      case EnvMode.production:
        return "";

      case EnvMode.sandBox:
        return "";

      case EnvMode.local:
        return "ALPHA";

      default:
        return null;
    }
  }



  bool? get showBanner {
    switch (m) {
      case EnvMode.production:
        return false;

      case EnvMode.sandBox:
        return false;

      case EnvMode.local:
        return true;

      default:
        return null;
    }
  }
}

enum EnvMode {
  production,
  local,
  sandBox,
}
