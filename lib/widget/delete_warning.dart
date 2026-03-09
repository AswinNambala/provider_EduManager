import 'package:flutter/material.dart';

class DeleteWarning extends StatefulWidget {
  const DeleteWarning({super.key, required this.index});
  final int index;

  @override
  State<DeleteWarning> createState() => _DeleteWarningState();
}

class _DeleteWarningState extends State<DeleteWarning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black.withOpacity(0.4),
        child: Center(
          child: Container(
            height: 300,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Icon(
                    Icons.warning_amber,
                    color: Colors.red,
                    size: 60,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Delete Students ?',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Are you sure you want to delete this students? This action cannot be undone.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black38),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: const Size(150, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent[700],
                          fixedSize: const Size(150, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                        },
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
