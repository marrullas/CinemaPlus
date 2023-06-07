import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          //height: 60,
          //color: Colors.red,
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.movie_outlined,
                  color: colors.primary,
                ),
                onPressed: () {},
              ),
              Text(
                'CinemaPedia',
                style: titleStyle,
              ),
              const Spacer(),
              IconButton(
                icon: Icon(Icons.search, color: colors.primary),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
