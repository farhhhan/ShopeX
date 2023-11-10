import 'package:shopex/address/address.dart';
import 'package:shopex/address/addresshelper.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/address/addadresscreen.dart';
import 'package:shopex/userScreen/adressfillscreen.dart';
import 'package:shopex/widgets/customeicons.dart';
import 'package:flutter/material.dart';

class addresscreen extends StatefulWidget {
  addresscreen(
      {required this.name,
      required this.colorss,
      required this.images,
      required this.price,
      required this.count,
      super.key});
  final name;
  final images;
  final colorss;
  final price;
  final count;

  @override
  State<addresscreen> createState() => _addresscreenState();
}

class _addresscreenState extends State<addresscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adhlp.getalladress();
  }

  addressHelper adhlp = addressHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customeText(
          texts: 'Address',
          textsize: 26,
          textcolor: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            elevation: 10,
            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Center(
                      child: customeText(
                        texts: '1',
                        textcolor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 100,
                    color: Colors.black54,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Center(
                      child: customeText(
                        texts: '2',
                        textcolor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 100,
                    color: Colors.black54,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Center(
                      child: customeText(
                        texts: '3',
                        textcolor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.blue,
            child: Card(
              elevation: 15,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => addadress()));
                },
                leading: customeicon(Iconss: Icons.add),
                title: customeText(texts: 'Add Address'),
              ),
            ),
          ),
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: addresslist,
            builder: (context, List<Address> adrslist, Widget? child) {
              return ListView.builder(
                  itemCount: adrslist.length,
                  itemBuilder: (context, index) {
                    final addres = adrslist[index];
                    return Card(
                      elevation: 10,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => addfillscreen(
                                  imagePath: widget.images,
                                  name: widget.name,
                                  price: widget.price,
                                  cate: widget.colorss,
                                  count: widget.count.toString(),
                                  address: addres.address,
                                  city: addres.city,
                                  pin: addres.pincode,
                                  user: addres.usrname,
                                  numb: addres.number,
                                ),
                              ));
                        },
                        trailing: IconButton(
                            onPressed: () {
                              adhlp.delete(addres.id);
                              print(addres.id);
                            },
                            icon: Icon(Icons.delete)),
                        title: customeText(
                          texts: addres.name,
                          textweight: FontWeight.w600,
                        ),
                      ),
                    );
                  });
            },
          )),
        ],
      ),
    );
  }
}
