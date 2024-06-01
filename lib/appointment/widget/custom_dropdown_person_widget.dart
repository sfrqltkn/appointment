import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/model/person_model.dart';
import '../../providers/appointment_select_provider/user_select.dart';
import '../bloc/create_appointment_state.dart';
import '../bloc/create_appointment_cubit.dart';

class CustomDropdownPersonWidget extends StatefulWidget {
  final CreateAppointmentState state;
  final CreateAppointmentCubit cubit;

  const CustomDropdownPersonWidget({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  CustomDropdownPersonWidgetState createState() =>
      CustomDropdownPersonWidgetState();
}

class CustomDropdownPersonWidgetState
    extends State<CustomDropdownPersonWidget> {
  late bool isSelectPerson;
  late String selectedPersonProfileUrl;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<PersonModel>(
      overlayHeight: 280,
      decoration: const CustomDropdownDecoration(
        hintStyle: TextStyle(fontWeight: FontWeight.w600),
        listItemStyle: TextStyle(fontSize: 18, letterSpacing: 1.5),
      ),
      hintText: LocaleConstants.customDropdownPerson,
      items: widget.state.persons,
      listItemBuilder: (context, item, isSelected, onItemSelect) => Text(
        item.name ?? '',
      ),
      headerBuilder: (context, selectedItem) => Text(
        selectedItem.name ?? '',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onChanged: (value) {
        widget.cubit.setSelectedPerson(value);
        setState(() {
          Provider.of<UserSelect>(context, listen: false)
              .changeSelectPerson(true);
          Provider.of<UserSelect>(context, listen: false)
              .changePersonUrl(value.profile!);
        });
      },
    );
  }
}
