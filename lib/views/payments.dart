import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  CreditCardWidget(
                    cardBgColor: Colors.black87,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    onCreditCardWidgetChange: (CreditCardBrand) {},
                  ),
                  RaisedButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 2.0),
                              borderRadius: const BorderRadius.horizontal(),
                            ),
                            height: 500,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          CreditCardForm(
                                            formKey: formKey,
                                            onCreditCardModelChange:
                                                onCreditCardModelChange,
                                            obscureCvv: true,
                                            obscureNumber: true,
                                            cardNumberDecoration:
                                                const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Número',
                                              hintText: 'XXXX XXXX XXXX XXXX',
                                            ),
                                            expiryDateDecoration:
                                                const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Data de Expiração',
                                              hintText: 'XX/XX',
                                            ),
                                            cvvCodeDecoration:
                                                const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'CVV',
                                              hintText: 'XXX',
                                            ),
                                            cardHolderDecoration:
                                                const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Card Holder Name',
                                            ),
                                            themeColor: Colors.black45,
                                            cardHolderName: '',
                                            cvvCode: '',
                                            cardNumber: '',
                                            expiryDate: '',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Container(
                                              margin: const EdgeInsets.all(8),
                                              child: const Text(
                                                'Criar',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            color: Colors.orange[600],
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                print('valid!');
                                              } else {
                                                print('invalid!');
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text("Novo Meio de Pagamento"),
                    color: Colors.orange[600],
                    textColor: Colors.white,
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Novo Meio de Pagamento"),
                ],
              )
            ],
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
