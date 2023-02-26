import 'package:clock_app/controller/clock_view/clock_view.dart';
import 'package:clock_app/view/clock_view/clock_view.dart';
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
    var offsetSign = '';
    if (!timeZoneString.startsWith('-')) offsetSign = '+';
    print(timeZoneString);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 17, 49),
      body: SafeArea(
        child: Row(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 60,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Clock',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 60,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Clock',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 60,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Clock',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 60,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Clock',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
            ),
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 16, 17, 49),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'clock',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Text(
                      formattedTime,
                      style: const TextStyle(color: Colors.white, fontSize: 64),
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(color: Colors.white, fontSize: 24),
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
