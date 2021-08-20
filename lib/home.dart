import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('HNG Internship 8'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DetailCard(
                title: 'The HNG Internship',
                subtitle: 'Perfection is always under construction',
                imagePath: 'hng.png',
                url: 'https://hng.tech/',
              ),
              DetailCard(
                  imagePath: 'i4g_logo.png',
                  title: 'Ingressive For Good',
                  subtitle:
                      'Together we can empower young African tech talents in need to reach full potential and grow the continent, one tech talent at a time.',
                  url: 'https://ingressive.org/'),
              DetailCard(
                  imagePath: 'zuri.png',
                  title: 'Zuri',
                  subtitle: 'Learn, Build, Grow. ',
                  url: 'https://zuri.team/'),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Enter your email for updates: ",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                controller: inputController,
                autofocus: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    String text = inputController.text.toString();
                    AlertDialog alert = AlertDialog(
                      title: Text("Check $text for updates."),
                    );
                    showDialog(context: context, builder: (context) => alert);
                  },
                  child: Text('Subscribe'))
            ],
          ),
        ),
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  const DetailCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.url,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final String subtitle;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: _buildImage(imagePath),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(
          icon: Icon(Icons.launch_outlined),
          onPressed: () {
            _goToLink(url);
          },
        ),
      ),
    );
  }
}

Widget _buildImage(String imagePath) {
  return Image.asset(
    imagePath,
    height: 200,
    width: 200,
  );
}

void _goToLink(String url) async {
  await canLaunch(url) ? await launch(url) : throw 'Could not launch link';
}
