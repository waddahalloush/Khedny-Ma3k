// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:khedni_m3k/Core/utils/Global%20Widgets/blur_button.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/View/Screens/My%20Payment%20Screen/reciver_screen.dart';

import '../../../Core/constants/asset_manager.dart';
import 'Widgets/payment_info_form_field.dart';

class SenderScreen extends StatefulWidget {
  final String transferCompanyImg;
  final String transferCompanyname;
  const SenderScreen({
    Key? key,
    required this.transferCompanyImg,
    required this.transferCompanyname,
  }) : super(key: key);

  @override
  State<SenderScreen> createState() => _SenderScreenState();
}

class _SenderScreenState extends State<SenderScreen> {
  late TextEditingController recipientController;
  late TextEditingController cityController;
  late TextEditingController phoneController;
  late TextEditingController infoController;
  @override
  void initState() {
    recipientController = TextEditingController(text: "AZZAM NAWAF ALKANJ");
    cityController = TextEditingController(text: "TARTOUS");
    phoneController = TextEditingController(text: "099843305");
    infoController = TextEditingController(
        text:
            "Additional info from driver, lorem ipsum dolor sitametm cinsectetur Additional info from driver, lorem ipsum dolor sitametm");

    super.initState();
  }

  @override
  void dispose() {
    recipientController.dispose();
    cityController.dispose();
    phoneController.dispose();
    infoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Add Points"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  widget.transferCompanyImg,
                  width: 150.w,
                  height: 100.h,
                ),
                Text(
                  "${widget.transferCompanyname} EXCHANGE \n Money Transfer Co.",
                  style: Theme.of(context).primaryTextTheme.headline4,
                )
              ],
            ),
            Text(
              "sendInfo".tr(context),
              style: Theme.of(context).primaryTextTheme.overline,
            ),
            PaymentInfoFormField(
              controller: recipientController,
              isReadOnly: true,
              label: "recipient".tr(context),
            ),
            PaymentInfoFormField(
              controller: cityController,
              isReadOnly: true,
              label: "toCity".tr(context),
            ),
            PaymentInfoFormField(
              controller: phoneController,
              isReadOnly: true,
              label: "PhoneNumber".tr(context),
            ),
            Text(
              "Additional".tr(context),
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: const Color(0XFF004E98)),
            ),
            TextFormField(
              controller: infoController,
              style: Theme.of(context).primaryTextTheme.caption,
              maxLines: 3,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SelectedTransferCompany(
                  transferCoImg: AssetManager.haram,
                  isSelect:
                      widget.transferCompanyname == "Al Haram" ? true : false,
                ),
                SelectedTransferCompany(
                  transferCoImg: AssetManager.kadmous,
                  isSelect:
                      widget.transferCompanyname == "Al Kadmous" ? true : false,
                ),
                SelectedTransferCompany(
                  transferCoImg: AssetManager.fouad,
                  isSelect:
                      widget.transferCompanyname == "Al Fouad" ? true : false,
                ),
              ],
            ),
            BlurButton(
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReciverScreen(
                            transferCompanyImg: widget.transferCompanyImg,
                            transferCompanyname: widget.transferCompanyname),
                      ));
                },
                label: "Next".tr(context))
          ],
        ),
      ),
    );
  }
}

class SelectedTransferCompany extends StatelessWidget {
  final String transferCoImg;
  final bool isSelect;
  const SelectedTransferCompany({
    Key? key,
    required this.transferCoImg,
    required this.isSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: isSelect
              ? Border.all(color: Theme.of(context).primaryColor, width: 2)
              : null),
      child: Image.asset(
        transferCoImg,
        width: 101.w,
        height: 64.h,
      ),
    );
  }
}
