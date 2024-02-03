
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hello24_assignment/drag_icons.dart';
import 'constants/dropdownItems.dart';

class GeneralTab extends StatefulWidget {
  const GeneralTab({super.key});

  @override
  State<GeneralTab> createState() => _GeneralTabState();
}

class _GeneralTabState extends State<GeneralTab> {
  String? selectedValueLanguages;
  String? selectedValueCountryCode;
  String? selectedValueFontFamily;
  String? selectedValueFontSize;

  String? selectedSignFontFamily;
  String? signFontFamily;
  
  String? selectedSignFontSize;
  double? signFontSize;
  
    String? fontfamily;
    double? fontsize;
 
  Color currentColor = Colors.blue;

  void changeColor(Color color) {
    setState(() {
      currentColor = color;
    });
  }

  void setDefaultValue() {
    setState(() {
      selectedValueFontFamily = dropdownItemsFontFamily[0].value;
      fontfamily = "Roboto";
      fontsize = 14;
      currentColor = Colors.blue;
    });
  }

  var signDescController = TextEditingController();


  var top = 0.0;
  var left = 50.0;
  Widget? container;
  var signController = TextEditingController();
  List<String> signList = [];
  final GlobalKey<_GeneralTabState> _key = GlobalKey<_GeneralTabState>();

  void addSignToList() {
    String inputText = signController.text;
    if (inputText.isNotEmpty) {
      setState(() {
        signList.add(inputText);
        signController.clear();
      });
    }
  }


  void deleteSignFromList(int index) {
    if (_key.currentState?.mounted ?? false) {
      setState(() {
        signList.removeAt(index);
      });
    }
  }

  TextStyle getSignatureTextStyle() {
    return TextStyle(
      fontFamily: signFontFamily,
      fontSize: signFontSize ?? 14,
    );
  }

  List inUseStarIconList=[Icons.star,Icons.favorite,Icons.camera];
  List notInUseStarIconList=[Icons.star,Icons.info_outline,Icons.keyboard_double_arrow_right_outlined,Icons.question_mark_outlined];

