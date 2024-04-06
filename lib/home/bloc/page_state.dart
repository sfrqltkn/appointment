import 'package:appointment/utils/enums/pages_key.dart';

class PageState {
  final PageKeys pageKey;

  const PageState({required this.pageKey});
  PageState.initial(this.pageKey);
  PageState copyWith({PageKeys? pageKey}) {
    return PageState(pageKey: pageKey ?? this.pageKey);
  }
}
