import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:appointment/data/model/operation_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/appointment_select_provider/user_select.dart';
import '../bloc/appointment_cubit.dart';
import '../bloc/appointment_state.dart';

class CustomDropdownOperationWidget extends StatefulWidget {
  final AppointmentState state;
  final AppointmentCubit cubit;

  const CustomDropdownOperationWidget({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  CustomDropdownWidgetState createState() => CustomDropdownWidgetState();
}

class CustomDropdownWidgetState extends State<CustomDropdownOperationWidget> {
  late int priceTop;
  late bool isSelectedOperation;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<OperationModel>(
      decoration: const CustomDropdownDecoration(
        hintStyle: TextStyle(fontWeight: FontWeight.w600),
        listItemStyle: TextStyle(fontSize: 18, letterSpacing: 1.5),
      ),
      hintText: 'Choose a operation',
      items: widget.state.operations,
      listItemBuilder: (context, item, isSelected, onItemSelect) => Text(
        item.name ?? '',
      ),
      headerBuilder: (context, selectedItem) => Text(
        selectedItem.name ?? '',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onChanged: (value) {
        widget.cubit.setSelectedOperation(value);
        setState(() {
          Provider.of<UserSelect>(context, listen: false)
              .changePrice(int.parse(value.price ?? ""));
          Provider.of<UserSelect>(context, listen: false)
              .changeSelectOperation(true);
        });
      },
    );
  }
}
