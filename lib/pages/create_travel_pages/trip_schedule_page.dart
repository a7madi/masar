import 'package:flutter/material.dart';
import 'package:masar/model/destination.dart';
import 'package:masar/pages/create_travel_pages/widgets/form_text_field_widget.dart';
import 'package:provider/provider.dart';
import '../../provider/trip_details_provider.dart';

class TripScheduleForm extends StatefulWidget {
  const TripScheduleForm({super.key});

  @override
  State<TripScheduleForm> createState() => _TripScheduleFormState();
}

class _TripScheduleFormState extends State<TripScheduleForm> {
  DateTime _date = DateTime.now();
  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 0);
  final _txtCntDateTime = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _txtCntPickupLocation = TextEditingController();
  final _txtCntDropLocation = TextEditingController();
  final List<Destiniation> _dList = [];
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final providerData =
        Provider.of<TripDetailsProvider>(context, listen: true);
    final destiniations = providerData.currentTripDestiniations;
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TxtFormField(
                  textLable: 'نقطة التحميل',
                  textController: _txtCntPickupLocation,
                  maxInputDigits: 50,
                ),
                TxtFormField(
                  textLable: 'نقطة التنزيل',
                  textController: _txtCntDropLocation,
                  maxInputDigits: 50,
                ),
                _dateTimePicker(),
                TextButton(
                    onPressed: () {
                      String desID =  DateTime.now().toIso8601String();
                      providerData.addDestination(Destiniation(
                        id: desID,
                        pickPoint: _txtCntPickupLocation.text,
                        dropPoint: _txtCntDropLocation.text,
                        travelDate: DateTime(_date.year, _date.month, _date.day,
                            _time.hour, _time.minute),
                      ));
                    },
                    child: const Text('أضف الوجهة')),
                if (destiniations.isNotEmpty)
                  Expanded(
                      child: ListView.builder(
                          itemCount: destiniations.length,
                          itemBuilder: (ctx, i) {
                            return _destinationCard(
                                pickup: destiniations[i].pickupLocation,
                                drop: destiniations[i].dropLocation,
                                date: destiniations[i].date,
                                id: destiniations[i].desID,
                               );
                          }))
              ],
            ),
          )),
    );
  }

  Widget _dateTimePicker() {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Future.delayed(Duration.zero)
                .then((_) => _setDate())
                .then((_) => _setTime())
                .then(
                  (_) => _upadteTxtCntDateTime(),
                );
          },
          child: const Text('حدد التاريخ والوقت'),
        ),
        SizedBox(
          height: 80,
          width: 150,
          child: TextField(
            readOnly: true,
            controller: _txtCntDateTime,
          ),
        ),
      ],
    );
  }

  void _setTime() async {
    await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
    ).then((value) {
      if (value == null) {
        return;
      }
      _time = value;
    });
  }

  void _setDate() async {
    var currentDate = DateTime.now();
    await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: currentDate.add(
        const Duration(days: 365),
      ),
    ).then((value) {
      if (value == null) return;
      _date = value;
    });
  }

  void _upadteTxtCntDateTime() {
    setState(() {
      _txtCntDateTime.text =
          '${(_time.hour > 9) ? _time.hour : '0' '${_time.hour}'}:${(_time.minute > 9) ? _time.minute : '0' '${_time.minute}'} - ${_date.toString().substring(0, 10).replaceAll('-', '/')}';
    });
  }

  Card _destinationCard({
    required String pickup,
    required String drop,
    required DateTime date,
    required String id,
  }) {
    final destiniationProvider = Provider.of<TripDetailsProvider>(context,listen: false);
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('نقطة التحميل: $pickup'),
            // SizedBox(
            //   width: 2,
            // ),
            Text('الوجهة: $drop')
          ],
        ),
        subtitle: Text(
            'التاريخ - الوقت: ${date.toString().substring(0, 10).replaceAll('-', '/')} - ${(date.hour > 9) ? date.hour : '0' '${date.hour}'}:${(date.minute > 9) ? date.minute : '0' '${date.minute}'}'),
        leading: IconButton(
            onPressed: () {
              destiniationProvider.removeDestinitaion(id);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ),
    );
  }
}
