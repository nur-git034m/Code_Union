import 'package:flutter/cupertino.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      prefix: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Icon(CupertinoIcons.search),
      ),
      placeholder: "Поиск",
      padding: const EdgeInsets.all(12),
    );
  }
}
