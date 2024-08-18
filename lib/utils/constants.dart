import 'package:flutter/material.dart';

List<Map<String, dynamic>> onboardingDetails = [
  {
    "bgColor": greenColor,
    "image": "assets/images/onboarding1.png",
    "title": "Quality",
    "subTitle":
        "Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain. ",
  },
  {
    "bgColor": orangeColor,
    "image": "assets/images/onboarding2.png",
    "title": "Convenient",
    "subTitle":
        "Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.",
  },
  {
    "bgColor": yellowColor,
    "image": "assets/images/onboarding3.png",
    "title": "Local",
    "subTitle":
        "We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time. ",
  },
];

const Color greenColor = Color.fromRGBO(94, 162, 95, 1);
const Color orangeColor = Color.fromRGBO(213, 113, 91, 1);
const Color yellowColor = Color.fromRGBO(248, 197, 105, 1);

const String appleIcon = "assets/icons/ic_apple.png";
const String googleIcon = "assets/icons/ic_google.png";
const String facebookIcon = "assets/icons/ic_facebook.png";
const String emailIcon = "assets/icons/ic_email.svg";
const String lockIcon = "assets/icons/ic_password.svg";
const String callIcon = "assets/icons/ic_phone.svg";
const String smileIcon = "assets/icons/ic_smile.svg";
const String personIcon = "assets/icons/ic_person.svg";
const String houseIcon = "assets/icons/ic_house.svg";
const String locationIcon = "assets/icons/ic_location.svg";
const String backIcon = "assets/icons/ic_back.svg";
const String businessNameIcon = "assets/icons/ic_business_name.svg";
const String cameraIcon = "assets/icons/ic_camera.svg";
const String downIcon = "assets/icons/ic_down.svg";

const String regexPattern =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

const String businessHoursSubtitle =
    "Choose the hours your farm is open for pickups. This will allow customers to order deliveries.";
const String verificationSubtitle =
    "Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic";

const List<String> weekDays = [
  "M",
  "T",
  "W",
  "Th",
  "F",
  "S",
  "Su",
];
const List<String> deliveryTimings = [
  "8:00am - 10:00am",
  "10:00am - 1:00pm",
  "1:00pm - 4:00pm",
  "4:00pm - 7:00pm",
  "7:00pm - 10:00pm",
];
List<String> statesList = [
  "Alabama",
  "Alaska",
  "Arizona",
  "Arkansas",
  "California",
  "Colorado",
  "Connecticut",
  "Delaware",
  "Florida",
  "Georgia",
  "Hawaii",
  "Idaho",
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Kentucky",
  "Louisiana",
  "Maine",
  "Maryland",
  "Massachusetts",
  "Michigan",
  "Minnesota",
  "Mississippi",
  "Missouri",
  "Montana",
  "Nebraska",
  "Nevada",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "New York",
  "North Carolina",
  "North Dakota",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Pennsylvania",
  "Rhode Island",
  "South Carolina",
  "South Dakota",
  "Tennessee",
  "Texas",
  "Utah",
  "Vermont",
  "Virginia",
  "Washington",
  "West Virginia",
  "Wisconsin",
  "Wyoming"
];

List<Map<String, dynamic>> businessTimingsWithDays = [
  {
    "daySelected": true as bool?,
    "dayValue": "mon",
    "selectedTime":
        List<bool>.generate(deliveryTimings.length, (index) => false),
    "selectedTimeValue": [],
  },
  {
    "daySelected": null as bool?,
    "dayValue": "tue",
    "selectedTime":
        List<bool>.generate(deliveryTimings.length, (index) => false),
    "selectedTimeValue": [],
  },
  {
    "daySelected": null as bool?,
    "dayValue": "wed",
    "selectedTime":
        List<bool>.generate(deliveryTimings.length, (index) => false),
    "selectedTimeValue": [],
  },
  {
    "daySelected": null as bool?,
    "dayValue": "thu",
    "selectedTime":
        List<bool>.generate(deliveryTimings.length, (index) => false),
    "selectedTimeValue": [],
  },
  {
    "daySelected": null as bool?,
    "dayValue": "fri",
    "selectedTime":
        List<bool>.generate(deliveryTimings.length, (index) => false),
    "selectedTimeValue": [],
  },
  {
    "daySelected": null as bool?,
    "dayValue": "sat",
    "selectedTime":
        List<bool>.generate(deliveryTimings.length, (index) => false),
    "selectedTimeValue": [],
  },
  {
    "daySelected": null as bool?,
    "dayValue": "sun",
    "selectedTime":
        List<bool>.generate(deliveryTimings.length, (index) => false),
    "selectedTimeValue": [],
  },
];

Map<String, dynamic> userRegisterDetails = {
  "full_name": "",
  "email": "",
  "phone": "",
  "password": "",
  "role": "farmer",
  "business_name": "",
  "informal_name": "",
  "address": "",
  "city": "",
  "state": "",
  "zip_code": "",
  "registration_proof": "",
  "business_hours": {},
  "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
  "type": "email/facebook/google/apple",
  "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
};

Map<String, dynamic> userLoginDetails = {
  "email": "",
  "password": "",
  "role": "farmer",
  "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
  "type": "email/facebook/google/apple",
  "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
};

Map<String, dynamic> resetPasswordDetails = {
  "token": "",
  "password": "",
  "cpassword": ""
};
