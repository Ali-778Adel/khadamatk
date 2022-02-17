import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/cubit_states/worker/worker_homepage_states.dart';

class WorkerHomePageCubit extends Cubit<WorkerHomepageStates>{
  WorkerHomePageCubit():super(WHInitState());
  //initialize WorkerHomePageCubit for static usage across whole app
  static WorkerHomePageCubit get(context){
    return BlocProvider.of(context);
  }//

//onBottomNavBatTapped method
  int currentIndex=0;
  onBottomNavBatTapped(int?index){
    currentIndex=index!;
    print(currentIndex);
    emit(OnBottomNavBarItemSelectedState());
  }
}