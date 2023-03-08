import 'package:clock_app/controller/clock_view/clock_view.dart';
import 'package:clock_app/view/clock_view/clock_view.dart';
import 'package:clock_app/view/homo_page/widget/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final now =
        Provider.of<ClockViewProvider>(context, listen: false).currentTime;
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE,d,MMM').format(now);
    var timeZoneString = now.timeZoneOffset.toString().split('.').first;

    return Scaffold(
      backgroundColor: const Color(0xff262A39),
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
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                color: const Color(0xff262A39),
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
                      formattedTime,
                      style: const TextStyle(color: Colors.white, fontSize: 64),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const ClockView(),
                    const Text(
                      'Timezone',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        Text(
                          'UTC $timeZoneString',
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
