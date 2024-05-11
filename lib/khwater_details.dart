import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search/khwater_model.dart';

class KhwaterDetails extends StatefulWidget {
  static const String routeName = "Kwater Details";

  KhwaterDetails({super.key});

  @override
  State<KhwaterDetails> createState() => _KhwaterDetailsState();
}

class _KhwaterDetailsState extends State<KhwaterDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as KhwaterModel;
    if (verses.isEmpty) {
      loadFile(model.index);
    }
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            model.name,
            style: GoogleFonts.elMessiri(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Card(
          margin: const EdgeInsets.all(12),
          color: Colors.grey[200],
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 15,right: 8,left: 8),
                child: Text(
                  verses[index],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.elMessiri(fontSize: 20,color:Colors.black87),
                ),
              );
            },
            itemCount: verses.length,
          ),
        ),
      ),
    );
  }

  Future<void> loadFile(int index) async {
    String khwater =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = khwater.split("\n");
    verses = lines;
    setState(() {});
  }
}
