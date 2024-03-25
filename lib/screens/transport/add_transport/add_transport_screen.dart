import 'package:auto_route/auto_route.dart';
import 'package:boat_rent_app/models/transport_model.dart';
import 'package:boat_rent_app/router/router.dart';
import 'package:boat_rent_app/screens/transport/transport_bloc/transport_bloc.dart';
import 'package:boat_rent_app/theme/colors.dart';
import 'package:boat_rent_app/widgets/action_button_widget.dart';
import 'package:boat_rent_app/widgets/textfield_app_widget.dart';
import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AddTransportScreen extends StatefulWidget {
  const AddTransportScreen({super.key});

  @override
  State<AddTransportScreen> createState() => _AddTransportScreenState();
}

class _AddTransportScreenState extends State<AddTransportScreen> {
  final pageController = PageController();

  final rentalCostController = TextEditingController();
  final tenantNameController = TextEditingController();
  final commentController = TextEditingController();

  List<String> transportList = ['Yacht', 'Boat', 'Water scooter'];
  String transport = 'Yacht';
  int _transportIndex = 0;

  List<String> paymentTypeList = ['Weekly', 'Monthly', 'Annually'];
  String paymentType = 'Weekly';
  int _paymentTypeIndex = 0;

  List<String> stateList = ['Perfect', 'Average', 'Bad'];
  String state = 'Perfect';
  int _stateIndex = 0;

  int _pageIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    rentalCostController.dispose();
    tenantNameController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leadingWidth: 110,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              context.router.push(TransportListRoute());
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: AppColors.blue),
                SizedBox(width: 5),
                Text(
                  'Back',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'New transport',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Type of water transport',
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
                      SizedBox(height: 15),
                      TextFieldAppWidget(controller: rentalCostController,
                          title: 'Rental cost, \$'),
                      SizedBox(height: 15),
                      TextFieldAppWidget(controller: tenantNameController,
                          title: 'Who rents from you?'),
                      SizedBox(height: 15),
                      Text(
                        'How often payment is made?',
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
                        listOfChipNames: paymentTypeList,
                        activeBorderColorList: [AppColors.blue],
                        inactiveBorderColorList: [AppColors.black],
                        activeBgColorList: [AppColors.grey],
                        inactiveBgColorList: [AppColors.grey],
                        activeTextColorList: [AppColors.blue],
                        inactiveTextColorList: [AppColors.white],
                        listOfChipIndicesCurrentlySeclected: [
                          _paymentTypeIndex
                        ],
                        shouldWrap: true,
                        checkmarkColor: AppColors.blue,
                        extraOnToggle: (val) {
                          _paymentTypeIndex = val;
                          setState(() {
                            paymentType = paymentTypeList[_paymentTypeIndex];
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      ActionButtonWidget(
                          text: 'Continue', width: double.infinity, onTap: () {
                        if (rentalCostController.text.isNotEmpty &&
                            tenantNameController.text.isNotEmpty && int
                            .tryParse(rentalCostController.text) != null) {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.blue,
                              content: Text(
                                'Firstly, enter information',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          );
                        }
                      })
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'New transport',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFieldAppWidget(controller: commentController,
                          title: 'Write a comment about real estate'),
                      SizedBox(height: 15),
                      Text(
                        'State of transport',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      ChipList(
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        spacing: 10,
                        listOfChipNames: stateList,
                        activeBorderColorList: [AppColors.blue],
                        inactiveBorderColorList: [AppColors.black],
                        activeBgColorList: [AppColors.grey],
                        inactiveBgColorList: [AppColors.grey],
                        activeTextColorList: [AppColors.blue],
                        inactiveTextColorList: [AppColors.white],
                        listOfChipIndicesCurrentlySeclected: [_stateIndex],
                        shouldWrap: true,
                        checkmarkColor: AppColors.blue,
                        extraOnToggle: (val) {
                          _stateIndex = val;
                          setState(() {
                            state = stateList[_stateIndex];
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      ActionButtonWidget(text: 'Add new transport',
                          width: double.infinity,
                          onTap: () {
                            if (commentController.text.isNotEmpty) {
                              context.read<TransportBloc>().add(
                                  AddTransportEvent(transport: TransportModel(
                                      type: transport,
                                      rentalCost: int.parse(rentalCostController.text),
                                      paymentType: paymentType,
                                      tenantName: tenantNameController.text,
                                      state: state,
                                      comment: commentController.text)));
                              context.router.push(TransportListRoute());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.blue,
                                  content: Text(
                                    'Firstly, enter information',
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ),
                              );
                            }
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
