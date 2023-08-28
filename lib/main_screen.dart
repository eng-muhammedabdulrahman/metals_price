
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metals_price/cubit/cubit.dart';
import 'package:metals_price/cubit/states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()
        ..getGoldPrice()
        ..getSilverPrice(),
      child: BlocConsumer<MainCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[800],
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TODAY ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        shadows: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(2, 2),
                              blurRadius: 5)
                        ]),
                  ),
                  Text(
                    'PRICE ',
                    style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        shadows: [
                          BoxShadow(
                              color: Colors.yellow,
                              offset: Offset(2, 2),
                              blurRadius: 5)
                        ]),
                  ),
                ],
              )),
            ),
            body: Container(
              padding:
                  const EdgeInsets.only(top: 50, bottom: 8, right: 8, left: 8),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/gold.png',
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width / 2.5,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'GOLD',
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width / 8,
                              shadows: [
                                BoxShadow(
                                    color: Colors.yellow[300]!,
                                    offset: const Offset(2, 2),
                                    blurRadius: 5)
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '  ${MainCubit.get(context).goldI}💲',
                          style: TextStyle(
                            color: Colors.orange[600],
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width / 14,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/silver.png',
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width / 2.5,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'SILVER',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width / 8,
                              shadows: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(2, 2),
                                    blurRadius: 5)
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '  ${MainCubit.get(context).silverI}💲',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width / 14,
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
