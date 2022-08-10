import 'package:flutter/material.dart';
import 'package:mmbl/constant/emergency.dart';

class EmergencyView extends StatelessWidget {
  const EmergencyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: emergencyList.length,
      itemBuilder: (context,index){
        final emergency = emergencyList[index];
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
          child: Container(
            color: Colors.red,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(emergency.image),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(emergency.mmName,
                    style: Theme.of(context).
                    textTheme.titleLarge?.copyWith(color: Colors.white),),
                    Text(emergency.enName,
                    style: Theme.of(context).
                    textTheme.titleLarge?.copyWith(color: Colors.white),),
                   
                  ],
                ),
                IconButton(
                  onPressed: (){

                  }, 
                  icon: const Icon(Icons.phone,color: Colors.white,size: 35),
                ),
              ],
            ),
          ),
        );
      }
      );
  }
}