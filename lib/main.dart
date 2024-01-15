import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  List<Map<String, dynamic>> productList = [
    {
      "product_name": 'Pullover',
      "price": 51,
      "color": 'Black',
      "size": 'L',
      "image_url": 'https://img.freepik.com/free-psd/psd-white-hoodie-mockup_1409-3751.jpg?w=740&t=st=1705311444~exp=1705312044~hmac=bdb85c5ce6873fd0e06ee1ca31ede151223fd607f5d8ed019a81450ce0c15dde?',
      "totalitem": 1,
      "counter": 1
    },
    {
      "product_name": 'T-Shirt',
      "price": 30,
      "color": 'Gray',
      "size": 'L',
      "image_url": 'https://img.freepik.com/free-psd/mens-tri-blend-crew-tee-mockup_126278-130.jpg?w=740&t=st=1705311554~exp=1705312154~hmac=3f0a754495ab05f5407f7bf77f8a73f5adcf2bea7051c25d81fc5ef0a8a6736c?',
      "totalitem": 1,
      "counter": 1

    },
    {
      "product_name": 'Sport Dress',
      "price": 43,
      "color": 'Black',
      "size": 'M',
      "image_url": 'https://img.freepik.com/premium-vector/sport-wear-mens-womens_18591-19612.jpg?w=740?',
      "totalitem": 1,
      "counter": 1
    },


  ];

  List<int> price = [];

  int get totalAmount {
    return productList.fold<int>(
        0, (total, product) => total + product['price'] as int);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.search)),
        ],
        backgroundColor: Colors.transparent,
      ),


      backgroundColor: const Color(0xF7F5F3F3),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Bag",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),

            const SizedBox(height: 15,),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: productList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          elevation: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.network(
                                      productList[index]['image_url']!,
                                      fit: BoxFit.cover,
                                      height: 90, width: 120,
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          productList[index]['product_name'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            const Text("Color:",
                                                style: TextStyle(fontSize: 7)),
                                            Text(
                                              productList[index]['color'],
                                              style: const TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(width: 5,),

                                            const Text("Size:",
                                                style: TextStyle(fontSize: 7)),
                                            Text(
                                              productList[index]['size'],
                                              style: const TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(

                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (productList[index]['counter'] >
                                                    1) {
                                                  productList[index]['counter'] -=
                                                  1;
                                                  productList[index]['price'] =
                                                      productList[index]['price'] -
                                                          price[index];
                                                  setState(() {});
                                                }
                                              },
                                              child: Icon(Icons.remove,),

                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(horizontal: 8.0),
                                              child: Text(
                                                  productList[index]['counter']
                                                      .toString()),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                price.add(productList[index]['price']);
                                                setState(() {
                                                });
                                                productList[index]['counter'] +=
                                                1;
                                                productList[index]['price'] =
                                                    price[index] *
                                                        productList[index]['counter'];
                                                if (productList[index]['counter'] ==
                                                    5) {
                                                  showDialog(context: context,
                                                    builder: (context) {
                                                      return  AlertDialog(
                                                        backgroundColor: Colors.white,
                                                        surfaceTintColor: Colors.white,
                                                        title: const Center(
                                                            child: Text(
                                                                'Congratulations',
                                                                style: TextStyle(
                                                                    fontSize: 15,fontWeight: FontWeight.bold))),
                                                        content: Text('You have added 5 ${productList[index]['product_name']} on your bag!'),
                                                        actions: [Center(
                                                          child: SizedBox(
                                                            width: double.infinity,
                                                            child: ElevatedButton(
                                                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                                onPressed: () {
                                                                  Navigator.pop(context);
                                                                }, child: const Text("OKEY",style: TextStyle(color: Colors.white),)),
                                                          ),
                                                        )],
                                                      );
                                                    },);
                                                }
                                                setState(() {});
                                              },
                                              child: Icon(Icons.add, weight: 50),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    const Icon(Icons.more_vert_sharp),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text("\$${productList[index]['price']} "),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total amount:'),
                  Text(
                    "\$$totalAmount",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {},
                child: const Text(
                  "Checkout",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ]),
        ),
      ),

    );
  }
}

