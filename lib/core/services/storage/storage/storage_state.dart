part of 'storage_cubit.dart';

@immutable
sealed class StorageState {}

final class StorageInitial extends StorageState {}

final class StorageLoading extends StorageState {}
