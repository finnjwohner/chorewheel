import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CreateFlatScr extends StatelessWidget {
  const CreateFlatScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        title: Text("Create Flat",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leading: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text("Back",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromRGBO(220, 220, 220, 1),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Flat Name"),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Flat 11/2",
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                const Text("Flat Picture"),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromRGBO(220, 220, 220, 1),
                      child: CircleAvatar(
                        radius: 29,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text("Upload A Picture",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                const Text("Voting Type"),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color.fromRGBO(220, 220, 220, 1),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: const [
                            Text("Majority"),
                            Text("Votes require most people to vote yes to pass", textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color.fromRGBO(220, 220, 220, 1),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: const [
                            Text("Unanimity"),
                            Text("Votes require everyone to vote yes to pass", textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                const Text("Assign First Chores"),
                const Text("When should Chorehweel begin to assign chores to every flatmate?"),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll<Color>(Colors.yellowAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    child: Text("Create Flat", style: Theme.of(context).textTheme.labelLarge,),
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