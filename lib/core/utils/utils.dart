import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prueba_les/core/error/failures.dart';
import 'package:prueba_les/core/validators/number_input.dart';



int ? parseInt(dynamic value) {
  int? intValue = -1;
  if (value is int) {
    intValue = value;
  } else if (value is String) {
    intValue = value.parseInt();
  } else if (value is double) {
    intValue = value.round();
  }
  // log(intValue.toString(), name: "DEV");
  return intValue;
}

dynamic money2value(
  String? value, {
  String? symbol,
  String? locale,
  int? decimalDigits,
}) {
  final  format = NumberFormat.currency(locale: locale, decimalDigits: decimalDigits, symbol: symbol,  );
  try {
    // log(format.parse(value).toString(), name: "DEV");
    return format.parse(value!);
  } on FormatException catch (e) {
    log(e.message, name: "FormatException");
    return -1;
  }
}

String? numberError({required NumberInputError error, required int digits, bool isRequired = true}) {
  if ((error == NumberInputError.empty || error == NumberInputError.outRange) && isRequired) {
    if (error == NumberInputError.outRange) {
      return "El campo debe ser mayor o igual a 10";
    }
    return "El campo es requerido";
  } else {
    return null;
  }
}


String? value2money(
  String ?value, {
  String? symbol,
  String ?locale,
  int ?decimalDigits,
}) {
  if (value == "") return value;
  final format = NumberFormat.currency(locale: locale, decimalDigits: decimalDigits, symbol: symbol);
  try {
    // log(format.parse(value).toString(), name: "DEV");
    return format.format(double.tryParse(value!) ?? 0).replaceAll(new RegExp(r"\s+"), "");
  } on FormatException catch (e) {
    log(e.message, name: "FormatException");
    return '0';
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  int? parseInt() {
    int? intValue;
    final split = this.split(".");
    if (split.length < 1) return intValue;
    split[0].replaceAll(new RegExp(r'[^\w\s]+'), '');
    if (split[0] == '') return intValue;
    if (!isNumeric(split[0])) return intValue;
    intValue = int.parse(split[0]);
    return intValue;
  }

  /// Remove decimal zero format
  String remDecZeroFormat() {
    return this.replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
  }
}

bool isNumeric(String s) {
  if (s.isEmpty ) {
    return false;
  }
  return double.parse(s) != null;
}

String promoTextProductOrder(int type) {
  switch (type) {
    case 1:
      return 'Destacado';

    case 2:
      return '2x1';

    case 3:
      return 'Rebaja';

    default:
      return '';
  }
}

BorderRadiusGeometry? borderBannerProductPromotion(int promotionPosicion) {
  switch (promotionPosicion) {
    case 2:
      return BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10));
    case 1:
      return BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10));
  }
  return null;
}

AlignmentGeometry alignmentBannerProductPromotion(int posicion) {
  switch (posicion) {
    case 0:
      return Alignment.center;
    case 1:
      return Alignment.bottomCenter;
    case 2:
      return Alignment.topCenter;
    default:
      return Alignment.center;
  }
}

showEitherError(
  failure, {
  String? title = 'Error',
  int? duration = 3,
  Widget? titleText,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
  Color? backgroundColor = Colors.red,
  Color? colorText = Colors.white,
}) {
  String? error = mapFailureToMessage(failure);
  Get.snackbar(
    title!,
    error!,
    snackPosition: snackPosition,
    colorText: colorText,
    backgroundColor: backgroundColor,
    duration: Duration(seconds: duration!),
    titleText: titleText,
  );
}

String ?mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return (failure as ServerFailure).message;
    case CacheFailure:
      return (failure as CacheFailure).get.message;

    default:
      return 'Unexpected error';
  }
}

int ? myParseInt(dynamic value) {
  int ?intValue = -1;
  if (value is int) {
    intValue = value;
  } else if (value is String) {
    intValue = value.parseInt();
  } else if (value is double) {
    intValue = value.round();
  }
  return intValue;
}

extension ListExtension on List {
  bool containsNull() {
    bool isEmpty = false;
    for (var item in this) if (item == null) isEmpty = true;
    return isEmpty;
  }

  bool containsIndex(int i) {
    return i < this.length && 0 <= i;
  }
  String concatenate() {
    String value = "";
    this.forEach((element) => value += element.toString());
    return value;
  }


}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    // log("${formatDate(date: this)} - ${formatDate(date: other)}", name:"isSameDate");
    return this.year == other.year && this.month == other.month && this.day == other.day;
  }
}






///
/// params:
///   - r => remote
///   - l => local
///
/*AppVersionStatus validateAppVersion({@required String r, @required String l}) {
  if (r == null || l == null) return AppVersionStatus.invalid;
  List<String> splitRemote = extractSemanticVersioning(r).split(".");
  List<String> splitLocal = extractSemanticVersioning(l).split(".");
  if (splitRemote.length == 0 || splitLocal.length == 0) return AppVersionStatus.invalid;
  if (int.tryParse(splitRemote[0]) > int.tryParse(splitLocal[0])) return AppVersionStatus.outdated;
  if (int.tryParse(splitRemote[0]) < int.tryParse(splitLocal[0])) return AppVersionStatus.updated;
  if (int.tryParse(splitRemote[1]) > int.tryParse(splitLocal[1])) return AppVersionStatus.outdated;
  if (int.tryParse(splitRemote[1]) < int.tryParse(splitLocal[1])) return AppVersionStatus.updated;
  if (int.tryParse(splitRemote[2]) > int.tryParse(splitLocal[2])) return AppVersionStatus.valid;
  if (int.tryParse(splitRemote[2]) < int.tryParse(splitLocal[2])) return AppVersionStatus.updated;
  return AppVersionStatus.updated;
}*/

