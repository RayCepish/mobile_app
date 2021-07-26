import 'package:flutter/material.dart';

import 'collapsed_container.dart';

class OpenedSlidingPanel extends StatefulWidget {
  OpenedSlidingPanel({Key? key}) : super(key: key);

  @override
  _OpenedSlidingPanelState createState() => _OpenedSlidingPanelState();
}

class _OpenedSlidingPanelState extends State<OpenedSlidingPanel> {
  @override
  Widget build(BuildContext context) {
    return CollapsedContainer();
  }
}
