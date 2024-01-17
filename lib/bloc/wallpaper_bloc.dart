import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaperapp/Models/wallpaper_model.dart';
import 'package:wallpaperapp/data/remote/AppException.dart';

import '../data/remote/api_helper.dart';
import '../data/remote/urls.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  ApiHelper apiHelper;
  WallpaperBloc({required this.apiHelper}) : super(WallpaperInitialState()) {

    on<GetTrendingWallpaper>((event, emit) async{
      emit(WallpaperLoadingState());

      try{
        ///loaded
        var jsonResponse = await apiHelper.getAPI(url: Urls.TRENDING_WALL_URL);
        var data = WallpaperModel.fromJson(jsonResponse);
        emit(WallpaperLoadedState(mData: data));
      } catch(e){
        ///error
        emit(WallpaperErrorState(errorMsg: (e as AppException).toErrorMsg()));
      }


    });
  }
}
