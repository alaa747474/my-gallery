import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class UploadImageSourceButton extends StatelessWidget {
  const UploadImageSourceButton({super.key, required this.image, required this.text, required this.color, required this.onPressed});
  final String image;
  final String text;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r)
        ),
        fixedSize: Size(150.r, 40.r), 
        maximumSize: Size(150.r, 60.r),
        elevation: 0,
        backgroundColor: color
      ),
      onPressed: onPressed, child: Row(
      children: [
        Image.asset(image,width: 30.r,height: 30.r,fit: BoxFit.cover,),
        Text(text,style: Theme.of(context).textTheme.titleLarge,),
      ],
    ));
  }
}