// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:api_management/components/toolbar.dart';
import 'package:api_management/helper/Utils.dart';
import 'package:api_management/helper/logger.dart';
import 'package:api_management/provider/transaction_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../model/TransactionResponse.dart';

class CardTransactionActivity extends StatefulWidget {
  const CardTransactionActivity({super.key});

  @override
  State<CardTransactionActivity> createState() =>
      _CardTransactionActivityState();
}

class _CardTransactionActivityState extends State<CardTransactionActivity> {
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<TransactionProvider>(
      create: (_) => TransactionProvider(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                MyToolbar(title: "Card Transaction"),
                Consumer<TransactionProvider>(
                  builder: (BuildContext context, TransactionProvider value,
                      Widget? child) {
                    CustomLogger.debug(value.isLoading);
                    if (value.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (value.response == null ||
                        value.response?.cardTransactions?.isEmpty == true) {
                      return Center(
                          child: Text("No data available",
                              style: TextStyle(color: Colors.white)));
                    }

                    return Expanded(
                        child: value.isLoading
                            ? CircularProgressIndicator()
                            : ListView.builder(
                                itemCount:
                                    value.response?.cardTransactions?.length ??
                                        0,
                                itemBuilder: (context, index) {
                                  CardTransactions data =
                                      value.response!.cardTransactions![index];
                                  return _TransactionTile(data);
                                }));
                  },
                )
              ],
            )),
      ),
    );
  }

  Widget _TransactionTile(CardTransactions data) {
    double ratio = data.nftPurchases?.nft?.layout == "P" ? 2 / 3 : 3 / 2;

    CustomLogger.debug("${data.nftPurchases?.nft?.layout} ratio is $ratio");

    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
          color: Color(0xFF141415),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(
            height: 100,
            child: AspectRatio(
                aspectRatio: ratio,
                child: Image.network(
                    fit: BoxFit.cover, data.nftPurchases?.nft?.fileUrl ?? '')),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Card Sold",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.transactionWith?.name ?? '',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "01 Aug, 08:49am",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '\$${data.price.toString()}',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
