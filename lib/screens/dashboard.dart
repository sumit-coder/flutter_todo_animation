import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:todo_animation_pro/models/todo_collection_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool fullMode = false;
  int activeTodoCollection = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      // backgroundColor: Colors.black87,
      body: AnimatedContainer(
        duration: 500.ms,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ...fakeData[activeTodoCollection].gradientColors,
              // Color(0xFF63ADEF),
              // Color(0xFF526BE7),
            ],
          ),
        ),
        child: Stack(
          children: [
            // FullVersionCard(),
            Positioned(
              top: 200,
              left: 34,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hello, Jane.",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Looks like feel good. \nyou have 3 task to do today.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeTodoCollection = index;
                    });
                  },
                  height: fullMode ? size.size.height : 400.0,
                  clipBehavior: Clip.none,
                  enableInfiniteScroll: false,
                  viewportFraction: fullMode ? 1 : 0.8,
                  scrollPhysics: fullMode ? const NeverScrollableScrollPhysics() : null,
                ),
                items: fakeData.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return FullVersionCard(
                        todoCollection: item,
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
            Positioned(
              top: size.padding.top,
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
    );
  }
}

class FullVersionCard extends StatefulWidget {
  const FullVersionCard({Key? key, required this.onTap, required this.todoCollection}) : super(key: key);

  final Function onTap;
  final TodoCollectionModel todoCollection;

  @override
  State<FullVersionCard> createState() => _FullVersionCardState();
}

class _FullVersionCardState extends State<FullVersionCard> {
  bool fullMode = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            margin: EdgeInsets.only(bottom: fullMode ? 0 : 24),
            duration: 300.ms,
            height: fullMode ? size.size.height - size.padding.top : 376,
            width: fullMode ? size.size.width : 292,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
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
                    child: Icon(
                      widget.todoCollection.iconData,
                      size: 32,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.todoCollection.listOfTasks.length} Task",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            widget.todoCollection.title,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const LinearProgressIndicator(
                            minHeight: 2,
                            value: 0.54,
                          ),
                        ],
                      ),
                      AnimatedCrossFade(
                        firstChild: AnimatedContainer(
                          height: fullMode ? 500 : 0,
                          duration: 300.ms,
                          // color: Colors.grey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16),
                              const Text(
                                'Today',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 16),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 8,
                                  // shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Theme(
                                          data: Theme.of(context).copyWith(
                                            checkboxTheme: CheckboxThemeData(
                                              checkColor: MaterialStateProperty.all(Colors.white),
                                              fillColor: MaterialStateProperty.all(Colors.orange),
                                            ),
                                          ),
                                          child: Checkbox(
                                            value: true,
                                            onChanged: (value) {},
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Text(
                                          'data',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
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
