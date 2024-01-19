
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'global.dart';
Future<void> createPDF() async {
  var pdf =pw.Document();
  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.zero,
      build: (context) {
        return  pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
          pw.Text("Invoice",style: pw.TextStyle(fontSize: 22,fontWeight: pw.FontWeight.bold),),
            pw.SizedBox(height: 15,),
            pw.Text("Personal Details",style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 20)),
            pw.SizedBox(height: 10,),
            pw.Row(
              mainAxisAlignment:pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Client",style: pw.TextStyle(fontSize: 20)),
                pw.Text("${dataList[0]['name']}",style:  pw.TextStyle(fontWeight:pw.FontWeight.bold,fontSize: 18)),
              ],
            ),
            pw.SizedBox(height: 20,),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Email",style: pw.TextStyle(fontSize: 20)),
                pw.Text("${dataList[1]['email']}",style:  pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 18)),
              ],
            ),
            pw.SizedBox(height: 20,),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Mobile",style: pw.TextStyle(fontSize: 20)),
                pw.Text("${dataList[2]['mobile']}",style:  pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 18)),
              ],
            ),
            pw.SizedBox(height: 5,),
            pw.Divider(),
            pw.Text("purchase items",style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 20,),
            pw.Column(
                children:List.generate(productList.length, (index) => pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Name:${productList[index]["name"]}\n",style:  pw.TextStyle(fontSize: 18),),
                    pw.Text("Price:\$${productList[index]["price"]}\n",style:  pw.TextStyle(fontSize: 18),),
                    pw.Text("Net Quantity:${productList[index]["quantity"]}\n",style:  pw.TextStyle(fontSize: 18),),
                  ],
                ),
                )
            ),
            pw.SizedBox(height: 5,),
            pw.Divider(),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Total",style: pw.TextStyle(fontSize: 18)),
                pw.Text("\$$total",style:  pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 18)),
              ],
            ),
            pw.SizedBox(height: 20,),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Gst",style:pw.TextStyle(fontSize: 18)),
                pw.Text("18%",style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 18)),
              ],
            ),
            pw.SizedBox(height: 20,),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("net_total price",style: pw.TextStyle(fontSize: 18)),
                pw.Text("\$$gst",style:  pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 18)),
              ],
            ),
            pw. SizedBox(height: 5,),
          ],
        );
      }
  )
  );
  await Printing.layoutPdf(onLayout: (format)=>pdf.save(),);
}