String ? extractSemanticVersioning(String v) {
  if (v.isEmpty) return null;
  List<String> split = v.split("-");
  if (split.length == 0) return null;
  return split[0];
}

String orderStatus(int value) {
  switch (value) {
    case 2:
      return "Confirmado";

    case 3:
      return "Enviado";

    case 4:
      return "Finalizado";

    case 201:
      return "Alistando";

    case 202:
      return "Empacado";

    default:
      return "";

  }
}

// ignore: missing_return
Map<String, dynamic> orderStatusConfig(int value) {
  Map<String, dynamic> config = {};
  switch (value) {
    case 2:
      config["borderColor"] = Colors.blueAccent;
      config["color"] = Colors.blueAccent.withOpacity(0.3);
      config["label"] = "Confirmado";
      return config;


    case 3:
      config["borderColor"] = Colors.green;
      config["color"] = Colors.green.withOpacity(0.3);
      config["label"] = "Enviado";
      return config;


    case 4:
      config["borderColor"] = Colors.red;
      config["color"] = Colors.red.withOpacity(0.3);
      config["label"] = "Finalizado";
      return config;

    case 201:
      config["borderColor"] = Colors.red;
      config["color"] = Colors.red.withOpacity(0.3);
      config["label"] = "Alistando";
      return config;

    case 202:
      config["borderColor"] = Colors.deepPurpleAccent;
      config["color"] = Colors.deepPurpleAccent.withOpacity(0.3);
      config["label"] = "Empacado";
      return config;

    default:
      return config;

  }
}

String defaultImageProfile() => "https://cdn.pixabay.com/photo/2021/05/05/07/00/bride-6230420__340.jpg";

//"https://3.bp.blogspot.com/-7dGg2SxOnPc/W58gx5zIm3I/AAAAAAAAFCM/ov25hkvKW0I0B-qruNE4_7wP0v7tiW5sQCLcBGAs/s1600/favicon.png";

void showCustomSnackbar(
  String ?title,
  String? subTitle, {
  Icon? icon,
  String? svgIcon,
  SnackPosition? snackPosition,
  Duration? duration,
  void Function() ?onTap,
}) {
  Get.snackbar(
    "",
    "",
    duration: duration ?? Duration(seconds: 3),
    snackPosition: snackPosition ?? SnackPosition.TOP,
    titleText: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) icon else SvgPicture.asset(svgIcon ?? 'not_advertencia.svg'),
        SizedBox(
          width: 16,
        ),
        Flexible(
          child: Text(
            title ?? "",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
    messageText: Row(
      children: [
        Flexible(
          child: Text(
            subTitle ?? "",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    backgroundColor: Color(0xFFF5F5F5),
    borderColor: Color(0xFFDBDBDB),
    borderRadius: 8.0,
    borderWidth: 1,
    onTap: (_) => onTap?.call(),
  );
}

/*Future<PickedFile> picketCamera() async {
  return await ImagePicker().getImage(source: ImageSource.camera);
}*/

/*
AppVersionStatus validateAppVersion({@required String r, @required String l}) {
  if(r == null || l == null) return AppVersionStatus.invalid;
  List<String> splitRemote = extractSemanticVersioning(r).split(".");
  List<String> splitLocal = extractSemanticVersioning(l).split(".");
  if(splitRemote.length == 0 || splitLocal.length == 0) return AppVersionStatus.invalid;
  if(int.tryParse(splitRemote[0]) > int.tryParse(splitLocal[0])) return AppVersionStatus.outdated;
  if(int.tryParse(splitRemote[0]) < int.tryParse(splitLocal[0])) return AppVersionStatus.updated;
  if(int.tryParse(splitRemote[1]) > int.tryParse(splitLocal[1])) return AppVersionStatus.outdated;
  if(int.tryParse(splitRemote[1]) < int.tryParse(splitLocal[1])) return AppVersionStatus.updated;
  if(int.tryParse(splitRemote[2]) > int.tryParse(splitLocal[2])) return AppVersionStatus.valid;
  if(int.tryParse(splitRemote[2]) < int.tryParse(splitLocal[2])) return AppVersionStatus.updated;
  return AppVersionStatus.updated;*/


Future defaultModal({
  @required BuildContext? context,
  @required Widget? child,
  bool ?isDismissible = true,
  bool ?isScrollControlled = true,
  VoidCallback? onCloseModal,
}) async {
  Future<void> future = showModalBottomSheet<void>(
    backgroundColor: Colors.white,
    isScrollControlled: isScrollControlled!,
    isDismissible: isDismissible!,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    context: context!,
    builder: (BuildContext bc) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: child,
        ),
      );
    },
  );
  if (onCloseModal != null) {
    await future.then((void value) => onCloseModal.call());
  } else {
    return await future;
  }
}
