// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;
import 'package:netflix_app/Common/utils.dart';
import 'package:netflix_app/Model/movie_details.dart';
import 'package:netflix_app/Model/movie_model.dart';
import 'package:netflix_app/Model/movie_recommendation.dart';
import 'package:netflix_app/Model/popular_tv_series.dart';
import 'package:netflix_app/Model/search_movie.dart';
import 'package:netflix_app/Model/tmdb_trending.dart';
import 'package:netflix_app/Model/top_rated_movies.dart';
import 'package:netflix_app/Model/trending_movies.dart';
import 'package:netflix_app/Model/upcoming_movie_model.dart';

var key = "?api_key=$apiKey";

// https://api.themoviedb.org/3/movie/now_playing?api_key=

class ApiServices {
  // playing movies
  Future<Movie?> fetchMovies() async {
    try {
      const endPoint = "/movie/now_playing";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return movieFromJson(response.body);
      } else {
        throw Exception("Failed to Load Movies");
      }
    } catch (e) {
      print("Error Fetching Movies: $e");
      return null;
    }
  }

  // Upcoming movies

  Future<UpcomingMovies?> upcomingMovies() async {
    try {
      const endPoint = "/movie/upcoming";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return upcomingMoviesFromJson(response.body);
      } else {
        throw Exception("Failed to Load Movies");
      }
    } catch (e) {
      print("Error Fetching Movies: $e");
      return null;
    }
  }

  // Trending movies

  Future<TrendingMovies?> trendingMovies() async {
    try {
      const endPoint = "/trending/movie/day";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return trendingMoviesFromJson(response.body);
      } else {
        throw Exception("Failed to Load Movies");
      }
    } catch (e) {
      print("Error Fetching Movies: $e");
      return null;
    }
  }

  // Top Rated movies

  Future<TopRatedMovies?> topRatedMovies() async {
    try {
      const endPoint = "/movie/top_rated";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return topRatedMoviesFromJson(response.body);
      } else {
        throw Exception("Failed to Load Movies");
      }
    } catch (e) {
      print("Error Fetching Movies: $e");
      return null;
    }
  }

  // Popular TV Series

  Future<PopularTVseries?> popularTvSeries() async {
    try {
      const endPoint = "/tv/popular";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return popularTVseriesFromJson(response.body);
      } else {
        throw Exception("Failed to Load Movies");
      }
    } catch (e) {
      print("Error Fetching Movies: $e");
      return null;
    }
  }

  // movie detail

  Future<MovieDetail?> movieDetail(int movieId) async {
    try {
      final endPoint = "/movie/$movieId";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return movieDetailFromJson(response.body);
      } else {
        throw Exception("Failed to Load Movies");
      }
    } catch (e) {
      print("Error Fetching Movies: $e");
      return null;
    }
  }

  // movie recommendation
  Future<MovieRecommendations?> movieRecommendation(int movieId) async {
    try {
      final endPoint = "/movie/$movieId/recommendations";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return movieRecommendationsFromJson(response.body);
      } else {
        throw Exception("Failed to Load Movies");
      }
    } catch (e) {
      print("Error Fetching Movies: $e");
      return null;
    }
  }

  // search movie
  Future<SearchMovie?> searchMovie(String query) async {
    try {
      final endPoint = "/search/movie?query=$query";
      final apiUrl = "$baseUrl$endPoint";
      final response = await http.get(Uri.parse(apiUrl), headers: {
        "Authorization": "Bearer 7989fbb4e61ceb6883d6682f7e4fb294"
      });
      if (response.statusCode == 200) {
        return searchMovieFromJson(response.body);
      } else {
        throw Exception("Failed to Load Movies");
      }
    } catch (e) {
      print("Error Fetching Movies: $e");
      return null;
    }
  }

  // tmdb trending
  Future<TmdbTrending?> tmdbTrending() async {
    try {
      final endPoint = "/trending/all/day";
      final apiUrl = "$baseUrl$endPoint$key";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return tmdbTrendingFromJson(response.body);
      } else {
        throw Exception("Failed to Load Movies");
      }
    } catch (e) {
      print("Error Fetching Movies: $e");
      return null;
    }
  }
}
