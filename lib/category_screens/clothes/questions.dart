import 'package:eng_project/category_screens/animals/screen/animals_screen.dart';
import 'package:eng_project/constant/app_constant.dart';

class ClothesQuestions {
  static List<Map<String, dynamic>> questions = [
    {
      "Index": 1,
      "Image": ImageConstant.shirt,
      "Options": ["Jeans", "Shirt", "Dress", "Skirt"],
      "Result": OptionsEnum.B.name,
      "Name": "Gömlek"
    },
    {
      "Index": 2,
      "Image": ImageConstant.skirt,
      "Options": ["Shorts", "Skirt", "Pants", "Leggings"],
      "Result": OptionsEnum.B.name,
      "Name": "Etek"
    },
    {
      "Index": 3,
      "Image": ImageConstant.dress,
      "Options": ["Suit", "Dress", "Blouse", "Jumpsuit"],
      "Result": OptionsEnum.B.name,
      "Name": "Elbise"
    },
    {
      "Index": 4,
      "Image": ImageConstant.shoe,
      "Options": ["High Heels", "Sneakers", "Shoe", "Boots"],
      "Result": OptionsEnum.C.name,
      "Name": "Ayakkabı"
    },
    {
      "Index": 5,
      "Image": ImageConstant.boot,
      "Options": ["Sandals", "Flats", "Heels", "Boots"],
      "Result": OptionsEnum.D.name,
      "Name": "Bot"
    },
    {
      "Index": 6,
      "Image": ImageConstant.suit,
      "Options": ["Suit", "Tuxedo", "Blazer", "Coat"],
      "Result": OptionsEnum.A.name,
      "Name": "Takım Elbise"
    },
    {
      "Index": 7,
      "Image": ImageConstant.jean,
      "Options": ["Jeans", "Trousers", "Chinos", "Cargo Pants"],
      "Result": OptionsEnum.A.name,
      "Name": "kot Pantolon"
    },
    {
      "Index": 8,
      "Image": ImageConstant.tie,
      "Options": ["Bow Tie", "Necktie", "Scarf", "Tie"],
      "Result": OptionsEnum.D.name,
      "Name": "Kravat"
    },
    {
      "Index": 9,
      "Image": ImageConstant.scarf,
      "Options": ["T-Shirt", "Scarf", "Shoe", "Shirt"],
      "Result": OptionsEnum.B.name,
      "Name": "Atkı"
    },
    {
      "Index": 10,
      "Image": ImageConstant.cardigan,
      "Options": ["Sweater", "Cardigan", "Pullover", "Hoodie"],
      "Result": OptionsEnum.B.name,
      "Name": "Hırka"
    },
  ];
}
