import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AlertDialogApp());

class AlertDialogApp extends StatelessWidget {
  const AlertDialogApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromARGB(255, 71, 66, 83)),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Alerta')),
        body: const Center(
          child: DialogButtons(),
        ),
      ),
    );
  }
}

class DialogButtons extends StatelessWidget {
  const DialogButtons({Key? key});

  void _showMaterialAlertDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      barrierDismissible: true, 
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Material Alerta'),
        content: const Text('This is a Material AlertDialog.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showCupertinoAlertDialog(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Cupertino Alerta'),
        content: const Text('This is a Cupertino AlertDialog.'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showMaterialOptionsDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Material con Opciones'),
        content: const Text('This is a Material Dialog with Options.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showCupertinoOptionsDialog(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Cupertino con Opciones'),
        content: const Text('This is a Cupertino Dialog with Options.'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () => _showMaterialAlertDialog(context),
          child: const Text('Material Alerta'),
        ),
        const SizedBox(height: 20),
        CupertinoButton(
          onPressed: () => _showCupertinoAlertDialog(context),
          child: const Text('Cupertino Alerta'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => _showMaterialOptionsDialog(context),
          child: const Text('Material con Opciones'),
        ),
        const SizedBox(height: 20),
        CupertinoButton(
          onPressed: () => _showCupertinoOptionsDialog(context),
          child: const Text('Cupertino con Opciones'),
        ),
      ],
    );
  }
}
