part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<UserModel> userList;

  const HomeState({required this.isLoading, required this.userList});

  HomeState copyWith({bool? isLoading, List<UserModel>? userList}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      userList: userList ?? this.userList,
    );
  }

  @override
  List<Object> get props => [isLoading, userList];
}
