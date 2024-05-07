import 'package:appointment/appointment/bloc/appointment_cubit.dart';
import 'package:appointment/providers/appointment_select_provider.dart/user_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../bloc/appointment_state.dart';
import '../widget/custom_dropdown_operations_widget.dart';
import '../widget/custom_dropdown_person_widget.dart';
import '../widget/price_date_widget.dart';
import '../widget/profile_visibility_widget.dart';
import '../widget/text_widget.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentState();
}

class _AppointmentState extends State<AppointmentPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await context.read<AppointmentCubit>().getOperations().then((_) {
      setState(() {
        isLoading = true;
      });
    });
    await context.read<AppointmentCubit>().getPersons().then((_) {
      setState(() {
        isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? const CircularProgressIndicator()
        : BlocProvider(
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
                            CustomDropdownOperationWidget(
                                state: state, cubit: cubit),
                            const SizedBox(height: 20),
                            ProfileVisibility(
                                isSelectPerson: Provider.of<UserSelect>(context)
                                    .isSelectPerson,
                                selectedPersonProfileUrl:
                                    Provider.of<UserSelect>(context)
                                        .selectedPersonProfileUrl,
                                size: size),
                            const SizedBox(height: 18),
                            const AppointmentText(text: "Selected Person"),
                            const SizedBox(height: 12),
                            CustomDropdownPersonWidget(
                                state: state, cubit: cubit),
                            const SizedBox(
                              height: 50,
                            ),
                            BottomPriceAndDate(
                              priceTop: Provider.of<UserSelect>(context).price,
                              state: state,
                              activeButton: Provider.of<UserSelect>(context)
                                          .isSelectPerson &&
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
