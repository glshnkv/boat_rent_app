import 'package:auto_route/auto_route.dart';
import 'package:boat_rent_app/router/router.dart';
import 'package:boat_rent_app/theme/colors.dart';
import 'package:boat_rent_app/widgets/action_button_widget.dart';
import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();

  List<String> transportList = ['Yacht', 'Boat', 'Water scooter'];
  String transport = 'Yacht';
  int _transportIndex = 0;

  List<String> countList = ['1-3', '4-7', 'More than 7'];
  String count = '1-3';
  int _countIndex = 0;

  int _pageIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/elements/illustration.png',
                      width: 230),
                  SizedBox(height: 100),
                  Text(
                    'Manage your rental',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Keep track of your water transportation rentals',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.white50,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Let’s start',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Which water transport you rent out?',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.white50,
                      ),
                    ),
                    SizedBox(height: 5),
                    ChipList(
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      spacing: 10,
                      listOfChipNames: transportList,
                      activeBorderColorList: [AppColors.blue],
                      inactiveBorderColorList: [AppColors.black],
                      activeBgColorList: [AppColors.grey],
                      inactiveBgColorList: [AppColors.grey],
                      activeTextColorList: [AppColors.blue],
                      inactiveTextColorList: [AppColors.white],
                      listOfChipIndicesCurrentlySeclected: [_transportIndex],
                      shouldWrap: true,
                      checkmarkColor: AppColors.blue,
                      extraOnToggle: (val) {
                        _transportIndex = val;
                        setState(() {
                          transport = transportList[_transportIndex];
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'How many of them?',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.white50,
                      ),
                    ),
                    SizedBox(height: 5),
                    ChipList(
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      spacing: 10,
                      listOfChipNames: countList,
                      activeBorderColorList: [AppColors.blue],
                      inactiveBorderColorList: [AppColors.black],
                      activeBgColorList: [AppColors.grey],
                      inactiveBgColorList: [AppColors.grey],
                      activeTextColorList: [AppColors.blue],
                      inactiveTextColorList: [AppColors.white],
                      listOfChipIndicesCurrentlySeclected: [_countIndex],
                      shouldWrap: true,
                      checkmarkColor: AppColors.blue,
                      extraOnToggle: (val) {
                        _countIndex = val;
                        setState(() {
                          count = countList[_countIndex];
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: _pageIndex == 0 ? 'Next' : 'Continue',
          width: 350,
          onTap: () {
            if (_pageIndex == 0) {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            } else {
              context.router.push(TransportListRoute());
            }
          }),
    );
  }
}
