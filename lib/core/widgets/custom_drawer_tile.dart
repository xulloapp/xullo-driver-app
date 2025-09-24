import 'package:flutter/material.dart';

class CustomDrawerTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final void Function()? onTap;
  final bool selected;

  const CustomDrawerTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(title,style: TextStyle(color: (selected) ? Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.primary , fontWeight: FontWeight.normal,),),
      leading:  IconTheme(data: IconThemeData(color: (selected) ? Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.primary), child: icon),
      tileColor: (selected) ? Theme.of(context).colorScheme.primary : null,
      onTap: onTap,
    );
  }
}
