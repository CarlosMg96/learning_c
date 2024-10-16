import 'package:flutter/material.dart';
class Login extends StatelessWidget {
const Login({ super.key });

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text('Primer Text    ffggrrgghhghgiohg')),
            SizedBox(width: 16),
            Expanded(child: Align(alignment: Alignment.topLeft ,child: Text('Segundo text gfgg hfif h hiuf c wuwefufewfgfewggfgfggfwgfgef'))),
            Expanded(child: Align(alignment: Alignment.topLeft ,child: Text('Segundo text gfgg hfif h hiuf c wuwefufewfgfewggfgfggfwgfgef'))),
            SizedBox(width: 16),
            Expanded(child: Text('Textjhfhwegfgwfgwgefgew vi fewef wyf'))
          ],
        ),
      ],
      ),
    );
  }
}