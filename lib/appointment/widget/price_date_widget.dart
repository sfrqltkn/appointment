import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';

import '../bloc/create_appointment_state.dart';
import '../view/choose_date_page.dart';

class BottomPriceAndDate extends StatelessWidget {
  const BottomPriceAndDate(
      {super.key,
      required this.priceTop,
      required this.state,
      required this.activeButton});

  final int priceTop;
  final CreateAppointmentState state;
  final bool activeButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "$priceTop TL",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                  backgroundColor: activeButton ? Colors.brown : null,
                  foregroundColor: activeButton ? Colors.white : null,
                ),
                icon: const Icon(Icons.calendar_month),
                onPressed: () {
                  if (state.selectedPerson != null &&
                      state.selectedOperation != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseDatePage(
                          price: priceTop.toString(),
                          state: state,
                        ),
                      ),
                    );
                  }
                },
                label: Text(
                  LocaleConstants.dateTimeButton,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
