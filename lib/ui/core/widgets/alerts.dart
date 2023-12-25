import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/ui/core/widgets/yu_elevated_button.dart';

class YuBottomSheets {
  static showErrorBottomSheet(
    BuildContext context, {
    required String title,
    required String message,
    void Function()? onClosing,
    bool? showDragHandle,
  }) {
    return showModalBottomSheet(
      enableDrag: true,
      showDragHandle: showDragHandle ?? false,
      backgroundColor: Colors.red.shade600,
      context: context,
      builder: (context) => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        // margin: EdgeInsets.symmetric(horizontal: 10.w),
        width: ScreenUtil.defaultSize.width - 10.w,
        height: 80.h,
        child: Row(
          children: [
            Icon(
              Icons.error,
              size: 30.sp,
              color: Colors.white,
            ),
            Gap(10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                      height: 1,
                    ),
                  ),
                  Gap(5.h),
                  Text(
                    message,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.fade,
                      height: 1,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Styles
ShapeBorder _alertBottomSheetShape() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.r),
  );
}

class YuAlerts {
  static showConfirmationAlert(
    BuildContext context, {
    required String title,
    required String message,
    required void Function() onConfirmed,
    required void Function() onDenied,
    bool? barrierDismissible,
  }) {
    return showDialog(
      barrierDismissible: barrierDismissible ?? true,
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.end,
          title: Text(title),
          content: Text(message),
          actions: [
            YuElevatedButton(label: 'Yes', onPressed: onConfirmed),
            YuElevatedButton(label: 'No', onPressed: onDenied),
          ],
        );
      },
    );
  }
}
