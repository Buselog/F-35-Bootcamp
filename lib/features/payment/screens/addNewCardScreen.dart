import 'package:f35/features/payment/screens/sonucGosterScreen.dart';
import 'package:f35/features/payment/screens/widgets/cardMonthInputFormatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:f35/features/payment/screens/widgets/cardNumberInputFormatter.dart';

import '../../../theme/pallete.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  TextEditingController _donationController = TextEditingController();
  String textToDisplay = '';

  @override
  void initState() {
    textToDisplay = '0.00'; // init
    _donationController.addListener(() {
      setState(() {
        if (textToDisplay == '') {
          textToDisplay = '0.00';
        } else {
          textToDisplay = _donationController.value.text;
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Bağış Gönder',
          style: TextStyle(
            color: Colors.orange[100],
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.purple,
        backgroundColor: const Color(0xFFE4A5FF),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
                child: Column(
                  children: [
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(19),
                              CardNumberInputFormatter(),
                            ],
                            decoration: InputDecoration(
                              counterStyle: const TextStyle(
                                color: Colors.yellow,
                                fontFamily: 'Poppins',
                              ),
                              hintText: 'Kart Numarası',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 18,
                              ),
                              prefixIcon: Icon(
                                Icons.credit_card,
                                color: Colors.purple[800],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Ad - Soyad',
                                hintStyle: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 18,
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.purple[800],
                                  size: 27,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, right: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4),
                                    ],
                                    decoration: InputDecoration(
                                      hintText: 'CVV',
                                      prefixIcon: Icon(
                                        Icons.view_day,
                                        color: Colors.purple[800],
                                      ),
                                      hintStyle: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 35),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(5),
                                      CardMonthInputFormatter(),
                                    ],
                                    decoration: InputDecoration(
                                      hintText: 'MM/YY',
                                      prefixIcon: Icon(
                                        Icons.calendar_month,
                                        color: Colors.purple[800],
                                      ),
                                      hintStyle: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 30),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _donationController,
                              decoration: InputDecoration(
                                hintText: 'Bağış Miktarı',
                                hintStyle: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 19,
                                ),
                                prefixIcon: Icon(
                                  Icons.currency_lira,
                                  color: Colors.purple[800],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 27),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(70),
                  topRight: Radius.circular(70),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Toplam',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 50),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Text(
                            textToDisplay,
                            style: TextStyle(
                              color: Colors.purple[800],
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE4A5FF),
                            shadowColor: Colors.white,
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: Colors.white)),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Yardımınız için teşekkürler!',
                                textAlign: TextAlign.center),
                            content: const Text(
                              'Bu kampanyaya bağış ile katkıda bulundunuz.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 14),
                            ),
                            actions: <Widget>[
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Pallete.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        child: const Text('Tamam'),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        child: const Text(
                          'BAĞIŞI ONAYLA',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
