import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/components/color_item.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItemList extends StatefulWidget {
  const ColorItemList({super.key});

  @override
  State<ColorItemList> createState() => _ColorItemListState();
}

class _ColorItemListState extends State<ColorItemList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: kColorList.asMap().entries.map((entry) {
        int index = entry.key;
        int colorValue = entry.value;
        return GestureDetector(
          onTap: () {
            BlocProvider.of<AddNoteCubit>(context).noteColor = colorValue;
            setState(() {
              currentIndex = index;
            });
          },
          child: ColorItem(
            colorValue: colorValue,
            isActive: currentIndex == index,
          ),
        );
      }).toList(),
    );
  }
}
