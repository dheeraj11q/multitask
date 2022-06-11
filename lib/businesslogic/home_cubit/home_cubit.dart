import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multitask/data/models/user_model.dart';
import 'package:multitask/services/apis/home_api.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeApis homeApis;
  HomeCubit({required this.homeApis})
      : super(const HomeState(
          isLoading: false,
          userList: [],
        ));

  void getUser({int userId = 1}) async {
    emit(state.copyWith(isLoading: true, userList: []));
    UserModel? userData = await homeApis.userGet(id: userId);

    if (userData != null) {
      List<UserModel> userList = [];
      userList = state.userList;
      userList.add(userData);
      emit(state.copyWith(userList: []));
      emit(state.copyWith(isLoading: false, userList: userList));
    }
  }

  void mutiUsersGetWithForloop() {
    List<int> userIds = [1, 2, 3, 4, 5];

    for (int id in userIds) {
      getUser(userId: id);
    }
  }

  void mutiUsersGetWithFuncs() {
    getUser(userId: 1);
    getUser(userId: 2);
    getUser(userId: 3);
    getUser(userId: 4);
    getUser(userId: 5);
  }
}
