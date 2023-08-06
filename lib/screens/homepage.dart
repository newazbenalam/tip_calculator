import 'package:flutter/material.dart';
import 'package:tip_calculator/constant.dart';
import 'package:tip_calculator/widgets/text_field.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});
  final String title;
  static double totalBill = 0.00;
  final TextEditingController textInputControllerTotalBill =
      TextEditingController();
  final TextEditingController textInputControllerPercentage =
      TextEditingController();
  final TextEditingController textInputControllerPeople =
      TextEditingController();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: Column(
                children: [
                  Text(
                    "Total Bill",
                    style: hintTitleStyle,
                  ),
                  Text(
                    "\$ ${HomePage.totalBill}",
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
            // const SizedBox(
            //   height: 5,
            // ),
            // TextFormField(
            //   controller: widget.textInputController,
            //   key: widget.fieldKey,
            //   keyboardType: TextInputType.number,
            //   decoration: InputDecoration(
            //     hintText: "Please enter total bill amount",
            //     hintStyle: const TextStyle(color: textLightBlack),
            //     suffixIcon: const Icon(Icons.attach_money),
            //     filled: true,
            //     fillColor: containerColor,
            //     iconColor: textLightBlack,
            //     border: OutlineInputBorder(
            //       borderSide: const BorderSide(
            //         width: 0,
            //         color: Colors.transparent,
            //       ),
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: const BorderSide(
            //         width: 0,
            //         color: Colors.transparent,
            //       ),
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: const BorderSide(
            //         width: 0,
            //         color: Colors.transparent,
            //       ),
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //   ),
            //   onChanged: (value) {
            //     widget.textInputController.text = value.toString();
            //     widget.textInputController.selection =
            //         TextSelection.fromPosition(TextPosition(
            //             offset: widget.textInputController.text.length));
            //   },
            //   onSaved: (value) {
            //     setState(() {
            //       widget.textInputController.text = value.toString();
            //       HomePage.totalBill =
            //           double.parse(widget.textInputController.text);
            //       debugPrint(widget.textInputController.text);
            //     });
            //   },
            //   onEditingComplete: () {
            //     setState(() {
            //       HomePage.totalBill =
            //           double.parse(widget.textInputController.text);
            //       debugPrint(widget.textInputController.text);
            //     });
            //   },
            // ),
            TextFieldDouble(
                title: "Please enter total bill amount",
                textInputController: widget.textInputControllerTotalBill,
                iconData: Icon(Icons.attach_money)),
            Title(title: "Tip percentage"),
            TextFieldDouble(
                title: "Please emter tip percentage",
                textInputController: widget.textInputControllerPercentage,
                iconData: Icon(Icons.percent_outlined)),
            Title(title: "Number of people"),
            TextFieldDouble(
              title: "Please enter number of people",
              textInputController: widget.textInputControllerPeople,
            ),
          ],
        ),
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
