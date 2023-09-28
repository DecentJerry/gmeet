import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarDemo(),
    );
  }
}

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  _BottomNavigationBarDemoState createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ChatListScreen(),
    VideoChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
            backgroundColor: Colors.blue.shade800,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: Colors.white,
            ),
            label: 'Chat',
            backgroundColor: Colors.blue.shade800,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_call,
              color: Colors.white,
            ),
            label: 'Video Chat',
            backgroundColor: Colors.blue.shade800,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Profile',
            backgroundColor: Colors.blue.shade800,
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                // Implement action for the first screen FAB.
              },
              child: Icon(Icons.add_box_outlined),
            )
          : _currentIndex == 1
              ? FloatingActionButton(
                  onPressed: () {
                    // Implement action for the second screen FAB.
                  },
                  child: Icon(Icons.message),
                )
              : _currentIndex == 2
                  ? FloatingActionButton(
                      onPressed: () {
                        // Implement action for the third screen FAB.
                      },
                      child: Icon(Icons.video_call),
                    )
                  : _currentIndex == 3
                      ? FloatingActionButton(
                          onPressed: () {
                            // Implement action for the fourth screen FAB.
                          },
                          child: Icon(Icons.contact_emergency_rounded),
                        )
                      : null,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Feed',
          style: TextStyle(
              color: Colors.blue.shade900, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red, // Set border color
                      ),
                      borderRadius:
                          BorderRadius.circular(10.0), // Set border radius
                    ),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.keyboard_voice)),
              ),
            ),
            ContainerCard(
              title: 'Promotional Creatives',
              description: 'Description for Item 1',
            ),
            ContainerCard(
              title: 'Product Lauching',
              description: 'Description for Item 2',
            ),
            ContainerCard(
              title: 'New year campaign planning',
              description: 'Description for Item 3',
            ),
            ContainerCard(
              title: 'Audit december marketing assets',
              description: 'Description for Item 4',
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerCard extends StatelessWidget {
  final String title;
  final String description;

  ContainerCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 208, 227, 237),
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'menu1',
                  child: Text('Menu 1'),
                ),
                PopupMenuItem<String>(
                  value: 'menu2',
                  child: Text('Menu 2'),
                ),
                PopupMenuItem<String>(
                  value: 'menu3',
                  child: Text('Menu 3'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(description),
            ),
          ),
        ],
      ),
    );
  }
}

// class ChatListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // Chat list screen UI layout
//         );
//   }
// }

class ChatListScreen extends StatelessWidget {
  final List<ChatItem> chatList = [
    ChatItem(
      profileImage: 'assets/pp1.jpg',
      name: 'John Doe',
      lastMessage: 'Hi there!',
      timestamp: '2:30 PM',
    ),
    ChatItem(
      profileImage: 'assets/pp2.jpg',
      name: 'Jane Smith',
      lastMessage: 'Hello!',
      timestamp: '1:45 PM',
    ),
    ChatItem(
      profileImage: 'assets/pp3.jpg',
      name: 'mary Smith',
      lastMessage: 'Hello!',
      timestamp: '1:45 PM',
    ),
    // Add more chat items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Chat',
          style: TextStyle(
              color: Colors.blue.shade900, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chatItem = chatList[index];
          return ChatListItem(
            profileImage: chatItem.profileImage,
            name: chatItem.name,
            lastMessage: chatItem.lastMessage,
            timestamp: chatItem.timestamp,
          );
        },
      ),
    );
  }
}

class ChatItem {
  final String profileImage;
  final String name;
  final String lastMessage;
  final String timestamp;

  ChatItem({
    required this.profileImage,
    required this.name,
    required this.lastMessage,
    required this.timestamp,
  });
}

class ChatListItem extends StatelessWidget {
  final String profileImage;
  final String name;
  final String lastMessage;
  final String timestamp;

  ChatListItem({
    required this.profileImage,
    required this.name,
    required this.lastMessage,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(profileImage),
      ),
      title: Text(name),
      subtitle: Text(lastMessage),
      trailing: Text(timestamp),
      onTap: () {
        // Add navigation to individual chat screen
      },
    );
  }
}

// class VideoChatScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // Video chat screen UI layout
//         );
//   }
// }
class VideoChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Meet',
          style: TextStyle(
              color: Colors.blue.shade900, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey.shade200,
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'menu1',
                child: Text('Menu 1'),
              ),
              PopupMenuItem<String>(
                value: 'menu2',
                child: Text('Menu 2'),
              ),
              PopupMenuItem<String>(
                value: 'menu3',
                child: Text('Menu 3'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Meeting ID: ABC123',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement action for the Start button.
                  },
                  child: Text('Start'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement action for the Invite button.
                  },
                  child: Text('Invite'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // Profile screen UI layout
//         );
//   }
// }
class ProfileScreen extends StatelessWidget {
  final List<ProfileItem> profileItems = [
    ProfileItem(
      title: 'Creatives',
      imageUrl: 'assets/creatives.jpg',
    ),
    ProfileItem(
      title: 'Marketing',
      imageUrl: 'assets/marketing.jpg',
    ),
    ProfileItem(
      title: 'Videos',
      imageUrl: 'assets/videos.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.blue.shade900, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red, // Set border color
                    ),
                    borderRadius:
                        BorderRadius.circular(10.0), // Set border radius
                  ),
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.keyboard_voice)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: profileItems.length,
              itemBuilder: (context, index) {
                final profileItem = profileItems[index];
                return ProfileItemWidget(
                  title: profileItem.title,
                  imageUrl: profileItem.imageUrl,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem {
  final String title;
  final String imageUrl;

  ProfileItem({
    required this.title,
    required this.imageUrl,
  });
}

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProfileItemWidget({
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.blue.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
