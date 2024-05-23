import 'package:appointment/appointment/bloc/create_appointment_cubit.dart';
import 'package:appointment/providers/appointment_select_provider/user_select.dart';
import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../bloc/create_appointment_state.dart';
import '../widget/custom_dropdown_operations_widget.dart';
import '../widget/custom_dropdown_person_widget.dart';
import '../widget/price_date_widget.dart';
import '../widget/profile_visibility_widget.dart';
import '../widget/text_widget.dart';

class CreateAppointmentPage extends StatefulWidget {
  const CreateAppointmentPage({super.key});

  @override
  State<CreateAppointmentPage> createState() => _AppointmentState();
}

class _AppointmentState extends State<CreateAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CreateAppointmentCubit()
        ..getOperations()
        ..getPersons(),
      child: BlocBuilder<CreateAppointmentCubit, CreateAppointmentState>(
        builder: (context, state) {
          final cubit = context.read<CreateAppointmentCubit>();
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppointmentText(text: LocaleConstants.operation),
                const SizedBox(height: 12),
                if (state.operations.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdownOperationWidget(state: state, cubit: cubit),
                      const SizedBox(height: 20),
                      ProfileVisibility(
                          isSelectPerson:
                              Provider.of<UserSelect>(context).isSelectPerson,
                          selectedPersonProfileUrl:
                              Provider.of<UserSelect>(context)
                                  .selectedPersonProfileUrl,
                          size: size),
                      const SizedBox(height: 18),
                      AppointmentText(text: LocaleConstants.person),
                      const SizedBox(height: 12),
                      CustomDropdownPersonWidget(state: state, cubit: cubit),
                      const SizedBox(
                        height: 50,
                      ),
                      BottomPriceAndDate(
                        priceTop: Provider.of<UserSelect>(context).price,
                        state: state,
                        activeButton:
                            Provider.of<UserSelect>(context).isSelectPerson &&
                                    Provider.of<UserSelect>(context)
                                        .isSelectedOperation
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
