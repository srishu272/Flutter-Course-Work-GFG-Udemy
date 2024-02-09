import 'package:flutter/material.dart';
import 'package:multi_store_app/minor_screens/searchScreen.dart';

class FakeSearch extends StatelessWidget {
  const FakeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SearchScreen()));
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 1.5),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.search),
                ),
                Text("What are you looking for??", style: TextStyle(
                    fontSize: 16),),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Search"),
              style: Theme
                  .of(context)
                  .elevatedButtonTheme
                  .style,
            )
          ],
        ),
      ),
    );
  }
}