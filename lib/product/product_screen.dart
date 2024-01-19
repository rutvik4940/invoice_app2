import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/global.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Generate invoice",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
               const SizedBox(height: 10,),
               Column(
                 children: List.generate(productList.length, (index) => Row(
                   children: [
                     Expanded(
                       child: TextFormField(
                         controller:productList[index]["text1"] ,
                         decoration: const InputDecoration(
                           hintText: "Name",
                         ),
                       ),
                     ),
                     const SizedBox(width: 10,),
                     Expanded(
                       child: TextFormField(
                         controller:productList[index]["text2"] ,
                         decoration: const InputDecoration(
                           hintText: "Price",
                         ),
                       ),
                     ),
                     const SizedBox(width: 10,),
                     Expanded(
                       child: TextFormField(
                         controller:productList[index]["text3"] ,
                         decoration: const InputDecoration(
                           hintText: "Quantity",
                            ),
                          ),
                     ),
                      IconButton(
                         onPressed: (){
                           setState(() {
                            productList.removeAt(index);
                           });
                         },
                         icon:  const Icon(Icons.delete)),
                      ],
                    ),
                  ),

               ),
                SizedBox(height: 10,),
                Center(
                  child: ElevatedButton(onPressed: () {
                    setState(() {
                      productList.add({"name":"","price":0,"quantity":0,"text1":TextEditingController(),"text2":TextEditingController(),"text3":TextEditingController()});
                    });
                  }, child:const Text("ADD")),
                ),
                Center(
                  child: ElevatedButton(onPressed: () {
                    setState(() {
                      for(int r=0;r<productList.length;r++)
                        {
                          productList[r]["name"]=productList[r]["text1"].text;
                          productList[r]["price"]=int.parse("${productList[r]["text2"].text}");
                          productList[r]["quantity"]=int.parse("${productList[r]["text3"].text}");

                        }
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Your Data Is Updated"),));
                      Navigator.pushNamed(context, 'cart');
                    });
                  }, child: const Text("SUBMIT")),
                ),
               ]
             ),
           ),
        ),
      ),
    );
  }
}
