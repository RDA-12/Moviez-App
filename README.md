# Moviez App

## Demo
https://user-images.githubusercontent.com/75178607/191757860-0f94f584-d25b-41b5-a3a6-d8bb54b27108.mp4

## Packages/Techs
- [`equatable`](https://pub.dev/packages/equatable) - compare dart object
- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) - state management
- [`Firebase`](https://firebase.google.com/) - use for authentication, store images, and store users data (favorite and watchlist movies)
- [`dio`](https://pub.dev/packages/dio) - http client
- [`auto_route`](https://pub.dev/packages/auto_route) - navigation
- [`get_it`](https://pub.dev/packages/get_it) - service locator
- [`cached_network_image`](https://pub.dev/packages/cached_network_image) - caching image from network
- [`envied`](https://pub.dev/packages/envied) - storing env variables
- [`image_picker`](https://pub.dev/packages/image_picker) - picking an image
- [`shared_preferences`](https://pub.dev/packages/shared_preferences) - local storage
- [`webview_flutter`](https://pub.dev/packages/webview_flutter) - show web inside app
- [`youtube_player_flutter`](https://pub.dev/packages/youtube_player_flutter) - play youtube video inside app

## Steps to run the application
1. Make sure you have the flutter SDK. If you dont have that, install the flutter SDK. You can use the official documentation at [this link](https://docs.flutter.dev/get-started/install).
2. Make sure you have firebase CLI. If you dont, use [this link](https://firebase.google.com/docs/cli#setup_update_cli) to install that.
3. Get [imdbAPI](https://imdb-api.com/) key and [newsAPI](https://newsapi.org/) key.
4. Create `.env` file in the project root. Add these lines in that file.

```
imdbAPIKey=<your imdbAPI key>
newsAPIKey=<your newsAPI key>
```
5. Create new firebase project and:
   - Activate authentication with email/password
   - Set up firestore database
   - Set up cloud storage
6. Run `flutterfire configure` at the project directory to configure the firebase (use the created project before).
7. Run `flutter pub get` to get all the required package.
8. Run `flutter pub run build_runner --delete-conflicting-outputs` to generate the environment variables.
9. Run the project with `flutter pub run`.
