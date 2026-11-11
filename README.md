<p align="center">
  <img src="assets/logo.png" alt="Netflix-style app logo" width="180" />
</p>

<h1 align="center">Flutter Netflix UI</h1>

<p align="center">
  A Flutter movie-discovery app inspired by Netflix, powered by The Movie Database (TMDB) API.
</p>

## Overview

This project presents a streaming-style catalog experience for browsing current, trending, upcoming, and top-rated movies, as well as popular TV shows. Users can search the catalog, open a title’s detail page, read its synopsis and metadata, and discover recommendations. This is a catalog and UI demonstration: the visible Play, Download, My List, cast, and rating controls do not implement video playback or account-backed streaming features.

## Features

- **Home discovery:** Featured now-playing carousel plus horizontal shelves for trending movies, upcoming movies, popular TV shows, and top-rated movies.
- **Search:** Search TMDB titles and browse trending titles when the search field is empty.
- **Title details:** View poster artwork, release year, runtime, genres, overview, and recommended titles.
- **Hot News:** Browse trending movies and TV titles with release/air-date information.
- **Bottom navigation:** Switch between Home, Search, and Hot News.
- **Streaming-inspired presentation:** Dark UI, poster artwork, Netflix-style branding, and a Lottie splash animation.

## Screenshots and assets

The repository currently includes logo/animation assets, but no app-screen screenshots. Add screen captures to an `assets/screenshots/` directory and embed them here if you want a visual gallery.

The app's bundled branding assets are `assets/logo.png`, `assets/logo.svg`, and `assets/Netflix.png`. The splash animation is `assets/netflix.json` (the repository also includes `assets/netflix-1.json`).

## Architecture

This is a compact Flutter application organized by responsibility: screens render the experience, `ApiServices` retrieves TMDB data, model classes decode JSON responses, and `Common/utils.dart` holds API and image URL configuration.

```text
lib/
├── main.dart                    Flutter entry point; launches SplashScreen
├── Common/
│   └── utils.dart               TMDB base URL, image URL, API key configuration
├── Model/
��   ├── movie_model.dart         Now-playing movie response models
│   ├── movie_details.dart       Movie detail and genre models
│   ├── movie_recommendation.dart Recommendation response models
│   ├── search_movie.dart        Search response model
│   ├── trending_movies.dart     Trending movie response model
│   ├── tmdb_trending.dart       Trending movie/TV response model
│   ├── top_rated_movies.dart    Top-rated response model
│   ├── upcoming_movie_model.dart Upcoming movie response model
│   └── popular_tv_series.dart   Popular TV response model
├── Screen/
│   ├── splash_screen.dart       Lottie intro and transition to app tabs
│   ├── app_navbar_screen.dart   Home/Search/Hot News tab navigation
│   ├── netflix_home_screen.dart Discovery shelves and featured titles
│   ├── search_screen.dart       Search field and trending/search results
│   ├── hot_news.dart            Trending feed with release information
│   └── movie_detailed_screen.dart Detail and recommendation view
└── Services/
    └── api_services.dart        TMDB HTTP requests and JSON parsing

assets/
├── logo.png, logo.svg, Netflix.png   Branding assets
├── netflix.json, netflix-1.json     Lottie animation JSON
└── screenshots/                     Optional app screenshots (not present yet)
```

### Data flow

`main.dart` starts `SplashScreen`, which plays the bundled Lottie animation and transitions to `AppNavbarScreen`. The tab controller hosts `NetflixHomeScreen`, `SearchScreen`, and `HotNews`. Those screens call methods on `ApiServices`; service responses are parsed into the matching model classes and rendered with Flutter `FutureBuilder`s. Poster and backdrop images are loaded from TMDB's image CDN using the URL helper in `Common/utils.dart`. Selecting a title from the featured carousel or search results navigates to `MovieDetailedScreen`, which fetches the detail and recommendation endpoints for that movie ID.

## Tech stack

- **Language:** Dart (`pubspec.yaml` SDK constraint: `^3.6.1`)
- **Framework:** Flutter
- **Networking:** `http`
- **API/data:** TMDB REST API and Dart JSON model classes
- **Images:** `cached_network_image`
- **Animation:** `lottie`
- **Other UI utilities:** `iconsax`, `intl`

## Getting started

### Prerequisites

- Flutter SDK with a Dart version compatible with `pubspec.yaml`
- A TMDB API key
- An emulator, simulator, or supported device

### Configure TMDB

`ApiServices` calls TMDB endpoints for now-playing, upcoming, trending, top-rated, popular TV, movie details, recommendations, and search. The API key is currently configured in `lib/Common/utils.dart` and also referenced directly in the search request. Before using or publishing your own fork, replace the embedded credential with your own TMDB API key and preferably load it through a secure build-time configuration rather than committing it to source control.

### Run locally

From the repository root:

```bash
flutter pub get
flutter run
```

To choose a target device:

```bash
flutter devices
flutter run -d <device-id>
```

## Build and validate

```bash
flutter analyze
flutter test
flutter build apk
flutter build ios
flutter build web
flutter build windows
```

Build targets depend on the platform toolchains available on your machine. The current `test/widget_test.dart` is Flutter's generated counter smoke test and does not test the movie catalog; replace it with tests for API parsing, screen states, navigation, and search behavior.

## Configuration and limitations

- The app depends on internet access and valid TMDB credentials for catalog data and remote artwork.
- TMDB provides metadata and images; the app does not stream movies or TV episodes.
- Play, Download, My List, and several other detail-page affordances are currently presentation-only controls.
- Category selection on the home screen and taps on the poster shelves are not fully wired to navigation/filter behavior.
- API methods currently return nullable results on request errors; screens should provide consistent empty/error states.

## Suggested next steps

- Move the TMDB API key out of source code and centralize authenticated request handling.
- Add retry, loading, empty, and error states consistently across all catalog sections.
- Connect the detail-screen controls to implemented features or clearly mark them as unavailable.
- Add widget and model tests, including malformed/nullable TMDB response cases.
- Add app screenshots under `assets/screenshots/` and update this README gallery.
