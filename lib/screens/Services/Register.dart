import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:test_app_7th/screens/HomePage.dart';
import 'package:test_app_7th/screens/ImagePicker/ImagePicker.dart';

class RegisterFrm extends StatefulWidget {
  const RegisterFrm({Key? key}) : super(key: key);

  @override
  State<RegisterFrm> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterFrm> {
  Map<String, dynamic> userData = {};
  final _formKey = GlobalKey<FormState>();

  // Define lists for state, district, and taluka options
  List<String> states = ['Maharashtra', 'Karnataka', 'Andhra Pradesh'];
  List<String> districts = ['Aurangabad', 'Nanded', 'Beed'];
  List<String> talukas = ['Degloor', 'Mukhed', 'Kandhar '];

  String? selectedState;
  String? selectedDistrict;
  String? selectedTaluka;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                    child: Text(
                      'Add Profile photo',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                Center(
                  child: Container(
                    height: 180,
                    child: const MyPage(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter first name'),
                      MinLengthValidator(3, errorText: 'Minimum 3 characters'),
                    ]),
                    decoration: const InputDecoration(
                      hintText: 'Enter first Name',
                      labelText: 'First Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                    ),
                    onChanged: (value) {
                      userData['firstName'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter last name'),
                      MinLengthValidator(3, errorText: 'Minimum 3 characters'),
                    ]),
                    decoration: const InputDecoration(
                      hintText: 'Enter last Name',
                      labelText: 'Last Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (value) {
                      userData['lastName'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter email address'),
                      EmailValidator(errorText: 'Please enter a valid email'),
                    ]),
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.lightBlue,
                      ),
                    ),
                    onChanged: (value) {
                      userData['email'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter mobile number'),
                      PatternValidator(
                        r'(^[0-9]{10}$)',
                        errorText: 'Enter a valid mobile number',
                      ),
                    ]),
                    decoration: const InputDecoration(
                      hintText: 'Mobile',
                      labelText: 'Mobile',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (value) {
                      userData['mobile'] = value;
                    },
                  ),
                ),
                // Address Fields
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedState,
                    onChanged: (value) {
                      setState(() {
                        selectedState = value;
                      });
                    },
                    items: states.map((state) {
                      return DropdownMenuItem<String>(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Select a state';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Select State',
                      labelText: 'State',
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedDistrict,
                    onChanged: (value) {
                      setState(() {
                        selectedDistrict = value;
                      });
                    },
                    items: districts.map((district) {
                      return DropdownMenuItem<String>(
                        value: district,
                        child: Text(district),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Select a district';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Select District',
                      labelText: 'District',
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedTaluka,
                    onChanged: (value) {
                      setState(() {
                        selectedTaluka = value;
                      });
                    },
                    items: talukas.map((taluka) {
                      return DropdownMenuItem<String>(
                        value: taluka,
                        child: Text(taluka),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Select a taluka';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Select Taluka',
                      labelText: 'Taluka',
                      prefixIcon: Icon(
                        Icons.location_pin,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator:
                    RequiredValidator(errorText: 'Enter your village'),
                    decoration: const InputDecoration(
                      hintText: 'Village',
                      labelText: 'Village',
                      prefixIcon: Icon(
                        Icons.location_city_outlined,
                        color: Colors.blue,
                      ),
                    ),
                    onChanged: (value) {
                      userData['village'] = value;
                    },
                  ),
                ),
                // Gender Section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Gender:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Radio(
                        value: 'Male',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                            userData['gender'] = value;
                          });
                        },
                      ),
                      Text('Male'),
                      SizedBox(width: 20),
                      Radio(
                        value: 'Female',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                            userData['gender'] = value;
                          });
                        },
                      ),
                      Text('Female'),
                      SizedBox(width: 20),
                      Radio(
                        value: 'Other',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                            userData['gender'] = value;
                          });
                        },
                      ),
                      Text('Other'),
                    ],
                  ),
                ),
                // ... (other form fields)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      child: ElevatedButton(
                        child: Text(
                          'Register ',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        onPressed: () {
                          // Handle registration logic here
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomePage()),
                            );
                          }
                        },
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}