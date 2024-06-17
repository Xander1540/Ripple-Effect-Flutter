import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late Animation _animation;
  late AnimationController _animationController;

  var listRadius = [150.0, 200.0, 250.0, 300.0, 350.0, 400.0, 450.0];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addListener(() {
      setState(() {

      });
      });

    _animationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Ripple Effect Animation'),
      ),
      body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: listRadius.map((radius) => Container(
                width: radius*_animation.value,
                height: radius*_animation.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(1.0 - _animation.value)
              ),
              )).toList(),
          )
      )
    );
  }
}
