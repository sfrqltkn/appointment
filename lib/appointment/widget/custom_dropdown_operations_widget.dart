import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:appointment/data/model/operation_model.dart';
import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/appointment_select_provider/user_select.dart';
import '../bloc/create_appointment_state.dart';
import '../bloc/create_appointment_cubit.dart';

class CustomDropdownOperationWidget extends StatefulWidget {
  final CreateAppointmentState state;
  final CreateAppointmentCubit cubit;

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
      overlayHeight: 350,
      decoration: const CustomDropdownDecoration(
        hintStyle: TextStyle(fontWeight: FontWeight.w600),
        listItemStyle: TextStyle(fontSize: 18, letterSpacing: 1.5),
      ),
      hintText: LocaleConstants.customDropdownOperation,
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
