import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sada Pay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    CurrentPage(),
    MenuPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(224, 91, 91, 1.0),
        body: SingleChildScrollView(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu, color: Colors.grey),
                  label: 'Menu',
                  backgroundColor: Colors.white
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            selectedItemColor: const Color.fromRGBO(224, 91, 91, 1.0),
            iconSize: 30,
            onTap: _onItemTapped,
            elevation: 5
        ),
      ),
    );
  }
}

class CurrentPage extends StatelessWidget {
  const CurrentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              // height: size.height*0.35,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(224, 91, 91, 1.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  const Text('You\'re', style: TextStyle(color: Colors.white, fontSize: 16),),
                  const Text('#132,082', style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.w800),),
                  const Text('of #225,809 on the waitlist', style: TextStyle(color: Colors.white, fontSize: 16),),
                  // const Spacer(),

                ],
              ),
            ),
            Positioned(
              // bottom: 0,
              top: 100,
              // right: 20,
              // left: 20,
              child:  Image.asset('assets/images/card.png', scale: 2.5),),

          ],
        ),
        Container(
          margin: EdgeInsets.only(top: size.height*0.15),
          // height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius:  BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          child: Column(
            children:  [
              const SizedBox(height: 20,),
              const Text('Get SadaPay sooner!', style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),),
              const SizedBox(height: 8,),
              const Text('Invite friend & family to skip', style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w400),),
              const SizedBox(height: 5,),
              const Text('the waitlist and earn rewards.', style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w400),),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: size.height*0.285,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CustomCard(title: 'What\'s a Golden Ticket', image: 'assets/images/1.jpg'),
                    CustomCard(title: 'Where\'s my card?', image: 'assets/images/4.jpg'),
                    CustomCard(title: 'The Sada Experience', image: 'assets/images/2.jpg'),
                    CustomCard(title: 'Get SadaPay sooner', image: 'assets/images/3.jpg'),
                    CustomCard(title: 'What\'s the waitlist?', image: 'assets/images/1.jpg'),
                  ],
                ),

              ),
              CustomButton(
                width:size.width*0.85,
                height: size.height*0.085,
                text: 'Share invite link',
                color: const Color.fromRGBO(224, 91, 91, 0.9),
                icon: Icons.share,
              ),
              CustomButtonSecond(
                width:size.width*0.85,
                height: size.height*0.085,
                text: '0 friends',
                secondText: 'Invited',
                color: Colors.grey.withOpacity(0.3), ),
              CustomButtonSecond(
                icon: Icons.lock,
                width:size.width*0.85,
                height: size.height*0.095,
                text: 'Invite 1 friend',
                secondText: 'Skip 26,416 places on the waitlist',
                color: Colors.grey.withOpacity(0.3), ),
              CustomButtonSecond(
                icon: Icons.lock,
                width:size.width*0.85,
                height: size.height*0.095,
                text: 'Invite 3 friend',
                secondText: 'Skip 42,267 places on the waitlist',
                color: Colors.grey.withOpacity(0.3), ),

              // CustomButtonSecond(
              //   icon: Icons.lock,
              //   width:size.width*0.85,
              //   height: 20,
              //   text: 'Invite 7 friend',
              //   secondText: 'Skip 50,719 places on the waitlist',
              //   color: Colors.grey.withOpacity(0.3), ),

              // CustomButtonSecond(
              //   icon: Icons.lock,
              //   width:size.width*0.85,
              //   height: size.height*0.095,
              //   text: 'Invite 10 friend',
              //   secondText: 'Get a sleek Founder\'s Club debit Card 😎',
              //   color: Colors.grey.withOpacity(0.3), ),
            ],
          ),
        ),
      ],
    );
  }
}
class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



class CustomCard extends StatelessWidget {
  final String title;
  final String image;
  const CustomCard({Key? key, required this.title, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10,left: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 3),
            height: 110,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color.fromRGBO(224, 91, 91, 1.0), width: 3)
            ),
            child: Container(
                padding: EdgeInsets.all(3),
                child: Image.asset(image, fit: BoxFit.fill,)),

          ),
          SizedBox(
              width: 70,
              child: Text(title,textAlign: TextAlign.center, maxLines: 2)),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Color color;
  final IconData? icon;
  const CustomButton({Key? key, required this.height, required this.width, required this.text, required this.color, this.icon,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 15),
      margin: const EdgeInsets.only(bottom: 10),
      height: height,
      width: width,
      decoration:  BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),),
          Icon(icon,size: 25,color: Colors.white,)
        ],
      ),
    );
  }
}

class CustomButtonSecond extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final String secondText;
  final Color color;
  final IconData? icon;
  const CustomButtonSecond({Key? key, required this.height, required this.width, required this.text, required this.color, this.icon, required this.secondText,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5,bottom: 5),
      // padding: const EdgeInsets.only(left: 30, right: 15),
      margin: const EdgeInsets.only(bottom: 10),
      height: height,
      width: width,
      decoration:  BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,size: 18,color: Colors.black87,),
              Text(text, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),

            ],
          ),
          Text(secondText, style: const TextStyle(color: Colors.grey,fontSize: 14),),
        ],
      ),
    );
  }
}


