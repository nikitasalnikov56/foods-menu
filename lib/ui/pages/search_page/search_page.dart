import 'package:flutter/material.dart';
import 'package:flutter_test_work/ui/components/avatar_widget/avatar_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 100),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // color: Colors.amber,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 40,
                child: const TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      border: OutlineInputBorder()),
                ),
              ),
              const AvatarWidget(),
            ],
          ),
        ),
      ),
      // AppBar(
      //   title: Container(
      //     child: TextField(),
      //   ),
      //   actions: const [
      //     AvatarWidget(),

      //   ],
      // ),
    );
  }
}
