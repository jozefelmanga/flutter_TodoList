import 'dart:convert';
import 'loginPage.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  final token;
  const Dashboard({@required this.token, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String userId;
  late SharedPreferences prefs;
  TextEditingController _todoItem = TextEditingController();
  List? items;
  @override
  void initState() {
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

    userId = jwtDecodedToken['_id'];
    getTodoList(userId);
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }
  void addTodo() async {
    if (_todoItem.text.isNotEmpty) {
      var regBody = {
        "item": _todoItem.text,
      };

      var response = await http.post(Uri.parse('$apiTodos/$userId'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));

      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse['success']);

      if (jsonResponse['success']) {
        _todoItem.clear();
        Navigator.pop(context);
        getTodoList(userId);
      } else {
        print("SomeThing Went Wrong");
      }
    }
  }

  void getTodoList(userId) async {
    var response = await http.get(
      Uri.parse('$apiTodos/$userId'),
      headers: {"Content-Type": "application/json"},
    );

    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['success']) {
      setState(() {
        items = jsonResponse['data'];
      });
    } else {
      print("Something Went Wrong");
    }
  }

  void deleteItem(id) async {
    var response = await http.delete(
      Uri.parse('$apiTodos/$id'),
      headers: {"Content-Type": "application/json"},
    );

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['success']) {
      getTodoList(userId);
    }
  }

void logout() {
  prefs.remove('token');
  // Navigate to the login screen and replace the current route
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => SignInPage()),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
         automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: logout,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  'ToDo list',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 8.0),
                Text('${items?.length} Task', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: items == null
                    ? null
                    : ListView.builder(
                        itemCount: items!.length,
                        itemBuilder: (context, int index) {
                          return Slidable(
                            key: ValueKey(index),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              dismissible: DismissiblePane(onDismissed: () {
                                print('${items![index]['_id']}');
                                deleteItem('${items![index]['_id']}');
                              }),
                              children: [
                                SlidableAction(
                                  backgroundColor: Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                  onPressed: (BuildContext context) {
                                    print('${items![index]['_id']}');
                                    deleteItem('${items![index]['_id']}');
                                  },
                                ),
                              ],
                            ),
                            child: Card(
                              borderOnForeground: false,
                              child: ListTile(
                                leading: Icon(Icons.task),
                                title: Text('${items![index]['item']}'),
                                trailing: Icon(Icons.arrow_back),
                              ),
                            ),
                          );
                        }),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayTextInputDialog(context),
        child: Icon(Icons.add),
        tooltip: 'Add-ToDo',
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Add To-Do'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _todoItem,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Add item",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                  ).p4().px8(),
                  ElevatedButton(
                      onPressed: () {
                        addTodo();
                      },
                      child: Text("Add"))
                ],
              ));
        });
  }
}
