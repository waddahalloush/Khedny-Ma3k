import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:khedni_m3k/Core/utils/Localization/app_localizations.dart';
import 'package:khedni_m3k/View%20Model/add_trip_provider.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import 'package:khedni_m3k/View/Screens/Main%20Screen/MY%20Offereed%20Trips/add_vehicle_bottm_sheet.dart';
import 'package:provider/provider.dart';
import '../../../../Core/constants/asset_manager.dart';
import '../Widgets/find_ride_form_widget.dart';

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({Key? key}) : super(key: key);

  @override
  State<AddTripScreen> createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  late TextEditingController pricePerPassengerController;
  late TextEditingController timeController;
  late TextEditingController dateController;
  late TextEditingController originController;
  late TextEditingController stopController;
  late TextEditingController distinationController;
  late TextEditingController infoController;
  late TextEditingController safetyController;
  @override
  void initState() {
    pricePerPassengerController = TextEditingController(text: "");
    timeController = TextEditingController(text: "");
    dateController = TextEditingController(text: "");
    originController = TextEditingController(text: "");
    stopController = TextEditingController(text: "");
    distinationController = TextEditingController(text: "");
    infoController = TextEditingController(text: "");
    safetyController = TextEditingController(text: "");

    super.initState();
  }

  @override
  void dispose() {
    pricePerPassengerController.dispose();
    timeController.dispose();
    dateController.dispose();
    originController.dispose();
    stopController.dispose();
    distinationController.dispose();
    infoController.dispose();
    safetyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text("AddTrip".tr(context),
            style: Theme.of(context).primaryTextTheme.headline1),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(child: Consumer<AddTripProvider>(
        builder: (context, myType, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Image.asset(
                      AssetManager.bigProgress,
                      width: 15,
                      height: 120,
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
                          controller: stopController,
                          color: Theme.of(context).primaryColor,
                          hint: "Stops".tr(context),
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
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Text("costTrip".tr(context),
                        style: Theme.of(context).primaryTextTheme.headline3),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          "500,000",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorLight),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          AssetManager.money,
                          color: Theme.of(context).primaryColorLight,
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    DropdownButton<String>(
                      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                      value: myType.selectedPriceType,
                      items: myType.priceType
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.tr(context),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline3),
                              ))
                          .toList(),
                      onChanged: (value) => myType.setPriceType(value!),
                    ),
                    const Spacer(),
                    Expanded(
                        child: TextFormField(
                      style: Theme.of(context).primaryTextTheme.headline3,
                      onTap: () {
                        showMaterialNumberPicker(
                            context: context,
                            title: "PricePassenger".tr(context),
                            maxNumber: 50000,
                            minNumber: 1000,
                            step: 500,
                            selectedNumber: 1000,
                            onChanged: (value) {
                              pricePerPassengerController.text =
                                  value.toString();
                            });
                      },
                      readOnly: true,
                      showCursor: true,
                      controller: pricePerPassengerController,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          floatingLabelStyle:
                              Theme.of(context).primaryTextTheme.caption,
                          hintText: "Price".tr(context),
                          hintStyle:
                              Theme.of(context).primaryTextTheme.headline3,
                          labelStyle:
                              Theme.of(context).primaryTextTheme.caption),
                      keyboardType: TextInputType.datetime,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset(
                        AssetManager.timer,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                      onTap: () {
                        showMaterialTimePicker(
                            context: context,
                            onChanged: (value) {
                              timeController.text =
                                  "${value.hour} : ${value.minute}";
                            },
                            selectedTime: TimeOfDay.now());
                      },
                      readOnly: true,
                      showCursor: true,
                      style: Theme.of(context).primaryTextTheme.headline3,
                      controller: timeController,
                      decoration: InputDecoration(
                          floatingLabelStyle:
                              Theme.of(context).primaryTextTheme.caption,
                          hintText: "Picktime".tr(context),
                          hintStyle:
                              Theme.of(context).primaryTextTheme.headline3,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          labelStyle:
                              Theme.of(context).primaryTextTheme.caption),
                      keyboardType: TextInputType.datetime,
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset(
                        AssetManager.calender,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                      style: Theme.of(context).primaryTextTheme.headline3,
                      onTap: () {
                        showMaterialDatePicker(
                            context: context,
                            onChanged: (value) {
                              dateController.text =
                                  "${value.year}/${value.month}/${value.day}";
                            },
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                            selectedDate: DateTime.now());
                      },
                      readOnly: true,
                      showCursor: true,
                      controller: dateController,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          floatingLabelStyle:
                              Theme.of(context).primaryTextTheme.caption,
                          hintText: "Pickdate".tr(context),
                          hintStyle:
                              Theme.of(context).primaryTextTheme.headline3,
                          labelStyle:
                              Theme.of(context).primaryTextTheme.caption),
                      keyboardType: TextInputType.datetime,
                    )),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset(
                        AssetManager.door,
                        width: 30,
                        height: 30,
                        color: Colors.grey,
                      ),
                      title: Text(
                        "Door".tr(context),
                        style: Theme.of(context).primaryTextTheme.bodyText2,
                      ),
                      trailing: Container(
                        margin: const EdgeInsets.all(5),
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            gradient: const LinearGradient(colors: [
                              Color(0xFF4776A2),
                              Color(0xFF025099)
                            ])),
                        child: Checkbox(
                          value: myType.isDoorToDoor,
                          activeColor: Colors.transparent,
                          onChanged: (val) {
                            myType.changeDoorToDoor(val!);
                          },
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      leading: Image.asset(
                        AssetManager.smoke,
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        "Smook".tr(context),
                        style: Theme.of(context).primaryTextTheme.bodyText2,
                      ),
                      trailing: Container(
                        margin: const EdgeInsets.all(5),
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            gradient: const LinearGradient(colors: [
                              Color(0xFF4776A2),
                              Color(0xFF025099)
                            ])),
                        child: Checkbox(
                          value: myType.isSmoking,
                          activeColor: Colors.transparent,
                          onChanged: (val) {
                            myType.changeSmoking(val!);
                          },
                        ),
                      ),
                    ),
                    const Divider(thickness: 1),
                    ListTile(
                      leading: Image.asset(
                        AssetManager.air,
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        "Aircondation".tr(context),
                        style: Theme.of(context).primaryTextTheme.bodyText2,
                      ),
                      trailing: Container(
                        margin: const EdgeInsets.all(5),
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            gradient: const LinearGradient(colors: [
                              Color(0xFF4776A2),
                              Color(0xFF025099)
                            ])),
                        child: Checkbox(
                          value: myType.isCondition,
                          activeColor: Colors.transparent,
                          onChanged: (val) {
                            myType.changeCondition(val!);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Additional".tr(context),
                          style: Theme.of(context).primaryTextTheme.bodyText2),
                    ),
                    TextFormField(
                      controller: infoController,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 2,
                      decoration: const InputDecoration(
                        constraints: BoxConstraints(maxHeight: 80),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: context.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(blurRadius: 6, color: Colors.grey.shade300)
                    ],
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: TextButton.icon(
                      onPressed: () {
                        showAddVehicleBottomSheet(context);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Color(0xFFFC6752),
                      ),
                      label: Text(
                        "AddCar".tr(context),
                        style: const TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 18,
                            color: Color(0xFFFC6752),
                            fontWeight: FontWeight.bold),
                      ))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Safety".tr(context),
                          style: Theme.of(context).primaryTextTheme.bodyText2),
                    ),
                    TextFormField(
                      controller: safetyController,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 2,
                      decoration: const InputDecoration(
                        constraints: BoxConstraints(maxHeight: 80),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        width: context.width / 1.5,
                        alignment: Alignment.center,
                        height: 45,
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
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
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
            ],
          );
        },
      )),
    ));
  }
}
