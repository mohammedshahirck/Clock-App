import 'package:clock_app/controller/clock_view/clock_view.dart';
import 'package:clock_app/view/clock_view/clock_view.dart';
import 'package:clock_app/view/homo_page/widget/side_menu_item.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final now =
        Provider.of<ClockViewProvider>(context, listen: false).currentTime;

    return Scaffold(
      // backgroundColor: const Color(0xff262A39),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Row(
          children: [
            Column(
              children: const [
                SizedBox(
                  height: 200,
                ),
                SideMenu(
                  colors: Color.fromARGB(255, 155, 233, 225),
                  icon: Icons.watch_later_outlined,
                  text: 'Clock',
                  size: 29,
                ),
                SizedBox(
                  height: 20,
                ),
                SideMenu(
                  colors: Color.fromARGB(255, 104, 115, 186),
                  size: 29,
                  icon: Icons.alarm,
                  text: 'Alaram',
                ),
                SizedBox(
                  height: 20,
                ),
                SideMenu(
                  colors: Color.fromARGB(255, 133, 185, 228),
                  size: 29,
                  icon: Icons.timer_outlined,
                  text: 'Timer',
                ),
                SizedBox(
                  height: 20,
                ),
                SideMenu(
                  colors: Color.fromARGB(255, 179, 174, 128),
                  size: 29,
                  icon: Icons.more_time_rounded,
                  text: 'Stopwatch',
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                // color: const Color(0xff262A39),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      'clock',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${now.hour}:${now.minute}',
                      style: const TextStyle(color: Colors.white, fontSize: 64),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${now.day} /${now.month} /${now.year}',
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: const ClockView(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Timezone',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        const Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        Text(
                          '${now.timeZoneName} UTC',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
