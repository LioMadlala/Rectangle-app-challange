import 'package:flutter/material.dart';

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Challanges Faced"),
            elevation: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
          ),
          body: ListView(
            padding: const EdgeInsets.all(8),
            children: const [
              challangeListCard(
                text:
                    "I found it tricky to put a Row while the Column is dynamic",
              ),
              challangeListCard(
                text:
                    "Random width was tricky also because of the division i had to do when calculating the number of Columns inside the Container",
              ),
              challangeListCard(
                text:
                    "The Edge cases were to generate single random numbers in a single run so i had to do a forloop to make sure i always get different values and i put those in a List",
              ),
              challangeListCard(
                text:
                    "I found it tricky to put a Row while the Column is dynamic",
              ),
            ],
          )),
    );
  }
}

class challangeListCard extends StatelessWidget {
  final String text;

  const challangeListCard({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.arrow_right_rounded,
            ),
          ),
          Flexible(
            child: Text(
              text,
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
