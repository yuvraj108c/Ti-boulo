import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:ti_boulo/models/task.dart';
import 'package:ti_boulo/screens/utils/Validator.dart';
import 'package:ti_boulo/widgets/MyAppBar.dart';
import 'package:ti_boulo/widgets/MyDrawer.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

import '../constant.dart';

class MyData {
  String name = '';
  String phone = '';
  String email = '';
  String age = '';
}

class TaskScreen extends StatefulWidget {
  TaskScreen({Key key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Task"),
      body: Center(
        child: CreateTask(),
      ),
      drawer: MyDrawer(),
      // floatingActionButton: new FloatingActionButton.extended(
      //     onPressed: null, label: new Text("Save"), icon: Icon(Icons.save))
    );
  }
}

class CreateTask extends StatefulWidget {
  CreateTask({Key key}) : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StepperBody(),
    );
  }
}

class StepperBody extends StatefulWidget {
  @override
  _StepperBodyState createState() => new _StepperBodyState();
}

class _StepperBodyState extends State<StepperBody> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  int currStep = 0;
  static var _fnTitle = new FocusNode(); // Focus Node
  static var _fnDescription = new FocusNode();
  static MyData data = new MyData();
  static Task newTask = new Task();
  static List<bool> selectedLocation = [true, false];
  static bool locationChosen = false, dateChosen = false;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      newTask.title = _titleController.text;
    });
    _descriptionController.addListener((){
      newTask.description = _descriptionController.text;
    });
  }

  @override
  void dispose() {
    _fnTitle.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(context)
          .showSnackBar(new SnackBar(content: new Text(message)));
    }

    void _submitDetails() {
      final FormState formState = _formKey.currentState;

      print(newTask.title);
      print(newTask.description);
      print(newTask.toString());

      if (!formState.validate()) {
        // TODO: Add missing validations: date and location etc
        showSnackBarMessage('Please enter correct data');
      } else {
        formState.save();

        showDialog(
            context: context,
            child: new AlertDialog(
              title: new Text("Details"),
              //content: new Text("Hello World"),
              content: new SingleChildScrollView(
                child: new Text(newTask.toString()),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
      }
    }

    return new Container(
        child: new Form(
      key: _formKey,
      child: new ListView(children: <Widget>[
        new Stepper(
          steps: [
            new Step(
              title: const Text('Details'),
              subtitle: const Text('General details about the Task'),
              isActive: true,
              state: StepState.indexed,
              content: new Column(
                children: <Widget>[
                  new TextFormField(
                    // Title
                    focusNode: _fnTitle,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    onSaved: (String value) {
                      newTask.title = value;
                    },
                    maxLines: 1,
                    validator: (value) =>
                        Validator.emptyValidator("Title", value),
                    decoration: new InputDecoration(
                        labelText: 'Title',
                        hintText: 'Title of the Task',
                        labelStyle: new TextStyle(
                            decorationStyle: TextDecorationStyle.solid)),
                            controller: _titleController,
                  ),
                  new TextFormField(
                    // Details
                    focusNode: _fnDescription,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    onSaved: (String value) {
                      newTask.description = value;
                    },
                    minLines: 3,
                    maxLines: 5,
                    validator: (value) => Validator.emptyValidator("Description ", value),
                    decoration: new InputDecoration(
                        labelText: 'Description',
                        hintText:
                            'Describe the project. Keep the description simple but accurate.',
                        //filled: true,
                        labelStyle: new TextStyle(
                            decorationStyle: TextDecorationStyle.solid)),
                            controller: _descriptionController,
                  )
                ],
              ),
            ),
            new Step(
                title: const Text('Categories'),
                subtitle: const Text('Choose tags relevant to the Task'),
                isActive: true,
                //state: StepState.editing,
                state: StepState.indexed,
                content: FlutterTagging<Category>(
                    initialItems: newTask.categories,
                    textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.green.withAlpha(30),
                        hintText: 'Search Tags',
                        labelText: 'Select Tags',
                      ),
                    ),
                    findSuggestions: Category.getCategories,
                    additionCallback: (value) {
                      print(value);
                      // newTask.categories.add(Category.getCategory(value));

                      return Category(name: value);
                    },
                    onAdded: (language) {
                      // api calls here, triggered when add to tag button is pressed
                      print(language.name);
                      print("added");
                      return Category();
                    },
                    configureSuggestion: (category) {
                      return SuggestionConfiguration(
                        title: Text(category.name),
                        subtitle: Text(category.projectCount.toString()),
                        additionWidget: Chip(
                          avatar: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                          label: Text('Add New Tag'),
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    configureChip: (lang) {
                      return ChipConfiguration(
                        label: Text(lang.name),
                        backgroundColor: Colors.green,
                        labelStyle: TextStyle(color: Colors.white),
                        deleteIconColor: Colors.white,
                      );
                    },
                    onChanged: () {
                      // triggered when a new item is added to the list
                    })),
            new Step(
                title: const Text('Date Range'),
                subtitle: const Text('When to get the Task done'),
                isActive: true,
                state: StepState.indexed,
                // state: StepState.disabled,
                content: new Column(
                  children: <Widget>[
                    new MaterialButton(
                        color: kMainColor,
                        textColor: kMainBackgroundColor,
                        onPressed: () async {
                          final List<DateTime> picked =
                              await DateRagePicker.showDatePicker(
                                  context: context,
                                  initialFirstDate: new DateTime.now(),
                                  initialLastDate: (new DateTime.now())
                                      .add(new Duration(days: 7)),
                                  firstDate:
                                      new DateTime(new DateTime.now().year),
                                  lastDate: new DateTime(
                                      new DateTime.now().year + 1));
                          if (picked != null && picked.length == 2) {
                            newTask.startDate = picked[0];
                            newTask.endDate =
                                picked[0] == picked[1] ? null : picked[1];
                            print(newTask.stringifyDate());
                            dateChosen = true;
                          }
                          setState(() {});
                        },
                        child: new Text("Choose a date range")),
                    !dateChosen
                        ? new Text("Choose a date to get the job done")
                        : new Text(newTask.stringifyDate())
                  ],
                )),
            new Step(
                title: const Text('Location'),
                subtitle: const Text('Where to get the Task done'),
                isActive: true,
                state: StepState.indexed,
                // state: StepState.disabled,
                content: new Column(
                  children: <Widget>[
                    new ToggleButtons(
                      children: <Widget>[
                        new FlatButton.icon(
                            onPressed: null,
                            icon: Icon(Icons.home),
                            label: Text(
                              "in-house",
                              style: TextStyle(fontSize: 12),
                            )),
                        new FlatButton.icon(
                            onPressed: null,
                            icon: Icon(Icons.pin_drop),
                            label: Text(
                              "on-premise",
                              style: TextStyle(fontSize: 12),
                            )),
                      ],
                      onPressed: (int index) async {
                        selectedLocation = [false, false];
                        selectedLocation[index] = true;
                        if (index == 1) {
                          LocationResult result = await showLocationPicker(
                              context,
                              "AIzaSyAxiXZvMz-x1SEPcvVQntd7Xkzhf80aC74");
                          print("result = $result");
                          newTask.lat = result.latLng.latitude;
                          newTask.lng = result.latLng.longitude;
                          newTask.locationName =
                              result.address == null || result.address == ""
                                  ? null
                                  : result.address;
                          locationChosen = true;
                          print(newTask.stringifyLocation());
                        } else {
                          locationChosen = false;
                        }
                        setState(() {});
                      },
                      isSelected: selectedLocation,
                      selectedBorderColor: kMainColor,
                      selectedColor: kMainColor,
                    ),
                    selectedLocation[0] == true
                        ? new Text(
                            "The Worker decides where to work",
                            softWrap: true,
                          )
                        : locationChosen
                            ? new Text(newTask.stringifyLocation())
                            : CircularProgressIndicator(),
                  ],
                ))
          ],
          type: StepperType.vertical,
          currentStep: this.currStep,
          onStepContinue: () {
            setState(() {
              if (currStep < 4 - 1) {
                currStep = currStep + 1;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (currStep > 0) {
                currStep = currStep - 1;
              } else {
                currStep = 0;
              }
            });
          },
          onStepTapped: (step) {
            setState(() {
              currStep = step;
            });
          },
        ),
        new RaisedButton(
          child: new Text(
            'Save details',
            style: new TextStyle(color: Colors.white),
          ),
          onPressed: _submitDetails,
          color: Colors.blue,
        ),
      ]),
    ));
  }
}
