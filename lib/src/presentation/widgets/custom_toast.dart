import 'package:fluttertoast/fluttertoast.dart';

import '../../src.dart';

void showCustomToaster(
  String message, {
  bool isError = true,
  bool isNormal = false,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor:
        isNormal
            ? AppColors.kBlack
            : isError
            ? AppColors.kError
            : AppColors.kSuccess,
    textColor: AppColors.kWhite,
    fontSize: 14.0,
  );
}
