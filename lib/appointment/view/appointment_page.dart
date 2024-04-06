import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:appointment/data/model/operation_model.dart';
import 'package:appointment/appointment/bloc/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/appointment_state.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentState();
}

class _AppointmentState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentCubit()..getOperations(),
      child: BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          final cubit = context.read<AppointmentCubit>();
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Operation Type',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(
                  height: 12,
                ),
                if (state.operations.isNotEmpty)
                  CustomDropdown<OperationModel>(
                    hintText: 'Choose a operation',
                    items: state.operations,
                    initialItem: state.operations[0],
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
                    },
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
