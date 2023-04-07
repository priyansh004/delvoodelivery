import 'package:delvoodelivery/src/Home/Announcement.dart';
import 'package:delvoodelivery/src/Home/OrderDialog.dart';
import 'package:delvoodelivery/src/utils/Sidemenu.dart';
import 'package:delvoodelivery/src/utils/arc.dart';
import 'package:delvoodelivery/src/utils/inbox.dart';
import 'package:delvoodelivery/src/utils/setting.dart';
import 'package:flutter/material.dart';
import 'package:delvoodelivery/main.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Open the side menu
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Center(
          child: Text(
            'Delvoo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.message_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InboxPage()),
              );
              // Navigate to inbox screen
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4 - 30,
            left: 0,
            right: 0,
            child: Arc(
              height: 60,
              child: Container(
                height: 60,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.blueAccent],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 50,
            right: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MessageLocationDialog()),
                );
              },
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(24),
                primary: Colors.white,
                onPrimary: Colors.blue[400],
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 20,
            right: 20,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Announcements',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => ListTile(
                          title: Text('Message ${index + 1}'),
                          subtitle: Text('This is a message'),
                          trailing: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderDialog()),
                              );
                              // Add code to handle the order button press
                            },
                            child: Text('Order'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: SideMenu(),
    );
  }
}
