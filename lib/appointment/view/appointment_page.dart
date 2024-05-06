import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:appointment/data/model/operation_model.dart';
import 'package:appointment/appointment/bloc/appointment_cubit.dart';
import 'package:appointment/data/model/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/appointment_state.dart';
import '../widget/price_date_widget.dart';
import '../widget/profile_visibility_widget.dart';
import '../widget/text_widget.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentState();
}

class _AppointmentState extends State<AppointmentPage> {
  late int priceTop = 0;
  bool isSelectPerson = false;
  bool isSelectedOperation = false;
  late String selectedPersonProfileUrl = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AppointmentCubit()
        ..getOperations()
        ..getPersons(),
      child: BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          final cubit = context.read<AppointmentCubit>();
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppointmentText(text: 'Operation Type'),
                const SizedBox(height: 12),
                if (state.operations.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdown<OperationModel>(
                        decoration: const CustomDropdownDecoration(
                          hintStyle: TextStyle(fontWeight: FontWeight.w600),
                          listItemStyle:
                              TextStyle(fontSize: 18, letterSpacing: 1.5),
                        ),
                        hintText: 'Choose a operation',
                        items: state.operations,
                        listItemBuilder:
                            (context, item, isSelected, onItemSelect) => Text(
                          item.name ?? '',
                        ),
                        headerBuilder: (context, selectedItem) => Text(
                          selectedItem.name ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onChanged: (value) {
                          cubit.setSelectedOperation(value);
                          // debugPrint("işlem: ${state.selectedOperation!.name}");
                          setState(() {
                            priceTop = int.parse(value.price ?? "");
                            isSelectedOperation = true;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      ProfileVisibility(
                          isSelectPerson: isSelectPerson,
                          selectedPersonProfileUrl: selectedPersonProfileUrl,
                          size: size),
                      const SizedBox(height: 18),
                      const AppointmentText(text: "Selected Person"),
                      const SizedBox(height: 12),
                      CustomDropdown<PersonModel>(
                        decoration: const CustomDropdownDecoration(
                          hintStyle: TextStyle(fontWeight: FontWeight.w600),
                          listItemStyle:
                              TextStyle(fontSize: 18, letterSpacing: 1.5),
                        ),
                        hintText: 'Choose a person',
                        items: state.persons,
                        listItemBuilder:
                            (context, item, isSelected, onItemSelect) => Text(
                          item.name ?? '',
                        ),
                        headerBuilder: (context, selectedItem) => Text(
                          selectedItem.name ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onChanged: (value) {
                          cubit.setSelectedPerson(value);
                          // debugPrint("kişi: ${state.selectedPerson!.name}");
                          setState(() {
                            isSelectPerson = true;
                            selectedPersonProfileUrl = value.profile!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      BottomPriceAndDate(
                        priceTop: priceTop,
                        state: state,
                        activeButton: isSelectPerson && isSelectedOperation
                            ? true
                            : false,
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
