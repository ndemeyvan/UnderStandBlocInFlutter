import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:untitled/constant/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {

  final Connectivity connectivity;

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  ///METHODE AVEC STREAMSOUCRIBER
  StreamSubscription connectivityStreamSubscription;

  InternetCubit({this.connectivity}) : super(InternetLoading()) {
      monitorInternetConnexion();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnexion() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
          if (connectivityResult == ConnectivityResult.wifi) {
            emitInternetConnected(ConnectionType.wifi);
          } else if (connectivityResult == ConnectivityResult.mobile) {
            emitInternetConnected(ConnectionType.Mobile);
          } else {
            emitInternetDisconnected();
          }
        });
  }


  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }

//Le probleme avec le stream soucriber est que si il ya deja beaucoup de dependance entre les bloc et que leur nombre augmente cela deviens difficille a maintenir
}
