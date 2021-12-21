import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _homePageAppBar(),
              const SizedBox(height: 20.0),
              const AppLargeText(text: "Discover"),
              const SizedBox(height: 20.0),
              SizedBox(
                // height: 200.0,
                // width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 0.0, right: 20.0),
                    indicatorPadding:
                        const EdgeInsets.only(left: 0.0, right: 20.0),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const _CircleTabIndicator(
                      color: AppColors.mainColor,
                      radius: 4.0,
                    ),
                    tabs: const [
                      Tab(text: "Places"),
                      Tab(text: "Inspiration"),
                      Tab(text: "Emotions"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 300.0,
                width: double.infinity,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Text("Hi"),
                    Text("There"),
                    Text("Bye"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homePageAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.menu),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {},
        ),
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}

class _CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const _CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  const _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    _paint.style = PaintingStyle.fill;

    final Offset circleOffset = Offset(
        (configuration.size!.width / 2) - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
