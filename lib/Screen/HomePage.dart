import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_using_firebase/Firebase_Services/PostServices.dart';
import 'package:todo_using_firebase/Widgets/TextWidget.dart';
import 'package:todo_using_firebase/view_model/HomeScreenViewModel.dart';
import 'package:todo_using_firebase/view_model/PostScreenViewModel.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final toDo = FirebaseFirestore.instance.collection('ToDo').snapshots();
  CollectionReference reference = FirebaseFirestore.instance.collection('ToDo');

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        StreamBuilder<QuerySnapshot>(
          stream: toDo,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return MyText(txt: 'Some Error');
            }
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Dismissible(
                      key: Key(provider.salectedItem[index]),
                      onDismissed: ((direction) {
                        provider.removeitem(index);
                        reference
                            .doc(
                              snapshot.data!.docs[index]['id'].toString(),
                            )
                            .delete();
                      }),
                      child: ListTile(
                        title: MyText(
                          txt: snapshot.data!.docs[index]['Task '].toString(),
                          fontsize: 20,
                        ),
                        // ignore: prefer_const_constructors
                        trailing: InkWell(
                          onTap: () {
                            if (provider.salectedItem.contains(index)) {
                              provider.removeitem(index);
                              reference
                                  .doc(
                                    snapshot.data!.docs[index]['id'].toString(),
                                  )
                                  .delete();
                            } else {
                              provider.setItem(index);
                              reference
                                  .doc(
                                    snapshot.data!.docs[index]['id'].toString(),
                                  )
                                  .delete();
                            }
                          },
                          child: Consumer<HomeScreenModel>(
                            builder: (context, model, child) {
                              return Icon(model.salectedItem.contains(index)
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank);
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        PostViewModel(),
      ]),
    );
  }
}
