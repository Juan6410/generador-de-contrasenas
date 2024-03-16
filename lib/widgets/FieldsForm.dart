import 'package:flutter/material.dart';
import 'package:app2dllo/controller/password-generator.dart'; // Importa el archivo password-generator.dart

class PasswordGeneratorWidget extends StatefulWidget {
  @override
  _PasswordGeneratorWidgetState createState() =>
      _PasswordGeneratorWidgetState();
}

class _PasswordGeneratorWidgetState extends State<PasswordGeneratorWidget> {
  bool _includeLowerCase = true;
  bool _includeUpperCase = true;
  bool _includeNumbers = true;
  bool _includeSymbols = true;
  double _passwordLength = 12;
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generador de contraseña'),
        backgroundColor: Colors.blueGrey,
        shape: const BorderDirectional(
            bottom: BorderSide(style: BorderStyle.solid)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Minúscula'),
                    value: _includeLowerCase,
                    activeColor: Colors.blueGrey,
                    onChanged: (newValue) {
                      setState(() {
                        _includeLowerCase = newValue!;
                        _generatePassword();
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Mayúscula'),
                    value: _includeUpperCase,
                    activeColor: Colors.blueGrey,
                    onChanged: (newValue) {
                      setState(() {
                        _includeUpperCase = newValue!;
                        _generatePassword();
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Números'),
                    value: _includeNumbers,
                    activeColor: Colors.blueGrey,
                    onChanged: (newValue) {
                      setState(() {
                        _includeNumbers = newValue!;
                        _generatePassword();
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Símbolos'),
                    value: _includeSymbols,
                    activeColor: Colors.blueGrey,
                    onChanged: (newValue) {
                      setState(() {
                        _includeSymbols = newValue!;
                        _generatePassword();
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.blueGrey),
                      child: Text(
                          'Longitud de la contraseña: ${_passwordLength.toInt()}')),
                  Slider(
                    value: _passwordLength,
                    min: 2,
                    max: 15.0,
                    divisions: 13,
                    activeColor: Colors.blueGrey,
                    onChanged: (newValue) {
                      setState(() {
                        _passwordLength = newValue;
                        _generatePassword();
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                _password,
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _generatePassword() {
    _password = PasswordGenerator.generatePassword(
        _includeLowerCase,
        _includeUpperCase,
        _includeNumbers,
        _includeSymbols,
        _passwordLength.toInt());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _generatePassword();
  }
}
