import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import '../../../../Core/constants/asset_manager.dart';
import '../Widgets/find_ride_form_widget.dart';

void showRequestTripBottomSheet(BuildContext context) => showModalBottomSheet(
      barrierColor: Colors.black45,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      constraints: BoxConstraints(maxHeight: context.height / 1.3),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: context.width,
        height: context.height,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: const [BoxShadow(color: Colors.white)],
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(35))),
        child: const DriverInfoWidget(),
      ),
    );

class DriverInfoWidget extends StatefulWidget {
  const DriverInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DriverInfoWidget> createState() => _DriverInfoWidgetState();
}

class _DriverInfoWidgetState extends State<DriverInfoWidget> {
  late TextEditingController originController;
  late TextEditingController distinationController;
  late TextEditingController infoController;
  late TextEditingController pepoleController;
  @override
  void initState() {
    originController = TextEditingController();
    distinationController = TextEditingController();
    infoController = TextEditingController();
    pepoleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    originController.dispose();
    distinationController.dispose();
    infoController.dispose();
    pepoleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: 35,
                height: 5,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(2.5)),
              )),
          Text("RequestDetail".tr(context),
              style: Theme.of(context).primaryTextTheme.bodyText2),
          const SizedBox(
            height: 30,
          ),
          Text("Tuesday, 17th April",
              style: Theme.of(context).primaryTextTheme.bodyText2),
          Padding(
            padding: const EdgeInsets.only(top: 26, bottom: 22),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              width: context.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(blurRadius: 6, color: Colors.grey.shade300)
                ],
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AssetManager.mediumProgress,
                        width: 20,
                        height: 75,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          FindRideFormWidget(
                            controller: originController,
                            color: Theme.of(context).primaryColor,
                            hint: "Location".tr(context),
                          ),
                          FindRideFormWidget(
                            controller: distinationController,
                            color: Theme.of(context).primaryColorLight,
                            hint: "Destination".tr(context),
                          ),
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    width: context.width / 2,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.asset(
                            AssetManager.group,
                            width: 30,
                            height: 30,
                          ),
                        ),
                        Expanded(
                            child: TextFormField(
                          style: Theme.of(context).primaryTextTheme.headline3,
                          onTap: () {
                            showMaterialNumberPicker(
                                context: context,
                                title: 'NumPeople'.tr(context),
                                maxNumber: 5,
                                minNumber: 1,
                                selectedNumber: 1,
                                onChanged: (value) {
                                  pepoleController.text = value.toString();
                                });
                          },
                          readOnly: true,
                          showCursor: true,
                          controller: pepoleController,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              floatingLabelStyle:
                                  Theme.of(context).primaryTextTheme.caption,
                              hintText: 'NumPeople'.tr(context),
                              hintStyle: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              labelStyle:
                                  Theme.of(context).primaryTextTheme.caption),
                          keyboardType: TextInputType.datetime,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: TextFormField(
                      maxLines: 4,
                      controller: infoController,
                      decoration: InputDecoration(
                        floatingLabelStyle:
                            Theme.of(context).primaryTextTheme.caption,
                        hintText: "Additional".tr(context),
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(onTap: () => Navigator.pop(context),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFC6752),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 20,
                                color: Color.fromARGB(255, 180, 173, 251),
                                offset: Offset(0, 7))
                          ],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child:Text(
                            "SendRequest".tr(context),
                            style: Theme.of(context).primaryTextTheme.headline5,
                            textAlign: TextAlign.center,
                          ),
                        
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
