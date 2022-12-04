import 'package:khedni_m3k/View%20Model/payment_reciver_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../account_otp_provider.dart';
import '../add_trip_provider.dart';
import '../add_vehicle_provider.dart';
import '../app_provider.dart';
import '../chat_modal_provider.dart';
import '../create_account_provider.dart';
import '../driver_edit_trip_provider.dart';
import '../driver_setup_provider.dart';
import '../feed_back_provider.dart';
import '../find_trip_provider.dart';
import '../message_provider.dart';
import '../my_offered_trips_provider.dart';
import '../my_profile_provider.dart';
import '../my_trips_provider.dart';
import '../new_password_provider.dart';
import '../recovery_otp_provider.dart';
import '../recovery_provider.dart';
import '../request_trip_provider.dart';
import '../search_result_provider.dart';
import '../trip_details_provider.dart';

List<SingleChildWidget> providersList = [  ChangeNotifierProvider(
          create: (context) => AppProvider()..getSavedTheme()..getSavedLanguage(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountOTPProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddTripProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddVehicleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatModalProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreateAccountProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DriverEditTripProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DriverSetupProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FeedBackProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FindTripProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MessageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyOfferedTripsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyTripsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewPasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecoveryOtpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RcoveryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RequestTripProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchResultProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaymentReciverProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TripDetailsProvider(),
        ),];
