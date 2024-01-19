import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/global.dart';
import '../utils/pdf.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sum();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Invoice",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Client",style: TextStyle(fontSize: 20)),
                      Text("${dataList[0]['name']}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Email",style: TextStyle(fontSize: 20)),
                      Text("${dataList[1]['email']}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Moblie",style: TextStyle(fontSize: 20)),
                      Text("${dataList[2]['moblie']}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Divider(),
                  Column(
                      children:List.generate(productList.length, (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Name:${productList[index]["name"]}\n",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text("Price:\$${productList[index]["price"]}\n",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text("Net Quantity:${productList[index]["quantity"]}\n",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        ],
                      ))
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total",style: TextStyle(fontSize: 18)),
                      Text("$total",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gst",style: TextStyle(fontSize: 18)),
                      Text("18%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("net_total price",style: TextStyle(fontSize: 18)),
                      Text("$gst",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 5,),
                ],
              ),
            ),
          ),

          floatingActionButton: FloatingActionButton(
             onPressed: () {
              setState(() {
                createPDF();
              });
             },
           child: Icon(Icons.save),
          ),

    )
    );
  }
}
