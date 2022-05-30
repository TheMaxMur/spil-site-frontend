import 'package:flutter/material.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    if (currentWidth > 900) {
    return Container(
      constraints: BoxConstraints(maxWidth: 750),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'СПИЛ',
            style: TextStyle(fontWeight: FontWeight.w800, height: 0.9, fontSize: 80),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  'Студенческая проектно-исследовательская лаборатория – это центр, предоставляющий его участникам возможность принимать участие в научной деятельности ВУЗа.',
                  style: TextStyle(fontSize: 21, height: 1.7),
                ),
              ),
            ],
          )
        ],
      ),
    );
    }
    else {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
        width: currentWidth-50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'СПИЛ',
              style: TextStyle(fontWeight: FontWeight.w800, height: 0.9, fontSize: 50),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    'Студенческая проектно-исследовательская лаборатория – это центр, предоставляющий его участникам возможность принимать участие в научной деятельности ВУЗа.',
                    style: TextStyle(fontSize: 17, height: 1.7),
                  ),
                ),
              ],
            )
          ],
        ),

    ),
      );
    }
  }
}
