import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
      showDragHandle: showDragHandle,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => BottomSheet(
        showDragHandle: showDragHandle ?? true,
        enableDrag: true,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: _alertBottomSheetShape(),
        backgroundColor: Colors.red.shade600,
        onClosing: onClosing ?? () {},
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            // margin: EdgeInsets.symmetric(horizontal: 10.w),
            width: ScreenUtil.defaultSize.width - 10.w,
            height: 100.h,
            child: Row(
              children: [
                Icon(
                  Icons.error,
                  size: 30.sp,
                  color: Colors.white,
                ),
                Gap(10.w),
                Column(
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
                    Gap(2.h),
                    Text(
                      message,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.fade,
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
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
