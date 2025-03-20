import 'package:flutter/material.dart';


class ProfileSetupTherapist extends StatefulWidget {
  @override
  _ProfileSetupTherapistState createState() => _ProfileSetupTherapistState();
}

class _ProfileSetupTherapistState extends State<ProfileSetupTherapist> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Blue Header
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 160,
                    decoration: const BoxDecoration(
                      color: Color(0xFF092635),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Profile Setup",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -40,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey.shade300,
                      child: Icon(Icons.person, size: 40, color: Colors.black54),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextField(label: "Full Name"),
                    buildTextField(label: "Email Address"),
                    buildTextField(label: "Phone Number"),
                    buildTextField(label: "Location"),
                    buildDropdown(label: "Gender", items: ["Male", "Female", "Other"]),
                    buildDateField(label: "DOB"),
                    buildTextField(label: "Qualification"),
                    buildTextField(label: "Certificates/License"),
                    buildTextField(label: "Areas of Expertise", maxLines: 3),
                    buildTextField(label: "Experience"),
                    buildTextField(label: "Availability"),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: const Color(0xFF9EC8B9),
                      ),
                      child: const Text("Save",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({required String label, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildDropdown({required String label, required List<String> items}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {},
      ),
    );
  }

  Widget buildDateField({required String label}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  selectedDate = pickedDate;
                });
              }
            },
          ),
        ),
        controller: TextEditingController(
          text: selectedDate == null ? "" : "${selectedDate!.toLocal()}".split(' ')[0],
        ),
      ),
    );
  }
}
