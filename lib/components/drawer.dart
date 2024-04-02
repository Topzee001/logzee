import 'package:estream_up/components/list_tile.dart';
import 'package:estream_up/screens/profile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber.shade200,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.amber.shade100),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (conext) => ProfileScreen(),
                    ));
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  //bottom: 10,
                ),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      //child: Icon(Icons.account_circle),
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/young-african-american-businessman-wearing-tie-glasses-isolated-white-background-relaxed-with-serious-expression-face-simple-natural-looking-camera_839833-17856.jpg?t=st=1712053094~exp=1712056694~hmac=718a53605a3f1ae7df823b5ae7a783e75a79ce2fe0bd569629f7f73c396fd34c&w=1060'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Gabriel Soreto',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        //color: Colors.white,
                      ),
                    ),
                    Text(
                      'gabrielsoreto@gmail.com',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          MyListTile(
            onTap: () {},
            title: 'Check coverage',
            trailing: const Icon(Icons.location_on_sharp),
          ),
          MyListTile(
            onTap: () {},
            title: 'Store',
            trailing: const Icon(Icons.shopping_bag_outlined),
          ),
          MyListTile(
            onTap: () {},
            title: 'Complaints',
            trailing: const Icon(Icons.message),
          ),
          MyListTile(
            onTap: () {},
            title: 'Contact us',
            trailing: const Icon(Icons.phone),
          ),
          Divider(),
          MyListTile(
            onTap: () {},
            title: 'Logout',
            trailing: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
