import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool fullMode = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              // FullVersionCard(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: fullMode ? size.height : 400.0,
                    clipBehavior: Clip.none,
                    enableInfiniteScroll: false,
                    viewportFraction: fullMode ? 1 : 0.8,
                  ),
                  items: [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return FullVersionCard(
                          onTap: () {
                            if (fullMode) {
                              print('object');
                              Future.delayed(
                                300.ms,
                                () {
                                  setState(() {
                                    fullMode = !fullMode;
                                  });
                                },
                              );
                              return;
                            }
                            setState(() {
                              fullMode = !fullMode;
                            });
                          },
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              // Positioned(
              //   bottom: 24,
              //   left: 0,
              //   right: 0,
              //   child: Column(
              //     children: [
              //       AnimatedContainer(
              //         duration: 300.ms,
              //         height: fullMode ? size.height - 64 : 350,
              //         width: fullMode ? size.width : 284,
              //         padding: const EdgeInsets.all(16),
              //         decoration: BoxDecoration(
              //           color: Colors.deepPurple,
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: InkWell(
              //           onTap: () {
              //             setState(() {
              //               fullMode = !fullMode;
              //             });
              //           },
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               // if (fullMode) AnimatedContainer(duration: 300.ms, height: fullMode ? 74 : 0),
              //               AnimatedPadding(
              //                 duration: 200.ms,
              //                 padding: EdgeInsets.only(top: fullMode ? 100 : 0),
              //                 child: const Icon(Icons.badge),
              //               ),
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 mainAxisAlignment: MainAxisAlignment.end,
              //                 children: [
              //                   Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: const [
              //                       Text(
              //                         "12 Task",
              //                         style: TextStyle(
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                       Text(
              //                         "Work",
              //                         style: TextStyle(
              //                           fontSize: 28,
              //                           fontWeight: FontWeight.w700,
              //                         ),
              //                       ),
              //                       SizedBox(height: 16),
              //                       LinearProgressIndicator(
              //                         minHeight: 2,
              //                         value: 0.54,
              //                       ),
              //                     ],
              //                   ),
              //                   AnimatedCrossFade(
              //                     firstChild: AnimatedContainer(
              //                       height: fullMode ? 500 : 0,
              //                       duration: 300.ms,
              //                       child: Stack(
              //                         children: [
              //                           ListView.builder(
              //                             itemCount: 10,
              //                             shrinkWrap: true,
              //                             itemBuilder: (BuildContext context, int index) {
              //                               return Row(children: const [
              //                                 Icon(
              //                                   Icons.check_box,
              //                                   size: 18,
              //                                 ),
              //                                 SizedBox(width: 8),
              //                                 Text(
              //                                   'data',
              //                                   style: TextStyle(
              //                                     fontSize: 16,
              //                                   ),
              //                                 ),
              //                               ]);
              //                             },
              //                           )
              //                         ],
              //                       ),
              //                     ),
              //                     secondChild: const SizedBox(),
              //                     crossFadeState: fullMode ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              //                     duration: 300.ms,
              //                   ),
              //                 ],
              //               ),
              //               // if (fullMode) SizedBox()
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        fullMode ? Icons.arrow_back_rounded : Icons.menu_rounded,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        fullMode ? Icons.more_vert_rounded : Icons.search_rounded,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FullVersionCard extends StatefulWidget {
  const FullVersionCard({Key? key, required this.onTap}) : super(key: key);

  final Function onTap;

  @override
  State<FullVersionCard> createState() => _FullVersionCardState();
}

class _FullVersionCardState extends State<FullVersionCard> {
  bool fullMode = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: 300.ms,
            height: fullMode ? size.height - 64 : 350,
            width: fullMode ? size.width : 284,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                widget.onTap();
                setState(() {
                  fullMode = !fullMode;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // if (fullMode) AnimatedContainer(duration: 300.ms, height: fullMode ? 74 : 0),
                  AnimatedPadding(
                    duration: 200.ms,
                    padding: EdgeInsets.only(top: fullMode ? 100 : 0),
                    child: const Icon(Icons.badge),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "12 Task",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Work",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 16),
                          LinearProgressIndicator(
                            minHeight: 2,
                            value: 0.54,
                          ),
                        ],
                      ),
                      AnimatedCrossFade(
                        firstChild: AnimatedContainer(
                          height: fullMode ? 500 : 0,
                          duration: 300.ms,
                          child: Stack(
                            children: [
                              ListView.builder(
                                itemCount: 10,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(children: const [
                                    Icon(
                                      Icons.check_box,
                                      size: 18,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'data',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ]);
                                },
                              )
                            ],
                          ),
                        ),
                        secondChild: const SizedBox(),
                        crossFadeState: fullMode ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: 300.ms,
                      ),
                    ],
                  ),
                  // if (fullMode) SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
