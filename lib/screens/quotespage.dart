import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            color: Theme.of(context).primaryColor,
          ),
          Positioned(
            top: 40,
            left: 3,
            child: Container(
              width: 50,
              height: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: (MediaQuery.of(context).size.width - 100) / 2,
            child: Container(
              width: 100,
              height: 50,
              child:const Text("Quotes",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ),
          Positioned(
            top: 40,
            right: 3,
            child: Container(
              width: 50,
              height: 50,
              child: IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.filter_alt_sharp, color: Colors.white,),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Colors.white,
                ),
              child: Column(
                children: [
                  const SizedBox(height: 30,),

                  Container(
                    margin: const EdgeInsets.only(left: 16,right: 16,top: 16,),
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    color: Colors.grey,
                                    child: const Icon(Icons.attach_money_rounded, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Quote Name',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'QT001',
                                      style: TextStyle(fontSize: 16,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Text(
                              'Account Name',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' Draft',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        ' Quote Stage',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalDivider(),
                                Container(
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        ' 18/05/2024',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        ' Valid Until',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalDivider(),
                                Container(
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$95.00',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        ' Grand Total',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16,right: 16,top: 16),
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    color: Colors.grey,
                                    child: const Icon(Icons.attach_money_rounded, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Quote Name',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'QT001',
                                      style: TextStyle(fontSize: 16,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Text(
                              'Account Name',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' Draft',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        ' Quote Stage',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalDivider(),
                                Container(
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        ' 18/05/2024',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        ' Valid Until',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalDivider(),
                                Container(
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$95.00',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        ' Grand Total',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ),


                  ),

                ],
              ),

            ),
          ),
          Positioned(
            top: 120,
            left: 30,
            right: 30,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        hintText: "Search Quotes",
                      ),
                      onChanged: (value) {

                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle search button press
                    },
                    icon: const Icon(Icons.search_rounded),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );

  }
}