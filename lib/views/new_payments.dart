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
  OutlineInputBorder? border;
  Card? card;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ButtonStyle style = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    textStyle: const TextStyle(
      fontSize: 15,
    ),
    fixedSize: const Size(150, 40),
  );

  @override
  void initState() {
    border = const OutlineInputBorder(
        borderSide: BorderSide(
      color: Colors.orange,
    ));
    super.initState();
  }

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
                  isHolderNameVisible: true,
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
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Número',
                          labelStyle: const TextStyle(color: Colors.orange),
                          hintText: 'XXXX XXXX XXXX XXXX',
                          border: border,
                          focusedBorder: border,
                        ),
                        expiryDateDecoration: InputDecoration(
                          border: border,
                          focusedBorder: border,
                          labelText: 'Data de Expiração',
                          labelStyle: const TextStyle(color: Colors.orange),
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          border: border,
                          focusedBorder: border,
                          labelText: 'CVV',
                          labelStyle: const TextStyle(color: Colors.orange),
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          border: border,
                          focusedBorder: border,
                          labelText: 'Titular do Cartão',
                          labelStyle: const TextStyle(color: Colors.orange),
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
                          setState(() {
                            CreatedCard();
                          });
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

  Widget CreatedCard() {
    return Card(
      child: Column(
        children: [
          Text(cardHolderName),
        ],
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
