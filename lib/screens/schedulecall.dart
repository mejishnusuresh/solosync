import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleCallPage extends StatefulWidget {
  const ScheduleCallPage({Key? key}) : super(key: key);

  @override
  State<ScheduleCallPage> createState() => _ScheduleCallPageState();
}

class _ScheduleCallPageState extends State<ScheduleCallPage> {
  String? selectedCustomer;
  String? selectedCounter;
  DateTime? selectedDate;

  List<String> customers = [
    'Customer 1',
    'Customer 2',
    'Customer 3',
    'Customer 4',
    'Customer 5',
  ];
  List<String> counters = [
    'h min before',
    '10 mints before',
    '15 mints before',
    '30 mints before',
    '1 hr before'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Schedule New Call",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [

          Container(
            color: Theme.of(context).primaryColor,
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height - 100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Call To"),
                    const SizedBox(height: 20,),
                    Card(
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.person),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: selectedCustomer,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedCustomer = newValue ?? 'Customer 1';
                                      });
                                    },
                                    underline: const SizedBox(),
                                    items: customers.map((String customer) {
                                      return DropdownMenuItem<String>(
                                        value: customer,
                                        child: Text(customer),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),
                    const Row(
                      children: [

                        Text("Date"),
                        SizedBox(width: 150,),
                        Text("Time"),

                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Card(
                          child: SizedBox(
                            width: 130,
                            height: 50,
                            child: GestureDetector(
                              onTap: () async {
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030),
                                );
                                if (picked != null && picked != selectedDate) {
                                  setState(() {
                                    selectedDate = picked;
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      selectedDate != null
                                          ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                                          : 'Select Date',
                                    ),
                                    const Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 20,),
                        Card(
                          child: SizedBox(
                            width: 130,
                            height: 50,
                            child: GestureDetector(
                              onTap: () async {
                                final TimeOfDay? picked = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (picked != null) {
                                  setState(() {
                                    // Combine selected date and time
                                    selectedDate = DateTime(
                                      selectedDate!.year,
                                      selectedDate!.month,
                                      selectedDate!.day,
                                      picked.hour,
                                      picked.minute,
                                    );
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      selectedDate != null
                                          ? DateFormat('h:mm a').format(selectedDate!)
                                          : 'Select Time',
                                    ),
                                    const Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),



                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Text("Subject"),
                    const SizedBox(height: 20,),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),
                    const Text("Agenda"),
                    const SizedBox(height: 20,),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Card(
                      child: SizedBox(
                        height: 35,
                        width: 200,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.0,),
                            child: Container(
                              child: Row(
                                children: [
                                  Icon(Icons.access_alarm,color: Theme.of(context).primaryColor,),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: selectedCounter,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedCounter = newValue ?? 'h min before';
                                        });
                                      },
                                      underline: const SizedBox(),
                                      items: counters.map((String counter) {
                                        return DropdownMenuItem<String>(
                                          value: counter,
                                          child: Text(counter),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        child: const Text('Schedule Call',),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>( Theme.of(context).primaryColor,),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          minimumSize: MaterialStateProperty.all<Size>(const Size(250, 45)),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
