import 'package:flutter/material.dart';
import 'package:web_app/widgets/centered_view/centered_view.dart';
import 'package:web_app/widgets/contact_details/contact_details.dart';
import 'package:web_app/widgets/navigation_bar/navigation_bar.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [Row(
        children: [
          ContactDetails(),
        ],
      ),
      ],
    );
  }
}