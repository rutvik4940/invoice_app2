import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/global.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<TextEditingController>controller=[TextEditingController()];
  List<TextEditingController>controller1=[TextEditingController()];
  List<TextEditingController>controller2=[TextEditingController()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Generate invoice",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
             const SizedBox(height: 10,),
             Column(
               children: List.generate(controller.length, (index) => Row(
                 children: [
                   Expanded(
                     child: TextFormField(
                       controller:controller[index] ,
                       onFieldSubmitted: (value) {
                         dataList.add(value);
                         print(dataList);
                       },
                       decoration: const InputDecoration(
                         hintText: "Name",
                       ),
                     ),
                   ),
                   const SizedBox(width: 10,),
                   Expanded(
                     child: TextFormField(
                       controller:controller1[index] ,
                       onFieldSubmitted: (value) {
                         dataList.add(value);
                         print(dataList);
                       },
                       decoration: const InputDecoration(
                         hintText: "Price",
                       ),
                     ),
                   ),
                   const SizedBox(width: 10,),
                   Expanded(
                     child: TextFormField(
                       controller:controller2[index] ,
                       onFieldSubmitted: (value) {
                         dataList.add(value);
                         print(dataList);
                       },
                       decoration: const InputDecoration(
                         hintText: "Quantity",
                          ),
                        ),
                   ),
                    IconButton(
                       onPressed: (){
                         setState(() {
                           controller.removeAt(index);
                         });
                       },
                       icon:  const Icon(Icons.delete)),
                    ],
                  ),
                ),

             ),
              Center(
                child: ElevatedButton(onPressed: () {
                  setState(() {
                    controller.add(TextEditingController());
                    controller1.add(TextEditingController());
                    controller2.add(TextEditingController());
                  });
                }, child:const Text("ADD")),
              ),
             ]
           ),
         ),
      ),
    );
  }
}
