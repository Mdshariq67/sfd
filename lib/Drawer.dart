import 'package:flutter/material.dart';
import 'package:safetfirst/Course_details.dart';
import 'package:safetfirst/courses_list.dart';
import 'package:safetfirst/user.dart';


class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Sarah Abs';
    final email = 'sarah@abs.com';
    final urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(

      child: Material(
        color: Colors.white38,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () =>
                  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserPage(
                  name: 'Sarah Abs',
                  urlImage: urlImage,
                ),
                  )),
        ),

            Container(
              padding: padding,
              child: Column(
                children: [
                  Divider(),

                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Home',
                    icon: Icons.home,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  Divider(),
                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'Courses',
                    icon: Icons.book,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  Divider(),
                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'My Cart',
                    icon: Icons.add_shopping_cart,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  Divider(),
                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'Coupon',
                    icon: Icons.discount,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  Divider(),

                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'My Orders',
                    icon: Icons.fact_check,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  Divider(),
                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'Help',
                    icon: Icons.chat,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  Divider(),
                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'Log Out',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 5),
                  ),
                ],
              ),
            ),
      ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.black),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.black;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.black;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Course_details(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Course_list(),
        ));
        break;
    }
  }
}