part of 'banner_bloc.dart';

@immutable
sealed class BannerEvent {
  const BannerEvent();
}

final class BannerFetchAll extends BannerEvent {}
