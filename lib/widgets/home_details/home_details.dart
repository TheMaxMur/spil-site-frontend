import 'package:flutter/material.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    if (currentWidth > 900) {
    return SizedBox(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'МИИГАиК Проекты',
            style: TextStyle(fontWeight: FontWeight.w800, height: 0.9, fontSize: 80),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  'В настоящее время университет - крупный учебно-научный и производственный комплекс, включающий семь факультетов дневного обучения, аспирантуру и докторантуру, учебные специализированные лаборатории по различным направлениям геодезии, картографии, кадастра, геоинформатики и дистанционного зондирования. В структуре университета функционируют 25 учебных, научно-производственных центров и лабораторий, издательство журнала «Геодезия и аэрофотосъемка», три учебных полигона, учебно-геодезический музей и библиотека. В составе вуза действует два профильных колледжа.',
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
              'МИИГАиК Проекты',
              style: TextStyle(fontWeight: FontWeight.w800, height: 0.9, fontSize: 50),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    'В настоящее время университет - крупный учебно-научный и производственный комплекс, включающий семь факультетов дневного обучения, аспирантуру и докторантуру, учебные специализированные лаборатории по различным направлениям геодезии, картографии, кадастра, геоинформатики и дистанционного зондирования. В структуре университета функционируют 25 учебных, научно-производственных центров и лабораторий, издательство журнала «Геодезия и аэрофотосъемка», три учебных полигона, учебно-геодезический музей и библиотека. В составе вуза действует два профильных колледжа.',
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
