part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperEvent {}

class GetTrendingWallpaper extends WallpaperEvent{}

class GetSearchWallpaper extends WallpaperEvent{}
