import 'package:flutter/material.dart';

class IconDragAndMove extends StatefulWidget {
   IconDragAndMove({ super.key,this.starIconList});

   List? starIconList=[];



  @override
  _IconDragAndMoveState createState() => _IconDragAndMoveState();
}

class _IconDragAndMoveState extends State<IconDragAndMove> {
  

  List<Color> iconColor=[
    Colors.black,
    Colors.amber,
    Colors.red,
    Colors.blue
    
  ];
  

  void updateMyList(int oldIndex,int newIndex){
    setState(() {
      //do some adjustment while moving tile from top to buttom
      if(oldIndex<newIndex){
        newIndex--;
      }
      //get the tiles we are moving
      var movingtile1=widget.starIconList!.removeAt(oldIndex);

      //place the tile in the new position
      widget.starIconList!.insert(newIndex, movingtile1);
       
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 25,
              child: ReorderableListView(
                
                scrollDirection: Axis.horizontal,
                children: [
                for (int index = 0; index < widget.starIconList!.length; index++)
                    Padding(
                      key: ValueKey(widget.starIconList![index]),
                      padding: const EdgeInsets.only(left: 10,top: 5),
                      child: Icon(
                        widget.starIconList![index],
                        color: iconColor[index % iconColor.length],
                        size: 20,
                        
                      ),
                    ),
                    
              ], onReorder: (oldIndex,newIndex)=>updateMyList(oldIndex, newIndex)),
            ),
           
          ],
        ),
      ),
    );
  }
}