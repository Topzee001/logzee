import 'package:flutter/material.dart';
import 'package:logzee/components/list_tile.dart';
import 'package:logzee/log_reg_toggle.dart';
import 'package:logzee/screens/profile.dart';
import 'package:logzee/services/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  Future<void> signOut(BuildContext context) async {
    await AuthService().signUserOut();
    AuthService().handleSignOut();

    print('Signed out successfully.');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LogOrRegScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // padding: EdgeInsets.zero,
        children: [
          Column(
            children: [
              DrawerHeader(
                //decoration: BoxDecoration(color: Colors.grey.shade600),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (conext) => ProfileScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                      //bottom: 10,
                    ),
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          //child: Icon(Icons.account_circle),
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/young-african-american-businessman-wearing-tie-glasses-isolated-white-background-relaxed-with-serious-expression-face-simple-natural-looking-camera_839833-17856.jpg?t=st=1712053094~exp=1712056694~hmac=718a53605a3f1ae7df823b5ae7a783e75a79ce2fe0bd569629f7f73c396fd34c&w=1060'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              MyListTile(
                onTap: () {},
                title: 'Home',
                trailing: const Icon(Icons.home),
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
            ],
          ),
          //Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              onTap: () => signOut(context),
              title: 'Logout',
              trailing: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
