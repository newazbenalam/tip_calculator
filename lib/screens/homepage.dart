import 'package:flutter/material.dart';
import 'package:tip_calculator/constant.dart';
import 'package:tip_calculator/widgets/text_field.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textInputControllerTotalBill = TextEditingController();

  final textInputControllerPercentage = TextEditingController();

  final textInputControllerPeople = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        elevation: 1,
        centerTitle: true,
        backgroundColor: appBarColor,
        // elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              width: double.infinity,
              decoration: const BoxDecoration(color: containerColor),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      "Total Bill",
                      style: hintTitleStyle,
                    ),
                    Text(
                      "\$ ${textInputControllerTotalBill.text.isEmpty ? "0.00" : textInputControllerTotalBill.text}",
                      style: h1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Persons",
                              style: hintTitleStyle,
                            ),
                            Text(
                              "05",
                              style: h2,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Tip Amount",
                              style: hintTitleStyle,
                            ),
                            Text(
                              "\$ 20.0",
                              style: h2,
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 14),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: const BoxDecoration(color: containerColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Amount per person",
                    style: hintTitleStyle,
                  ),
                  Text(
                    "\$ 5.0",
                    style: h2,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Title(title: "Total Bill"),
            TextFieldDouble(
                title: "Please enter total bill amount",
                textInputController: textInputControllerTotalBill,
                iconData: Icon(Icons.attach_money)),
            Title(title: "Tip percentage"),
            TextFieldDouble(
                title: "Please emter tip percentage",
                textInputController: textInputControllerPercentage,
                iconData: Icon(Icons.percent_outlined)),
            Title(title: "Number of people"),
            TextFieldDouble(
              title: "Please enter number of people",
              textInputController: textInputControllerPeople,
            ),
            Row(
              children: [
                Expanded(child: actionButton()),
                SizedBox(
                  width: 10,
                ),
                clearButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget actionButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          formKey.currentState!.validate();
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: const Text("Calculate", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget clearButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          textInputControllerTotalBill.clear();
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
        decoration: BoxDecoration(
            color: clearButtonColor, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: const Text("Clear", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: hintTitleStyle,
      ),
    );
  }
}
