// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/View%20Model/payment_reciver_provider.dart';

import '../../../Core/utils/Global Widgets/blur_button.dart';
import '../../../Core/utils/Global Widgets/global_bubble_text_form.dart';
import 'Widgets/payment_info_form_field.dart';

class ReciverScreen extends StatefulWidget {
  final String transferCompanyImg;
  final String transferCompanyname;
  const ReciverScreen({
    Key? key,
    required this.transferCompanyImg,
    required this.transferCompanyname,
  }) : super(key: key);

  @override
  State<ReciverScreen> createState() => _ReciverScreenState();
}

class _ReciverScreenState extends State<ReciverScreen> {
  late TextEditingController senderController;
  late TextEditingController payNumController;
  late TextEditingController fromCityController;
  late TextEditingController pointsAmountController;
  late TextEditingController transferController;
  @override
  void initState() {
    senderController = TextEditingController();
    payNumController = TextEditingController();
    fromCityController = TextEditingController();
    transferController = TextEditingController();
    pointsAmountController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    senderController.dispose();
    fromCityController.dispose();
    payNumController.dispose();
    pointsAmountController.dispose();
    transferController.dispose();

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
        body: Consumer<PaymentReciverProvider>(
          builder: (context, myType, child) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        widget.transferCompanyImg,
                        width: 120.w,
                        height: 65.h,
                      ),
                      Text(
                        "${widget.transferCompanyname} EXCHANGE \n Money Transfer Co.",
                        style: Theme.of(context).primaryTextTheme.headline4,
                      )
                    ],
                  ),
                  Text(
                    "trans".tr(context),
                    style: Theme.of(context).primaryTextTheme.overline,
                  ),
                  PaymentInfoFormField(
                    controller: senderController,
                    isReadOnly: false,
                    label: "sender".tr(context),
                  ),
                  PaymentInfoFormField(
                    controller: payNumController,
                    isReadOnly: false,
                    label: "paymentNum".tr(context),
                  ),
                  PaymentInfoFormField(
                    controller: fromCityController,
                    isReadOnly: false,
                    label: "fromCity".tr(context),
                  ),
                  GlobalBubbleTextForm(
                      controller: transferController,
                      isReadOnly: true,
                      onTap: () {
                        myType.upLoadTransferImage(context);
                      },
                      hint: "transImg".tr(context),
                      suffix: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            myType.transferimage != null
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.close,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                          ],
                        ),
                      )),
                  BlurButton(onPress: () {}, label: "addPoint".tr(context))
                ],
              ),
            );
          },
        ));
  }
}
