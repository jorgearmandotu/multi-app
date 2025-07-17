
import 'package:flutter/material.dart';

class FormCLient extends StatefulWidget {
  const FormCLient({super.key});

  @override
  State<FormCLient> createState() => _FormCLientState();
}




List<String> clientType = ['CC', 'NIT', 'CE'];

class _FormCLientState extends State<FormCLient> {
   
   String dropdownValue = clientType.first;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('Creacion de Clientes',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          //SizedBox(height: 20,),
          SizedBox(
            //width: double.infinity,
            child: DropdownMenu<String>(
              width: double.infinity,
              leadingIcon: const Icon(Icons.tab),
              dropdownMenuEntries: clientType.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(
                  value: value,
                  label: value,
                );
              }).toList(),
              initialSelection: clientType.first,
              label: const Text('Tipo de Identificación'),
              onSelected: (String? value) {
                setState(() {
                  dropdownValue = value ?? clientType.first;
                });
              },
            ),
          )
        ]
      )
      ) ;
  }
}