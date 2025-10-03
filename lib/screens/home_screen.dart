import "package:flutter/material.dart";
import "package:gap/gap.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      
        //direction: Axis.vertical,
        //mainAxisAlignment: MainAxisAlignment.sp,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Item with 100px height containing a Column with title and row
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.blueGrey[900],
                child: SizedBox(
                  height: 130,
            
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Pachalik Ouedlaou',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20), // Spacer
            
                      SizedBox(
                        height: 50, // Explicit height to constrain the Row
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.orange[300],
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Colors.black,
                                ),
                              ),
                              child: Text("New Document"),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.orange[300],
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Colors.black,
                                ),
                              ),
                              child: Text("File"),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.orange[300],
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Colors.black,
                                ),
                              ),
                              child: Text("Edit"),
                            ),
            
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.orange[300],
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Colors.black,
                                ),
                              ),
                              child: Text("Print"),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.orange[300],
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Colors.black,
                                ),
                              ),
                              child: Text("Save to cloud"),
                            ),
            
                            Spacer(),
                          ],
                        ),
                      ),
            
                      // Add more widgets as needed
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
           
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
               //direction: Axis.horizontal,
               
               //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.green,
                      child: Text("data"),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: Colors.yellow,
                      child: Text("data gdf dfdf gg dfg sdfg sdgf dshsdhf gh "),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // ... existing code ...
    );
  }
}
