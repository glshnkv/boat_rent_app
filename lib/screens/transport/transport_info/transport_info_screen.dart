import 'package:auto_route/auto_route.dart';
import 'package:boat_rent_app/models/transport_model.dart';
import 'package:boat_rent_app/router/router.dart';
import 'package:boat_rent_app/screens/transport/transport_bloc/transport_bloc.dart';
import 'package:boat_rent_app/screens/transport/transport_info/widgets/info_row_widget.dart';
import 'package:boat_rent_app/theme/colors.dart';
import 'package:boat_rent_app/widgets/action_button_widget.dart';
import 'package:boat_rent_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class TransportInfoScreen extends StatefulWidget {
  final TransportModel transport;

  const TransportInfoScreen({super.key, required this.transport});

  @override
  State<TransportInfoScreen> createState() => _TransportInfoScreenState();
}

class _TransportInfoScreenState extends State<TransportInfoScreen> {
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
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Transport info',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InfoRowWidget(
                    icon: 'assets/images/transport-info/type.svg',
                    title: 'Type',
                    value: widget.transport.type,
                    valueColor: AppColors.white),
                SizedBox(height: 20),
                InfoRowWidget(
                    icon: 'assets/images/transport-info/rental-cost.svg',
                    title: 'Rental cost',
                    value: '${widget.transport.rentalCost}\$',
                    valueColor: AppColors.white),
                SizedBox(height: 20),
                InfoRowWidget(
                    icon: 'assets/images/transport-info/payment-type.svg',
                    title: 'Payment type',
                    value: widget.transport.paymentType,
                    valueColor: AppColors.white),
                SizedBox(height: 20),
                InfoRowWidget(
                    icon: 'assets/images/transport-info/who-rent.svg',
                    title: 'Who rent',
                    value: widget.transport.tenantName,
                    valueColor: AppColors.white),
                SizedBox(height: 20),
                InfoRowWidget(
                  icon: 'assets/images/transport-info/state.svg',
                  title: 'State',
                  value: widget.transport.state,
                  valueColor: widget.transport.state == 'Perfect'
                      ? AppColors.green
                      : widget.transport.state == 'Average'
                          ? AppColors.orange
                          : AppColors.red,
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Comment',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.white50,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                        decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Text(
                          widget.transport.comment,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: 'Delete transport',
          width: 350,
          onTap: () {
            context.read<TransportBloc>().add(DeleteTransportEvent(transport: widget.transport));
            context.router.push(TransportListRoute());
          }),
    );
  }
}
