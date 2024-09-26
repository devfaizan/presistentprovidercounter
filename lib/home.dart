import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercounter/provider.dart';
import 'package:providercounter/themeprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final heightContext = MediaQuery.of(context).size.height;
    final widthContext = MediaQuery.of(context).size.width;
    final changeName = Provider.of<ProviderCounter>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Counter"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Provider.of<ThemeProvider>(context).isDarkMode
                    ? Icons.dark_mode
                    : Icons.light_mode,
                size: 30,
              ),
            ),
          ),
          SizedBox(
            width: widthContext * 0.02,
          )
        ],
      ),
      body: Center(
        child: Consumer<ProviderCounter>(
          builder: (context, data, child) {
            return Text(
              '${data.count}',
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              changeName.increCount();
            },
            child: const Text(
              "+",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: heightContext * 0.03,
          ),
          FloatingActionButton(
            onPressed: () {
              changeName.decreCount();
            },
            child: const Text(
              "-",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: heightContext * 0.03,
          ),
          FloatingActionButton(
            onPressed: () {
              changeName.resetCount();
            },
            child: const Text(
              "0",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: heightContext * 0.03,
          ),
        ],
      ),
    );
  }
}
