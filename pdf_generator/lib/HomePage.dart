import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_generator/PDFPreviewScreen.dart';

class MyHomePage extends StatelessWidget {
  final pdf = pw.Document();
  writeOnPDF(){
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(30),
      build: (pw.Context context){
        return <pw.Widget>[
          pw.Header(
            level: 0,
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: <pw.Widget>[
                pw.Text("Flutter PDF GENERATOR", textScaleFactor: 2),
              ]
            )
          ),
          pw.Header(level: 1,text: "What is Lorem Ipsum?"),
          pw.Paragraph(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellus olestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam lputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum."),
          pw.Paragraph(
              text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellus olestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam lputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum."),
          pw.Header(level: 1,text: "Hi, This is Header"),
          pw.Paragraph(
              text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellus olestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam lputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum."),
          pw.Paragraph(
              text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellus olestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam lputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum."),
          pw.Padding(padding: pw.EdgeInsets.all(10)),
          pw.Table.fromTextArray(context: context, data: const <List<String>>[
            <String>['Year', 'Sample'],
            <String>['SN0', 'GFG1'],
            <String>['SN1', 'GFG2'],
            <String>['SN2', 'GFG3'],
            <String>['SN3', 'GFG4'],
          ]),
        ];
      }
    ));
  }

  Future savePDF() async{
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String docPath = docDirectory.path;
    File file = File("$docPath/example.pdf");
    file.writeAsBytesSync(pdf.save() as List<int>);
  }
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("PDF Generator",style: TextStyle(fontFamily: 'BioRhyme'),)),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)
            )
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo)),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigo)),
              child: Text("VIEW PDF", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black
              ),),
              onPressed: () async{
                writeOnPDF();
                await savePDF();
                Directory docDirectory = await getApplicationDocumentsDirectory();
                String docPath = docDirectory.path;
                String path = "$docPath/example.pdf";

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PDFPreviewScreen(path: path)));
              },
              ),
            )
          ],
        ),
      ),
    );
  }
}
