import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class DialogUtility {
  static showTwoButtonDialog(
      {required BuildContext context,
      required String title,
      Function()? onYesPressed,
      Function()? onNoPressed}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(title),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor)),
                            onPressed: () {
                              Navigator.pop(context);
                              if (onYesPressed != null) {
                                onYesPressed();
                              }
                            },
                            child: Text(S.current.yes)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor)),
                            onPressed: () {
                              Navigator.pop(context);
                              if (onNoPressed != null) {
                                onNoPressed();
                              }
                            },
                            child: Text(S.current.no)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
