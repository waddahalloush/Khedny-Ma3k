import 'package:flutter/material.dart';
import 'package:khedni_m3k/Core/utils/media_query_ex.dart';
import '../../../../Core/constants/asset_manager.dart';
import '../../Main Screen/Widgets/find_ride_form_widget.dart';

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
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
        child: const DriverInfoWidget(),
      ),
    );

class DriverInfoWidget extends StatelessWidget {
  const DriverInfoWidget({
    Key? key,
  }) : super(key: key);

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
                    color: const Color(0XFFE4E6E9),
                    borderRadius: BorderRadius.circular(2.5)),
              )),
          Text("Enter the details for your request",
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
                  color: const Color(0xFFFFFFFF)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AssetManager.mediumProgress,
                        width: 20,
                        height: 85,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            FindRideFormWidget(
                              color: Theme.of(context).primaryColor,
                              hint: "Location",
                            ),
                            FindRideFormWidget(
                              color: Theme.of(context).primaryColorLight,
                              hint: "Destination",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: context.width / 2,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Image.asset(
                              AssetManager.group,
                              width: 20,
                              height: 20,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  floatingLabelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption,
                                  hintText: "Number of people",
                                  labelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .caption),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        floatingLabelStyle:
                            Theme.of(context).primaryTextTheme.caption,
                        hintText: "Addtional Info",
                        enabledBorder: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
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
                          "Send Request",
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





