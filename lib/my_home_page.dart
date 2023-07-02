import 'package:app_demo/home_banner_rectangle.dart';
import 'package:app_demo/services/analytics_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int textResponsesCount = 0;

  @override
  Widget build(BuildContext context) {
    void goToImagePage() {
      Navigator.pushNamed(context, '/image');
    }

    getTextResponsesCount().then((value) {
      if (value != textResponsesCount) {
        setState(() {
          textResponsesCount = value;
        });
      }
    });

    return Scaffold(
        body: Container(
            color: const Color.fromRGBO(254, 254, 254, 1),
            padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Inicio",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(48, 52, 55, 1))),
                const SizedBox(
                  height: 16,
                ),
                const Text("Resumen",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(64, 68, 70, 1))),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.05),
                                blurRadius: 40,
                                offset: Offset(4, 6))
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(242, 248, 255, 1),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Icon(Icons.chat_bubble,
                                size: 15,
                                color: Color.fromRGBO(0, 112, 240, 1)),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(textResponsesCount.toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(48, 52, 55, 1))),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text("Rtas gen.",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(114, 119, 122, 1))),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 33,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/chat');
                  },
                  child: const HomeBannerRectangle(
                    backgroundColor: Color.fromRGBO(255, 249, 240, 1),
                    title: "Canal de Texto",
                    subtitle: "Chatea con IA",
                    badgeText: "CHATEÁ",
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                GestureDetector(
                  onTap: goToImagePage,
                  child: const HomeBannerRectangle(
                    backgroundColor: Color.fromRGBO(240, 240, 255, 1),
                    title: "Canal de imagen",
                    subtitle: "Imágenes desde imágenes",
                    badgeText: "CREÁ",
                  ),
                ),
              ],
            )));
  }
}
