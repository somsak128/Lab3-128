import 'package:flutter/material.dart';
import 'package:lab3info/models/course.dart';
import 'package:lab3info/models/faculty.dart';
import 'package:lab3info/models/shoes.dart';
import 'package:lab3info/models/year.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key, required this.title }) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  final _forkey = GlobalKey<FormState>();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _idcontroller = TextEditingController();


  
  String? yearvalue;
  late List<Year> years;

  String? coursevalue;
  late List<Course> courses;

  List<Faculty> dropdownItem = Faculty.getFaculty();
  late List<DropdownMenuItem<Faculty>> dropdownMenuItems;
  late Faculty _selectedItem;

  late List<Shoes> shoess;
  List selectedShoes = [];


  @override
  void initState() {
    super.initState();
    // years = Year.getYear();
    years = Year.getYear();
    courses = Course.getCourse();
    dropdownMenuItems = createDropdownMenu(dropdownItem);
    _selectedItem = dropdownMenuItems[0].value!;
    shoess = Shoes.getShoes();

    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Padding( 
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _forkey,
              child: Column(
                children: [
                  title(),
                  const SizedBox(height: 10,),
                  user(),
                  const SizedBox(height: 10,),
                  Id(),
                  const SizedBox(height: 10,),
                  title1(),
                  const SizedBox(height: 10,),
                  Column(
                    children: createYearRadio(),
                  ),
                  Text('Item Selected: $yearvalue'),
                  // Text('Selected: $yearvalue'),
                  const SizedBox(height: 10,),
                  title2(),
                  const SizedBox(height: 10,),
                  Column(
                    children: createCourseRadio(),
                  ),
                  Text('Item Selected: $coursevalue'),
                  // Text('Selected: $yearvalue'),
                  const SizedBox(height: 10,),
                  title3(),
                  const SizedBox(height: 10,),
                  DropdownButton(
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    elevation: 15,
                    style: const TextStyle(color: Colors.black54),
                    underline: Container(
                      height: 2,
                      color: Colors.indigo[700],
                    ),
                    value: _selectedItem,
                    items: dropdownMenuItems , 
                    onChanged: (value){
                      setState(() {
                        _selectedItem = value as Faculty;
                      });
                  },),
                  Text('Item selected: ' + _selectedItem.value.toString() + '' + _selectedItem.name),
                  const SizedBox(height: 10,),
                  title4(),
                  title5(),
                  const SizedBox(height: 10,),
                  Column(
                    children: createShoesCheckbox(),
                  ),
                  const SizedBox(height: 15,),
                  summit(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField user() {
    return TextFormField(
                  controller: _usernamecontroller,
                  validator: (value){
                    if (value!.isEmpty){
                      return ' Please Enter Username !';
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name-Surname',
                    prefixIcon: Icon(Icons.assignment_ind_outlined),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 2.0
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 2.0
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0
                      ),
                    ),
                  ),
                );
  }
  // ignore: non_constant_identifier_names
  TextFormField Id() {
    return TextFormField(
                  obscureText: true,
                  controller: _idcontroller,
                  validator: (value){
                    if (value!.isEmpty){
                      return ' Please Enter Student ID !';
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Student ID',
                    prefixIcon: Icon(Icons.contact_mail_outlined),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 2.0
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 2.0
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0
                      ),
                    ),
                  ),
                );
  }
  Widget summit() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ElevatedButton(
                    onPressed: (){
                      if (_forkey.currentState!.validate()){
                        // ignore: avoid_print
                        print(_usernamecontroller.text);
                        // ignore: avoid_print
                        print(_idcontroller.text);

                      }
                    },
                    style: const ButtonStyle(

                    ),
                    child: const Text('Submit'),
                  
                  ),
    );
  }
  List<Widget> createYearRadio() {
    List<Widget> listRadioYear = [];

    listRadioYear = years
        .map(
          (year) => RadioListTile<dynamic>(
            title: Text(year.enName),
            subtitle: Text(year.thName),
            value: year.yearvalue, 
            groupValue: yearvalue, 
            onChanged: (value) {
              setState(() {
                // ignore: unused_local_variable
                yearvalue = value;
              });
            }),
        )
        .toList();

    return listRadioYear;
  }
  List<Widget> createCourseRadio() {
    List<Widget> listRadioCourse = [];

    listRadioCourse = courses
        .map(
          (course) => RadioListTile<dynamic>(
            title: Text(course.enName),
            subtitle: Text(course.thName),
            value: course.coursevalue, 
            groupValue: coursevalue, 
            onChanged: (value) {
              setState(() {
                // ignore: unused_local_variable
                coursevalue = value;
              });
            }),
        )
        .toList();

    return listRadioCourse;
  }
  List<DropdownMenuItem<Faculty>> createDropdownMenu(
     List<Faculty> dropdownItem) {
    List<DropdownMenuItem<Faculty>> items = [];
    for (var item in dropdownItem) {
      items.add(DropdownMenuItem(
        child: Text(item.name),
        value: item,
      ));
    }
    return items;
  }
  List<Widget> createShoesCheckbox() {
    List<Widget> listCheckboxShoes = [];

    for (var shoes in shoess) {
      listCheckboxShoes.add(
        CheckboxListTile(
          title: Text(shoes.engName),
          subtitle: Text('price: ${shoes.price} บาท'),
          value: shoes.checked,
          onChanged: (value){
            setState(() {
              shoes.checked = value!;
            });
            if(value!){
              selectedShoes.add(shoes.engName);
            }
            else {
              selectedShoes.remove(shoes.engName);
            }
            // ignore: avoid_print
            print(selectedShoes);
          },
        ),
      );
    }
    return listCheckboxShoes;
  }


  Widget title() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5,5,5,5),
      child: Text(
            'Personal Information',
            style: TextStyle(
              color: Colors.indigo[700],
              fontSize: 25,
            ),
            ),
    );
  }
  Widget title1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5,5,5,5),
      child: Text(
            'College Years',
            style: TextStyle(
              color: Colors.indigo[700],
              fontSize: 25,
            ),
            ),
    );
  }
  Widget title2() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5,5,5,5),
      child: Text(
            'course',
            style: TextStyle(
              color: Colors.indigo[700],
              fontSize: 25,
            ),
            ),
    );
  }
  Widget title3() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5,5,5,5),
      child: Text(
            'Faculty',
            style: TextStyle(
              color: Colors.indigo[700],
              fontSize: 25,
            ),
            ),
    );
  }
  Widget title4() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5,5,5,5),
      child: Text(
            'สิ่งที่ชอบ',
            style: TextStyle(
              color: Colors.indigo[700],
              fontSize: 25,
            ),
            ),
    );
  }
   Widget title5() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5,1,5,5),
      child: Text(
            '" รองเท้า "',
            style: TextStyle(
              color: Colors.indigo[800],
              fontSize: 15,
            ),
            ),
    );
  }
}
