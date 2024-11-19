import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class MyAbout extends StatefulWidget {
  const MyAbout({super.key});

  @override
  State<MyAbout> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyAbout> {
  @override
  Widget build(BuildContext context) {
     final isWideScreen = MediaQuery.of(context).size.width>600;
    return Scaffold(
      backgroundColor: Colors.black,
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    body:  Container(
        child: Stack(
          children: [
            // Container(
            //   //margin: EdgeInsets.only(top: 60),
            //   child: Image.asset('assets/Port1.jpeg', height: 400, width: 1000, fit: BoxFit.contain,),
            // ),
             Container(
              margin: const EdgeInsets.only(top: 35),
               child: ShaderMask(
                shaderCallback: (bounds){
                  return const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black , Colors.transparent])
                    .createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child : Image.asset('assets/Port1.png',
                 height: isWideScreen ? 700 : 570, fit: BoxFit.contain,),),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.59),
              //const SizedBox(height: 10,),
              child: Column(
                children: [
                  const Text('Hello I am',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  ),
                  const Text(
                  'Rishabh Ranjan',
                  style: TextStyle(
                    color: Colors.white,
                fontSize: 40,
                 fontWeight: FontWeight.bold),
                ),
                 const Text(
                  'Software Developer',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                 ),

                 const SizedBox(
                  height: 20,
                 ),
                 SizedBox(
                  width: 120,
                    child: TextButton(onPressed: (){
                      
                    }, child: Text('Hire Me'), style: TextButton.styleFrom(backgroundColor: Colors.white),),
                 ),
                 const SizedBox(
                  height: 40,
                 ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () async{
                       final Uri url = Uri.parse('https://www.instagram.com/invites/contact/?igsh=q6tstl4h6m60&utm_content=p3io3ir');
                       if(!await launchUrl(url)){
                        throw Exception('could not load $url');
                       }
                    }, icon: const Icon(
                      FontAwesomeIcons.instagram, color: Colors.white,
                    )),
                    IconButton(onPressed: () async{
                      final Uri url = Uri.parse('https://www.linkedin.com/in/rishabh-ranjan18/');
                       if(!await launchUrl(url)){
                        throw Exception('could not load $url');
                       }
                    }, icon: const Icon(
                      FontAwesomeIcons.linkedin, color: Colors.white,
                    )),
                    IconButton(onPressed: () async{
                      final Uri url = Uri.parse('https://github.com/rishabh2310113');
                       if(!await launchUrl(url)){
                        throw Exception('could not load $url');
                       }
                    }, icon: const Icon(
                      FontAwesomeIcons.github, color: Colors.white,
                    )),
                    IconButton(onPressed: () async{
                      final Uri url = Uri.parse('https://x.com/Rishabh2310113');
                       if(!await launchUrl(url)){
                        throw Exception('could not load $url');
                       }
                    }, icon: const Icon(
                      FontAwesomeIcons.twitter, color: Colors.white,
                    )),
                    IconButton(onPressed: () async{
                      final Uri url = Uri.parse('https://x.com/Rishabh2310113');
                       if(!await launchUrl(url)){
                        throw Exception('could not load $url');
                       }
                    }, icon: const Icon(
                      FontAwesomeIcons.facebook, color: Colors.white,
                    ))
                  ],
                 )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}