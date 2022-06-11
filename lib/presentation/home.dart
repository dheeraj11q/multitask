import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitask/businesslogic/home_cubit/home_cubit.dart';
import 'package:multitask/services/apis/home_api.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    homeCubit.mutiUsersGetWithForloop();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeCubit.mutiUsersGetWithForloop();
        },
        child: const Icon(Icons.replay_outlined),
      ),
      appBar: AppBar(
        title: const Text("User Emails"),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state.userList.isEmpty
                  ? const Center(
                      child: Text("Empty"),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: state.userList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    state.userList[index].email!,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
        },
      ),
    );
  }
}
