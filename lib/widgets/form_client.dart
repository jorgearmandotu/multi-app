
import 'package:flutter/material.dart';

class FormCLient extends StatefulWidget {
  const FormCLient({super.key});

  @override
  State<FormCLient> createState() => _FormCLientState();
}


enum ClientType { nit(), cedula(), cedulaExtranjeria() }



class _FormCLientState extends State<FormCLient> {

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          DropdownMenu<ClientType>(
            dropdownMenuEntries: ClientType.values.map((e) => DropdownMenuEntry<ClientType>(value: e, label: e.name)).toList(),
            initialSelection: ClientType.nit,
            label: const Text('Tipo de Identificación del Cliente'),
          )
        ]
      )
      ) ;
  }
}