   @override
  void initState() {
    super.initState();
    selectedValueLanguages = dropdownItemsLanguages[0].value!;
    selectedValueCountryCode = dropdownItemsCountryCode[0].value!;
    selectedValueFontFamily = dropdownItemsFontFamily[0].value!;
    selectedValueFontSize = dropdownItemsFontSize[0].value!;
    selectedSignFontFamily=signatureFontFamily[0].value!;
    selectedSignFontSize=signatureFontSize[0].value!;
    getSignatureTextStyle();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          bottom: TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
              tabs: [
                Tab(text: 'General'),
                Tab(text: 'Labels'),
                Tab(text: 'Accounts and import'),
                Tab(text: 'Filters and blocked address'),
                Tab(text: 'Forwarding and POP/IMAP'),
                Tab(text: 'Add-ons'),
                Tab(text: 'Chat and Meet'),
                Tab(text: 'Advanced'),
                Tab(text: 'Offline'),
                Tab(text: 'Themes'),
              ]),
        ),
        body: TabBarView(
          children: [
            // Content of Tab 1
            Center(
                child: Column(
              children: [
                languageSection(),
                Divider(),
                phoneNumberSection(),
                Divider(),
                defaultTextStyleSection(context),
                Divider(),
                starsSection(),
                Divider(),
                signatureSection(context),
              ],
            )),

            // Content of Tab 2
            Center(
              child: Text('Tab 2 Content'),
            ),

            // Content of Tab 3
            Center(
              child: Text('Tab 3 Content'),
            ),
            // Content of Tab 4
            Center(
              child: Text('Tab 4 Content'),
            ),

            // Content of Tab 5
            Center(
              child: Text('Tab 5 Content'),
            ),

            // Content of Tab 6
            Center(
              child: Text('Tab 6 Content'),
            ),
            // Content of Tab 7
            Center(
              child: Text('Tab 7 Content'),
            ),

            // Content of Tab 8
            Center(
              child: Text('Tab 8 Content'),
            ),

            // Content of Tab 9
            Center(
              child: Text('Tab 9 Content'),
            ),
            // Content of Tab 10
            Center(
              child: Text('Tab 10 Content'),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox signatureSection(BuildContext context) {
    return SizedBox(
                child: Padding(
                  padding: container != null
                      ? const EdgeInsets.only(left: 21, right: 300, top: 11)
                      : const EdgeInsets.only(left: 21, right: 858, top: 11),
                  child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Signature:',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "(appended at the end of all outgoing messages.)",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    //fontFamily: "Mulish"
                                  ),
                                ),
                                Text(
                                  'Learn more',
                                  style: TextStyle(color: Colors.indigo),
                                )
                              ],
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            container != null
                                ? container!
                                : Text(
                                    'No signatures',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.white),
                                    shape: MaterialStatePropertyAll(
                                        BeveledRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(1),
                                            side: BorderSide(
                                                color: Colors.grey,
                                                width: 0.5)))),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: BeveledRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(1)),
                                          title: Container(
                                            height: 200,
                                            width: 400,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('New name signature'),
                                                  TextField(
                                                    controller:
                                                        signController,
                                                    autofocus: true,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Signature name",
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        1),
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .indigo,
                                                                width: 1)),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        1),
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .indigo,
                                                                width: 1))),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            addSignToList();
                                                            container =
                                                                Container(
                                                              height: 120,
                                                              width: 700,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Container(
                                                                          height: 120,

                                                                      decoration:
                                                                          BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
                                                                      child: signList.isNotEmpty
                                                                          ? ListView.builder(
                                                                            shrinkWrap: true,
                                                                            
                                                                            
                                                                              itemCount: signList.length,
                                                                              itemBuilder: (_, index) {
                                                                                var signature = signList[index];
                                                                                return Card(
                                                                                  child: ListTile(
                                                                                    tileColor: Colors.white,
                                                                                    title: Text(signature),
                                                                                    trailing: InkWell(
                                                                                        onTap: () {
                                                                                          //deleteSignFromList(index);
                                                                                          //Navigator.pop(context);
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.delete_outline,
                                                                                          color: Colors.black,
                                                                                          size: 21,
                                                                                        )),
                                                                                  ),
                                                                                );
                                                                              })
                                                                          : Container(),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 7,
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              88,
                                                                          decoration:
                                                                              BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsets.all(8.0),
                                                                            child: TextField(
                                                                              controller: signDescController,
                                                                              style: getSignatureTextStyle(),
                                                                              decoration: InputDecoration.collapsed(hintText: "")),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              30,
                                                                          decoration:
                                                                              BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
                                                                          child:
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                            
                                                                                Container(
                                                                                padding: EdgeInsets.only(left: 5),
                                                                                height: 24,
                                                                                width: 150,
                                                                                child: DropdownButton(
                                                                                  focusColor: Colors.transparent,
                                                                                  icon: Icon(Icons.arrow_drop_down),
                                                                                  value: selectedSignFontFamily,
                                                                                  items: signatureFontFamily,
                                                                                  onChanged: (value) {
                                                                                    print(value);
                                                                                    setState(() {
                                                                                      selectedSignFontFamily = value!;
                                                                                      if (selectedSignFontFamily == signatureFontFamily[0].value) {
                                                                                        signFontFamily = "Roboto";
                                                                                        print(signFontFamily);
                                                                                      }
                                                                                      if (selectedSignFontFamily == signatureFontFamily[1].value) {
                                                                                        signFontFamily = "Mulish";
                                                                                      }
                                                                                      if (selectedSignFontFamily == signatureFontFamily[2].value) {
                                                                                        signFontFamily = "Poppins";
                                                                                      }
                                                                                      if (selectedSignFontFamily == signatureFontFamily[3].value) {
                                                                                        signFontFamily = "Playfair";
                                                                                      }
                                                                                    });
                                                                                  },
                                                                                  hint: Text('Select an option'),
                                                                                  underline: Container(),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                padding: EdgeInsets.only(left: 5),
                                                                                height: 24,
                                                                                child: DropdownButton(
                                                                                  focusColor: Colors.transparent,
                                                                                  icon: Icon(Icons.arrow_drop_down),
                                                                                  //value: selectedValueFontSize,
                                                                                  items: signatureFontSize,
                                                                                  onChanged: (value) {
                                                                                    setState(() {
                                                                                      selectedSignFontSize = value!;
                                                                                      if (selectedSignFontSize == signatureFontSize[0].value) {
                                                                                        signFontSize = 10;
                                                                                      }
                                                                                      if (selectedSignFontSize == signatureFontSize[1].value) {
                                                                                        signFontSize = 14;
                                                                                      }
                                                                                      if (selectedSignFontSize == signatureFontSize[2].value) {
                                                                                        signFontSize = 16;
                                                                                      }
                                                                                      if (selectedSignFontSize == signatureFontSize[3].value) {
                                                                                        signFontSize = 18;
                                                                                      }
                                                                                    });
                                                                                  },
                                                                                  hint: Text('TT'),
                                                                                  underline: Container(),
                                                                                ),
                                                                              ),
                                                                            
                                                                            Text('B',style: TextStyle(fontWeight: FontWeight.bold),),
                                                                            Text('U',style: TextStyle(decoration: TextDecoration.underline),),
                                                                            Text('I',style: TextStyle(fontStyle: FontStyle.italic),),
                                                                            Text('A'),
                                                                            Icon(Icons.link),
                                                                            Icon(Icons.photo),
                                                                            Icon(Icons.list),
                                                                            Icon(Icons.format_list_numbered)
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            );
                                                            setState(() {});

                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          style: ButtonStyle(
                                                              foregroundColor:
                                                                  MaterialStatePropertyAll(
                                                                      Colors
                                                                          .white),
                                                              backgroundColor:
                                                                  MaterialStatePropertyAll(
                                                                      Colors
                                                                          .blue)),
                                                          child:
                                                              Text("Create")),
                                                    ],
                                                  )
                                                ]),
                                          ),
                                        );
                                      });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      'Create new',
                                      style: TextStyle(color: Colors.blue),
                                    )
                                  ],
                                ))
                          ],
                        )
                      ]),
                ),
              );
  }

  SizedBox starsSection() {
    return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Stars:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 1000,
                            child: RichText(
                              text: const TextSpan(
                                text: 'Drag the stars between the lists.',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                      text:
                                          'The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text('Presets:'),
                              SizedBox(width: 11),
                              Text(
                                '1 star',
                                style: TextStyle(color: Colors.indigo),
                              ),
                              SizedBox(width: 11),
                              Text(
                                '4 stars',
                                style: TextStyle(color: Colors.indigo),
                              ),
                              SizedBox(width: 11),
                              Text(
                                'All stars',
                                style: TextStyle(color: Colors.indigo),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 200,
                            height: 30,
                            child: Row(
                              children: [
                                Text(
                                  'In use:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10,),
                                Expanded(child: IconDragAndMove(starIconList: inUseStarIconList,))
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            height: 30,
                            child: Row(
                              children: [
                                Text(
                                  'Not in use:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10,),
                                Expanded(child: IconDragAndMove(starIconList: notInUseStarIconList,))
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
  }

  SizedBox defaultTextStyleSection(BuildContext context) {
    return SizedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 21, right: 609, top: 11),
                  child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Default text style:',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "(Use the 'Remove formatting button on the tool bar to reset the default text style.)",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    //fontFamily: "Mulish"
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 400,
                          child: Card(
                            surfaceTintColor: Colors.white,
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(1)),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 5),
                                          height: 24,
                                          width: 150,
                                          child: DropdownButton(
                                            focusColor: Colors.transparent,
                                            icon: Icon(Icons.arrow_drop_down),
                                            value: selectedValueFontFamily,
                                            items: dropdownItemsFontFamily,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValueFontFamily =
                                                    value!;
                                                if (selectedValueFontFamily ==
                                                    dropdownItemsFontFamily[0]
                                                        .value) {
                                                  fontfamily = "Roboto";
                                                }
                                                if (selectedValueFontFamily ==
                                                    dropdownItemsFontFamily[1]
                                                        .value) {
                                                  fontfamily = "Mulish";
                                                }
                                                if (selectedValueFontFamily ==
                                                    dropdownItemsFontFamily[2]
                                                        .value) {
                                                  fontfamily = "Poppins";
                                                }
                                                if (selectedValueFontFamily ==
                                                    dropdownItemsFontFamily[3]
                                                        .value) {
                                                  fontfamily = "Playfair";
                                                }
                                              });
                                            },
                                            hint: Text('Select an option'),
                                            underline: Container(),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 5),
                                          height: 24,
                                          child: DropdownButton(
                                            focusColor: Colors.transparent,
                                            icon: Icon(Icons.arrow_drop_down),
                                            //value: selectedValueFontSize,
                                            items: dropdownItemsFontSize,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValueFontSize =
                                                    value!;
                                                if (selectedValueFontSize ==
                                                    dropdownItemsFontSize[0]
                                                        .value) {
                                                  fontsize = 10;
                                                }
                                                if (selectedValueFontSize ==
                                                    dropdownItemsFontSize[1]
                                                        .value) {
                                                  fontsize = 14;
                                                }
                                                if (selectedValueFontSize ==
                                                    dropdownItemsFontSize[2]
                                                        .value) {
                                                  fontsize = 16;
                                                }
                                                if (selectedValueFontSize ==
                                                    dropdownItemsFontSize[3]
                                                        .value) {
                                                  fontsize = 18;
                                                }
                                              });
                                            },
                                            hint: Text('TT'),
                                            underline: Container(),
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Pick a color'),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: ColorPicker(
                                                          pickerColor:
                                                              currentColor,
                                                          onColorChanged:
                                                              changeColor,
                                                          showLabel: true,
                                                          pickerAreaHeightPercent:
                                                              0.8,
                                                        ),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('OK'),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  "A",
                                                  style: TextStyle(
                                                      fontFamily: "Mulish"),
                                                ),
                                                Icon(Icons.arrow_drop_down)
                                              ],
                                            )),
                                        InkWell(
                                            onTap: () {
                                              setDefaultValue();
                                            },
                                            child: Text("Clear"))
                                      ],
                                    ),
                                    Text(
                                      'This is what your body text will look like',
                                      style: TextStyle(
                                          color: currentColor,
                                          fontSize: fontsize,
                                          fontFamily: fontfamily),
                                    ),
                                  ]),
                            ),
                          ),
                        )
                      ]),
                ),
              );
  }

  SizedBox phoneNumberSection() {
    return SizedBox(
                height: 70,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 21, right: 645, top: 11),
                  child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              'Phone numbers:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                        Text(
                          "Default country code:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          height: 24,
                          width: 200,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          child: DropdownButton(
                            focusColor: Colors.transparent,
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 38.0),
                              child: Icon(Icons.keyboard_arrow_down),
                            ),
                            value: selectedValueCountryCode,
                            items: dropdownItemsCountryCode,
                            onChanged: (value) {
                              setState(() {
                                selectedValueCountryCode = value!;
                              });
                            },
                            hint: Text('Select an option'),
                            underline: Container(),
                          ),
                        ),
                      ]),
                ),
              );
  }

  SizedBox languageSection() {
    return SizedBox(
                height: 70,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 21, right: 185, top: 11),
                  child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              'Language:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gmail display language:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Show all language options',
                                style: TextStyle(color: Colors.indigo),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          height: 25,
                          width: 300,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          child: DropdownButton(
                            focusColor: Colors.transparent,
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 140.0),
                              child: Icon(Icons.keyboard_arrow_down),
                            ),
                            value: selectedValueLanguages,
                            items: dropdownItemsLanguages,
                            onChanged: (value) {
                              setState(() {
                                selectedValueLanguages = value!;
                              });
                            },
                            hint: Text('Select an option'),
                            underline: Container(),
                          ),
                        ),
                        SizedBox(width: 5),
                        InkWell(
                            onHover: (value) {
                              UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.indigo, width: 1));
                            },
                            onTap: () {},
                            child: Text(
                              'Change language settings for other google products',
                              style: TextStyle(color: Colors.indigo),
                            ))
                      ]),
                ),
              );
  }
}
