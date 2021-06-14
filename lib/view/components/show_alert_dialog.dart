import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

showAlertDialog() {
  return Center(
    child: Container(
      height: 300,
      child: AlertDialog(
        content: Column(
          children: [
            Expanded(
              child: Icon(
                Icons.signal_cellular_connected_no_internet_4_bar,
                size: 80,
              ),
            ),
            Text(
                'İnternet bağlantısı bulunamadı. Lütfen internet bağlantınızı kontrol ederek tekrardan deneyiniz.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text('Kapat'),
          ),
        ],
      ),
    ),
  );
}
