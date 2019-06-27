import 'package:flutter/material.dart';
 
class Currency extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CurrencyState();
  }
}
 
class _CurrencyState extends State<Currency> {
  final TextEditingController _currencyController = new TextEditingController();
  int _radioValue = 0;
 
  static const WeightPluto = 0.06;
  static const WeightSaturn = 0.91;
  static const WeightNeptune = 1.12;
  double _result = 0.0;
  String _textResult = '';
 
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
 
      switch (_radioValue) {
        case 0:
          _result = _currencyCalculate(_currencyController.text, WeightPluto);
          if (_result > -1.0) {
            _textResult = '${_currencyController.text} kg = ${_result.toStringAsFixed(3)} kg';
          } else {
            _textResult = 'Cannot convert weight\nPlease check the Amount!';
          }
          break;
        case 1:
          _result = _currencyCalculate(_currencyController.text, WeightSaturn);
          if (_result > -1.0) {
            _textResult = '${_currencyController.text} Kg = ${_result.toStringAsFixed(3)} kg';
          } else {
            _textResult = 'Cannot convert kg to kg\nPlease check the Amount!';
          }
          break;
        case 2:
          _result = _currencyCalculate(_currencyController.text, WeightNeptune);
          if (_result > -1.0) {
            _textResult = '${_currencyController.text} Kg = ${_result.toStringAsFixed(3)} kg';
          } else {
            _textResult = 'Cannot convert kg to kg\nPlease check the Amount!';
          }
          break;
      }
    });
  }
 
  void _handleCurrencyAmountChange(String amount) {
    setState(() {
      switch (_radioValue) {
        case 0:
          _result = _currencyCalculate(amount, WeightPluto);
          if (_result > -1.0) {
            _textResult = '$amount kg = ${_result.toStringAsFixed(3)} kg';
          } else {
            _textResult = 'Cannot convert kg to kg\nPlease check the Amount!';
          }
          break;
        case 1:
          _result = _currencyCalculate(amount, WeightSaturn);
          if (_result > -1.0) {
            _textResult = '$amount kg = ${_result.toStringAsFixed(3)} kg';
          } else {
            _textResult = 'Cannot convert kg to kg\nPlease check the Amount!';
          }
          break;
        case 2:
          _result = _currencyCalculate(amount, WeightNeptune);
          if (_result > -1.0) {
            _textResult = '$amount kg = ${_result.toStringAsFixed(3)} kg';
          } else {
            _textResult = 'Cannot convert kg to kg\nPlease check the Amount!';
          }
          break;
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Weight Converter'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: new Container(
          alignment: Alignment.center,
          child: new ListView(
            padding: const EdgeInsets.all(25.0),
            children: <Widget>[
              new Image.asset(
                'images/logo.png',
                height: 150.0,
                width: 150.0,
              ),
              new Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _currencyController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: 'weight',
                        icon: new Icon(Icons.person_outline),
                      ),
                      onChanged: _handleCurrencyAmountChange,
                    ),
                    new Padding(padding: new EdgeInsets.all(5.0)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 0,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                        ),
                        new Text('Pluto'),
                        new Radio(
                          value: 1,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                        ),
                        new Text('Saturn'),
                        new Radio(
                          value: 2,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                        ),
                        new Text('Mars'),
                      ],
                    ),
                    new Padding(padding: new EdgeInsets.all(15.0)),
                    new Text(
                      _currencyController.text.isEmpty ? 'Please enter the Amount!' : _textResult,
                      style: new TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
 
  double _currencyCalculate(String amount, double multiplier) {
    double _amount = amount.isNotEmpty ? double.parse(amount) : 0.0;
 
    if (_amount.toString().isNotEmpty && _amount > 0) {
      return _amount * multiplier;
    } else {
      return -1.0;
    }
  }
}