import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ButtonStyle style = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    textStyle: const TextStyle(
      fontSize: 15,
    ),
    fixedSize: const Size(150, 40),
  );

  final cardDecoration = const InputDecoration(
    labelText: 'Número',
    hintText: 'XXXX XXXX XXXX XXXX',
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.orange),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Sesi Esporte',
          style: TextStyle(color: Colors.white),
        )),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                CreditCardWidget(
                  cardBgColor: Colors.orange,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  obscureCardNumber: false,
                  obscureCardCvv: true,
                  /////////
                  //width: MediaQuery.of(context).size.width,
                  ///////
                  onCreditCardWidgetChange: (CreditCardBrand) {},
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                        formKey: formKey,
                        onCreditCardModelChange: onCreditCardModelChange,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumberDecoration: const InputDecoration(
                          labelText: 'Número',
                          labelStyle: TextStyle(color: Colors.orange),
                          hintText: 'XXXX XXXX XXXX XXXX',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                        expiryDateDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          labelText: 'Data de Expiração',
                          labelStyle: TextStyle(color: Colors.orange),
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          labelText: 'CVV',
                          labelStyle: TextStyle(color: Colors.orange),
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          labelText: 'Nome Completo',
                          labelStyle: TextStyle(color: Colors.orange),
                          hintText: 'Nome completo',
                        ),
                        themeColor: Colors.orange,
                        cardHolderName: '',
                        cvvCode: '',
                        cardNumber: '',
                        expiryDate: '',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: style,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: const Text(
                          'Cancelar',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('valid!');
                          print(cardHolderName);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Cartão Criado"),
                              backgroundColor: Colors.greenAccent,
                            ),
                          );
                        } else {
                          print('invalid!');
                        }
                      },
                      style: style,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: const Text(
                          'Criar',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
