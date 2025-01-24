import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroll_app/config/app_assets.dart';
import 'package:stroll_app/data/app_assets.dart';
import 'package:stroll_app/presentation/components/custom_text.dart';
import 'package:stroll_app/utils/screen_utils.dart';

import 'components/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: fullHeight(context) * .6,
              width: fullWidth(context),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppAsset.backgroundImg),fit: BoxFit.cover)
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: fullHeight(context) * .5,
              width: fullWidth(context),
              decoration: BoxDecoration(
                  color: AppColors.kBlack,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.04), // Top color with fade
                    Colors.black, // Solid black
                    Colors.black, // Solid black
                    Colors.black, // Solid black
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: fullHeight(context),
            width: fullWidth(context),
            color: AppColors.kBlack.withValues(alpha: .2),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0,left: 10,right: 10),
            child: Column(

              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextView(text: 'Stroll Bonfire', fontSize: 30,fontWeight: FontWeight.w700,color: AppColors.kLightPurple,),
                    Icon(Icons.keyboard_arrow_down,color: AppColors.kWhite,)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    subDetailsWidget(icon: AppAsset.clockIcon,text:'22h 00m',),
                    Gap(30),
                    subDetailsWidget(icon: AppAsset.profileIcon,text:'103'),

                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AppAsset.userImg),
                      radius: 30,
                    ),
                    Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(text: 'Angelina, 28',fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.kWhite,),
                        TextView(text: 'What is your favorite time \nof the day?',fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.kWhite,),
                      ],
                    ),
                  ],
                ),
                Gap(10),
                Center(child: TextView(text: '“Mine is definitely the peace in the morning.”',fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.kPurple,)),
                Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    favTimeWidget(alphaIndex:'A', text:'The peace in the early mornings',index: 0 ),
                    Gap(10),
                    favTimeWidget(alphaIndex:'B', text:'The magical golden hours',index: 1 ),
                  ],
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    favTimeWidget(alphaIndex:'C', text:'The peace in the early mornings',index: 2 ),
                    Gap(10),
                    favTimeWidget(alphaIndex:'D', text:'The magical golden hours',index: 3),
                  ],
                ),
                Gap(20),
                Row(
                  children: [
                    TextView(text: 'Pick your option.\nSee who has a similar mind.',fontSize: 12,color: AppColors.kWhite,),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.kPurple,width: 2)
                      ),
                      child: SvgPicture.asset(AppAsset.microphoneImg, color: AppColors.kPurple,),
                    ),
                    Gap(10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.kPurple,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.kPurple,width: 2)
                      ),
                      child: Icon(Icons.arrow_forward_rounded, color: AppColors.kBlack,),
                    ),
                  ],
                ),
                Gap(20),


              ],
            ).animate()
                .fadeIn(
              duration: 1000.ms,
              curve: Curves.easeIn,
            ),
          )

        ],
      )
    );
  }

  Widget favTimeWidget({alphaIndex, text, index }){
    return GestureDetector(
      onTap: (){
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        height: fullHeight(context) * .1,
        width: fullWidth(context) * .46,
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
        decoration:BoxDecoration(
            color: AppColors.kBlack2,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: currentIndex ==index ? AppColors.kPurple: AppColors.kTransparent, width: 3)
        ),
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                color: currentIndex ==index ? AppColors.kPurple: null,
                  shape: BoxShape.circle,
                  border: Border.all(color: currentIndex ==index ? AppColors.kPurple: AppColors.kLightGrey,width: 2)
              ),
              child: TextView(text: alphaIndex,fontSize: 12 ,fontWeight: FontWeight.w700,color: currentIndex ==index ? AppColors.kWhite: AppColors.kLightGrey,),
            ),
            Gap(10),
            SizedBox(

                width: fullWidth(context) * .3,
                child: TextView(text: text, fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.kLightGrey,))
          ],
        ),
      ),
    );
  }

  Widget subDetailsWidget({icon, text}){
    return  Row(
      children: [
        SvgPicture.asset(icon,color: AppColors.kWhite,),
        Gap(5),
        TextView(text: text,fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.kWhite,)
      ],
    );
  }
}
