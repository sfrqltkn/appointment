import 'package:appointment/galery/view/galery_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appointment/data/model/galery_view_model.dart';
import 'package:appointment/galery/bloc/galery_cubit.dart';

class GaleryPage extends StatefulWidget {
  const GaleryPage({super.key});

  @override
  State<GaleryPage> createState() => _GaleryPageState();
}

class _GaleryPageState extends State<GaleryPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    context.read<GaleryCubit>().galeryGet().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : BlocBuilder<GaleryCubit, List<Galery>>(
                builder: (context, galeryList) {
                  if (galeryList.isNotEmpty) {
                    return Column(
                      children: List.generate(
                        galeryList.length,
                        (index) => GaleryView(
                          galery: galeryList[index],
                          index: index,
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("No Data"),
                    );
                  }
                },
              ),
      ),
    );
  }
}
