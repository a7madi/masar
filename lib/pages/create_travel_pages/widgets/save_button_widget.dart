import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/trip_details_provider.dart';

class SaveBtn extends StatelessWidget {
  const SaveBtn({
    super.key,
 });


  @override
  Widget build(BuildContext context) {
        final dp = Provider.of<TripDetailsProvider>(context, listen: true);

    return Container(
        decoration: const BoxDecoration(color: Colors.blue),
        child: TextButton(child:  Text('الحفظ وتصدير إشعار الرحلة',style: TextStyle(color: dp.isTripReady? Colors.white : Colors.white38),),onPressed: (){
          if(dp.isTripReady){
            dp.addNewTripToTrips();
          }
          return;
        },));
  }
}