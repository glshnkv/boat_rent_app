import 'package:auto_route/auto_route.dart';
import 'package:boat_rent_app/models/transport_model.dart';
import 'package:boat_rent_app/router/router.dart';
import 'package:boat_rent_app/screens/transport/transport_bloc/transport_bloc.dart';
import 'package:boat_rent_app/theme/colors.dart';
import 'package:boat_rent_app/widgets/action_button_widget.dart';
import 'package:boat_rent_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TransportListScreen extends StatefulWidget {
  const TransportListScreen({super.key});

  @override
  State<TransportListScreen> createState() => _TransportListScreenState();
}

class _TransportListScreenState extends State<TransportListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.router.push(SettingsRoute());
                      },
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.router.push(NewsListRoute());
                      },
                      child: Text(
                        'News',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                BlocProvider(
                  create: (context) =>
                      TransportBloc()..add(GetAllTransportsEvent()),
                  child: BlocConsumer<TransportBloc, TransportState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is EmptyTransportsListState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/elements/illustration.png',
                                width: 230),
                            SizedBox(height: 100),
                            Text(
                              'There\'s no info',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 32,
                                color: AppColors.blue,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 220,
                              child: Text(
                                'To add your first water transport click on the button below',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColors.white50,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (state is LoadedAllTransportsState) {
                        if (state.transports.length == 1) {
                          final TransportModel transport = state.transports[0];
                          return Column(
                            children: [
                              Text(
                                'Main',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  context.router.push(TransportInfoRoute(transport: transport));
                                },
                                child: AppContainer(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            transport.type,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                              color: transport.state == 'Perfect'
                                                  ? AppColors.green
                                                  : transport.state == 'Average'
                                                      ? AppColors.orange
                                                      : AppColors.red,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '${transport.rentalCost}\$ ${transport.paymentType}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: AppColors.white50,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 5),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Main',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 32,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(vertical: 16),
                                itemCount: state.transports.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(height: 15),
                                itemBuilder: (BuildContext context, int index) {
                                  final transport = state.transports[index];
                                  return GestureDetector(
                                    onTap: () {
                                      context.router.push(TransportInfoRoute(transport: transport));
                                    },
                                    child: AppContainer(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            transport.type,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: transport.state == 'Perfect'
                                                  ? AppColors.green
                                                  : transport.state == 'Average'
                                                      ? AppColors.orange
                                                      : AppColors.red,
                                            ),
                                          ),
                                          Text(
                                            '${transport.rentalCost}\$ ${transport.paymentType}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: AppColors.white50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        }
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: 'Add new transport',
          width: 350,
          onTap: () {
            context.router.push(AddTransportRoute());
          }),
    );
  }
}
