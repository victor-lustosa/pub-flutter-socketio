import 'package:flutter/material.dart';
import 'package:pub/app/app_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pub/app/core/components/MessageBlocObserver.dart';
void main() {
  BlocOverrides.runZoned(
        () => runApp(const AppWidget()),
    blocObserver: MessageBlocObserver(),
  );
}

