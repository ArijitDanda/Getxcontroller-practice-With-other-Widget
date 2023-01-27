import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

enum Reaction { like, laugh, love, none }

class TestReactionbutton extends StatefulWidget {
  final String title;
  const TestReactionbutton({super.key, required this.title});
  @override
  State<TestReactionbutton> createState() => _TestReactionbuttonState();
}

class _TestReactionbuttonState extends State<TestReactionbutton> {
  Reaction _reaction = Reaction.none;
  bool reationview = false;
  final List<Reactionelement> reactiones = [
    Reactionelement(
        Reaction.like,
        const Icon(
          Icons.thumb_up_off_alt_rounded,
          color: Colors.blue,
        )),
    Reactionelement(
        Reaction.love,
        const Icon(
          Icons.favorite,
          color: Colors.red,
        )),
    Reactionelement(
        Reaction.laugh,
        const Icon(
          Icons.emoji_emotions_rounded,
          color: Colors.deepPurple,
        )),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2ETPUM3G6l9Pe3VTHbMbx_yfLk5KqZ_kU9w&usqp=CAU',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            // if (reationview == )
            /*  Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200),
                child: ListView.builder(
                  itemCount: reactiones.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50,
                        child: FadeInAnimation(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _reaction = reactiones[index].reactions;
                                  reationview = false;
                                });
                              },
                              icon: reactiones[index].icon),
                        ),
                      ),
                    );
                  },
                ),
              ), */
            InkWell(
              onTap: () {
                setState(() {
                  if (reationview) {
                    reationview == false;
                  } else if (_reaction == Reaction.none) {
                    _reaction == Reaction.love;
                  } else {
                    _reaction = Reaction.none;
                  }
                });
              },
              onLongPress: () {
                showReactionDialog(context);
              },
              child: getreactionIcon(_reaction),
            ),
          ],
        ),
      ),
    );
  }

  Icon getreactionIcon(Reaction r) {
    switch (r) {
      case Reaction.like:
        return const Icon(
          Icons.thumb_up_off_alt_rounded,
          color: Colors.blue,
        );
      case Reaction.love:
        return const Icon(
          Icons.favorite,
          color: Colors.red,
        );
      case Reaction.laugh:
        return const Icon(
          Icons.emoji_emotions_rounded,
          color: Colors.deepPurple,
        );
      default:
        return const Icon(
          Icons.thumb_up_alt_outlined,
          color: Colors.blue,
        );
    }
  } 
  showReactionDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200),
          child: ListView.builder(
              itemCount: reactiones.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50,
                    child: FadeInAnimation(
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              _reaction = reactiones[index].reactions;
                              reationview = false;
                            });
                            Navigator.pop(context);
                          },
                          icon: reactiones[index].icon),
                    ),
                  ),
                );
              })),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class Reactionelement {
  final Reaction reactions;
  final Icon icon;
  Reactionelement(this.reactions, this.icon);
}
