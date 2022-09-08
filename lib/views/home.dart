import 'package:flutter/material.dart';
import 'package:loanapp/components/components.dart';
import 'package:loanapp/utils/size_config.dart';

import '../utils/constants.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController loginUserController = new TextEditingController();

  TextEditingController phoneController = new TextEditingController();

  TextEditingController mailController = new TextEditingController();

  TextEditingController amountController = new TextEditingController();

  TextEditingController totalController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  FocusNode fn = FocusNode();

  String custType = "1";
  double totalamount = 0;

  var custTypeList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(
            child:
                regularText("Loan App", 2.4, Colors.black, FontWeight.bold, 1)),
      ),
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 2),
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Form(
              key: _formKey,
              child: Column(children: [
                regularText("Your name", 1.8, Colors.grey, FontWeight.bold, 0),
                customField(loginUserController, "Your name",
                    Icons.account_circle_outlined, TextInputType.text),
                space1(),
                regularText("Cell phone", 1.8, Colors.grey, FontWeight.bold, 0),
                customField(phoneController, "Cell phone", Icons.phone,
                    TextInputType.number),
                space1(),
                regularText("Email", 1.8, Colors.grey, FontWeight.bold, 0),
                customField(mailController, "Email", Icons.mail,
                    TextInputType.emailAddress),
                space1(),
                regularText("Amount for loan (USD)", 1.8, Colors.grey,
                    FontWeight.bold, 0),
                customField(amountController, "Amount for loan (USD)",
                    Icons.attach_money, TextInputType.number),
                space1(),
                regularText("Select installment plan", 1.8, Colors.grey,
                    FontWeight.bold, 0),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.heightMultiplier * 0.5,
                    horizontal: SizeConfig.heightMultiplier * 2,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: Offset(
                          1.0,
                          1.0,
                        ),
                        blurRadius: 15.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: DropdownButton(
                    // Initial Value
                    value: custType,
                    // Down Arrow Icon
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    alignment: Alignment.centerLeft,
                    // Array list of items
                    items: custTypeList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: regularText(items + ' year plan', 2.2,
                            Colors.black, FontWeight.normal, 0),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String newValue) {
                      setState(() {
                        custType = newValue;
                      });
                      print(custType);
                    },
                  ),
                ),
                space1(),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Constants.primaryColor,
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.heightMultiplier * 1.8)),
                      onPressed: () async {
                        FocusScope.of(context).requestFocus(fn);

                        if (_formKey.currentState.validate()) {
                          String markup = "0." + custType.toString();
                          totalamount = (double.tryParse(
                                      amountController.text.toString()) *
                                  double.tryParse(markup)) +
                              double.tryParse(amountController.text.toString());
                          setState(() {
                            totalController.text =
                                (totalamount / (12 * int.tryParse(custType)))
                                    .toString();
                          });
                        }
                      },
                      child: regularText("Calculate Monthly Installment", 2.0,
                          Colors.white, FontWeight.bold, 1),
                    )),
                space1(),
              ]),
            ),
            regularText("Calculated Monthly Installment is:", 1.8, Colors.grey,
                FontWeight.bold, 0),
            customField(totalController, "Monthly Installment",
                Icons.attach_money, TextInputType.number),
            space1(),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Constants.primaryColor,
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.heightMultiplier * 1.8)),
                  onPressed: () async {
                    FocusScope.of(context).requestFocus(fn);

                    if (_formKey.currentState.validate() &&
                        totalController.text.isNotEmpty) {
                      print("DSf");
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Loan Application Status"),
                          content:
                              const Text("Loan Application Status Successful."),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ));
                              },
                              child: Container(
                                color: Constants.primaryColor,
                                padding: const EdgeInsets.all(14),
                                child: const Text(
                                  "okay",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: regularText("Request for loan", 2.0, Colors.white,
                      FontWeight.bold, 1),
                )),
            space1(),
          ],
        ),
      ),
    );
  }
}
