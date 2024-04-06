import 'package:appointment/utils/enums/pages_key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageState.initial(PageKeys.homePage));

  void changePageKey(PageKeys pageKey) {
    emit(state.copyWith(pageKey: pageKey));
  }
}
