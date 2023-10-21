import 'package:flutter/material.dart';

const Color kscaffoldColor = Color(0xff333333);
const Color kappbarColor = Color(0xff111111);
final InputDecoration kemailinputDecoration = InputDecoration(
  prefixIcon: Icon(
    Icons.email,
    color: Colors.grey[400],
  ),
  labelStyle: TextStyle(color: Colors.grey[500]),
  floatingLabelStyle: TextStyle(color: Colors.white),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(20),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey[400]!),
    borderRadius: BorderRadius.circular(20),
  ),
  label: Text("Eposta"),
  focusColor: Colors.white,
);
final InputDecoration kpassinputDecoration = InputDecoration(
  prefixIcon: Icon(
    Icons.key,
    color: Colors.grey[400],
  ),
  labelStyle: TextStyle(color: Colors.grey[500]),
  floatingLabelStyle: TextStyle(color: Colors.white),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(20),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey[400]!),
    borderRadius: BorderRadius.circular(20),
  ),
  label: Text("Şifre"),
  focusColor: Colors.white,
);
final ButtonStyle btnStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.white),
    shape: MaterialStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
    ));
TextStyle ktextStyle = const TextStyle(
  color: Colors.white,
  shadows: [
    Shadow(
      blurRadius: 2,
      color: Colors.black,
      offset: const Offset(1, 1),
    )
  ],
);
final TextTheme ktextTheme = TextTheme(
  bodyLarge: ktextStyle,
  bodyMedium: ktextStyle,
  bodySmall: ktextStyle,
  displayLarge: ktextStyle,
  displayMedium: ktextStyle,
  displaySmall: ktextStyle,
  headlineLarge: ktextStyle,
  headlineMedium: ktextStyle,
  headlineSmall: ktextStyle,
  labelLarge: ktextStyle,
  labelMedium: ktextStyle,
  labelSmall: ktextStyle,
  titleSmall: ktextStyle,
  titleLarge: ktextStyle,
  titleMedium: ktextStyle,
);
final knameSearchBar = InputDecoration(
  prefixIcon: Icon(
    Icons.person_rounded,
    color: Colors.grey[400],
  ),
  labelStyle: TextStyle(color: Colors.grey[500]),
  floatingLabelStyle: TextStyle(color: Colors.white),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(20),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey[400]!),
    borderRadius: BorderRadius.circular(20),
  ),
  hintText: "Murad Alizada",
  hintStyle: TextStyle(
    color: Colors.grey[500],
  ),
  focusColor: Colors.white,
);
final InputDecoration kdropDowninputDecoration = InputDecoration(
  border: const OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: Colors.white),
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
  ),
  filled: true,
  hintStyle: TextStyle(color: Colors.grey[400]),
  hintText: "Cinsiyet",
  fillColor: Colors.grey[800],
);
final kcitySearchBar = InputDecoration(
  prefixIcon: Icon(
    Icons.location_on_sharp,
    color: Colors.grey[400],
  ),
  labelStyle: TextStyle(color: Colors.grey[500]),
  floatingLabelStyle: TextStyle(color: Colors.white),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(20),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey[400]!),
    borderRadius: BorderRadius.circular(20),
  ),
  hintText: "City",
  hintStyle: TextStyle(
    color: Colors.grey[500],
  ),
  focusColor: Colors.white,
);

InputDecoration customInputDecoration(
    {IconData? prefixIcon, String hintText = ''}) {
  return InputDecoration(
    hintText: hintText,
    prefixIcon: prefixIcon != null
        ? Icon(
            prefixIcon,
            color: Colors.white,
          )
        : null,
    labelStyle: TextStyle(color: Colors.grey[500]),
    floatingLabelStyle: TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[400]!),
      borderRadius: BorderRadius.circular(20),
    ),
    label: Text(hintText),
    focusColor: Colors.white,
  );
}
