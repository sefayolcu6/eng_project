import 'package:eng_project/category_screens/animals/screen/animals_screen.dart';
import 'package:eng_project/constant/app_constant.dart';

class JobsQuestions {
  static List<Map<String, dynamic>> questions = [
    {
      "Index": 1,
      "Image": ImageConstant.doctor,
      "Options": ["Engineer", "Doctor", "Lawyer", "Teacher"],
      "Result": OptionsEnum.B.name,
      "Name": "Doktor"
    },
    {
      "Index": 2,
      "Image": ImageConstant.engineer,
      "Options": ["Architect", "Engineer", "Programmer", "Scientist"],
      "Result": OptionsEnum.B.name,
      "Name": "Mühendis"
    },
    {
      "Index": 3,
      "Image": ImageConstant.lawyer,
      "Options": ["Judge", "Lawyer", "Prosecutor", "Attorney"],
      "Result": OptionsEnum.B.name,
      "Name": "Avukat"
    },
    {
      "Index": 4,
      "Image": ImageConstant.teacher,
      "Options": ["Professor", "Teacher", "Instructor", "Tutor"],
      "Result": OptionsEnum.B.name,
      "Name": "Öğretmen"
    },
    {
      "Index": 5,
      "Image": ImageConstant.pilot,
      "Options": ["Captain", "Pilot", "Navigator", "Flight Attendant"],
      "Result": OptionsEnum.B.name,
      "Name": "Pilot"
    },
    {
      "Index": 6,
      "Image": ImageConstant.artist,
      "Options": ["Painter", "Sculptor", "Musician", "Artist"],
      "Result": OptionsEnum.D.name,
      "Name": "Sanatçı"
    },
    {
      "Index": 7,
      "Image": ImageConstant.chef,
      "Options": ["Cook", "Chef", "Baker", "Pilot"],
      "Result": OptionsEnum.B.name,
      "Name": "Aşçı"
    },
    {
      "Index": 8,
      "Image": ImageConstant.nurse,
      "Options": ["Nurse", "Paramedic", "Midwife", "Surgeon"],
      "Result": OptionsEnum.A.name,
      "Name": "Hemşire"
    },
    {
      "Index": 9,
      "Image": ImageConstant.firefighter,
      "Options": ["Police Officer", "Firefighter", "Paramedic", "EMT"],
      "Result": OptionsEnum.B.name,
      "Name": "İtfaiyeci"
    },
    {
      "Index": 10,
      "Image": ImageConstant.policeman,
      "Options": ["Detective", "Police Officer", "Sheriff", "Marshal"],
      "Result": OptionsEnum.B.name,
      "Name": "Polis Memuru"
    },
    {
      "Index": 11,
      "Image": ImageConstant.waiter,
      "Options": ["Waiter", "Bartender", "Sommelier", "Chef"],
      "Result": OptionsEnum.A.name,
      "Name": "Garson"
    },
  ];
}
