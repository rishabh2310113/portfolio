import 'package:flutter/material.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  myAchiev(num, type){ 
    return  Row(
                    children: [
                      Text(num,
                             style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold,)),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child:  Text(type),
                      )
                    ],
                  );
  }

  mySpec(icon , tech){
    return Container(
                    width: 105,
                    height: 115,
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      color: const Color(0xff252525),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(icon, color: Colors.white,),

                          const SizedBox(
                            height: 10,
                          ),


                          Text(tech, style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),)
                          ],
                        ),
                      ),
                    ),
                  );
  }
  
  
  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width>600;
    return Scaffold(
    backgroundColor: Colors.black,
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      leading: PopupMenuButton(
        color: Colors.black,
        icon: Icon(Icons.menu),
        iconColor: Colors.white,
        itemBuilder: (context) =>[
          PopupMenuItem(value: 1,child: TextButton(
            child: const Text('Projects' , style: TextStyle(color: Colors.white)),
            onPressed: (){
             // Navigator.pushNamed(context, 'projects');
            },
           ),
           ),
             PopupMenuItem(value: 2,child: TextButton(
            child: const Text('About Me' , style: TextStyle(color: Colors.white)),
            onPressed: (){
              Navigator.pushNamed(context, 'about');
            },
           ),
           )
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    body: SlidingSheet(
      elevation: 8,
      cornerRadius: 50,
      snapSpec: const SnapSpec(
        // Enable snapping. This is true by default.
        snap: true,
        // Set custom snapping points.
        snappings: [0.38, 0.7, 1.0],
        // Define to what the snappings relate to. In this case, 
        // the total available space that the sheet can expand to.
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      // The body widget will be displayed under the SlidingSheet
      // and a parallax effect can be applied to it.
      body: Container(
        child: Stack(
          children: [
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
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.49),
              child: const Column(
                children: [
                  Text(
                  'Rishabh Ranjan',
                  style: TextStyle(
                    color: Colors.white,
                fontSize: 40,
                 fontWeight: FontWeight.bold),
                ),
                 Text(
                  'Software Developer',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                 ),
                ],
              )
            )
          ],
        ),
      ),
      builder: (context, state) {
        // This is the content of the sheet that will get
        // scrolled, if the content is bigger than the available
        // height of the sheet.
        return Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 30),
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    myAchiev('4', ' Projects'),
                     myAchiev('450+', ' connections'),
                      myAchiev('1200+', ' Codechef'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Specialized In', style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold,
              ),),

              const SizedBox( height: 10,),
              Column(
               children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [mySpec(Icons.android, 'Andriod'), mySpec(Icons.flutter_dash, 'flutter'), mySpec(Icons.ios_share, 'Ios_Share')],
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [mySpec(Icons.add_a_photo_outlined, 'PhotoGraphy'), mySpec(Icons.add_to_drive_outlined, 'G Drive'), mySpec(Icons.adobe_outlined, 'Adobe')],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [mySpec(Icons.apple_rounded, 'Apple'), mySpec(Icons.window_sharp, 'Windows'), mySpec(Icons.vpn_lock_outlined, 'VPN')],
                ),
                const SizedBox(
                  height: 10,
                )
               ],
              )
            ],
          ),
        );
      },
    ),
  );
  }
}