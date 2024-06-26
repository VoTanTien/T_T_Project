import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_t_project/common_widget/assessment_product.dart';
import 'package:t_t_project/constants/colors.dart';
import 'package:t_t_project/constants/image_strings.dart';
import 'package:t_t_project/objects/product_manager.dart';
import 'package:t_t_project/screens/product_detail.dart';

class assessmentScreen extends StatefulWidget{
  @override
  State<assessmentScreen> createState() => _assessmentScreenState();
}

class _assessmentScreenState extends State<assessmentScreen> {
  bool isClickUnRated = true;
  bool isClickRated = false;
  ProductManager productManager = ProductManager();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Assessment',
              style: GoogleFonts.inter(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
          centerTitle: true,
          backgroundColor: blackColor,
          leading: BackButton(
            color: Colors.white,
          ),
        ),
        body: Container(
          color: blackColor,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          backgroundColor: isClickUnRated ? redColor : blackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            isClickUnRated = true;
                            isClickRated = false;
                          });
                        },
                        child: Text(
                          'Un Rated',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 2,
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          backgroundColor: isClickRated ? redColor : blackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            isClickUnRated = false;
                            isClickRated = true;
                          });
                        },
                        child: Text(
                          'Rated',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 0,
                  runSpacing: 10,
                  children: productManager.products.take(3).map((e) {
                    return AssessmentItem(
                      subimage: e.image,
                      price: e.discountPrice ?? e.price,
                      option: e.option,
                      title: e.title,
                    );
                  }).toList()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}