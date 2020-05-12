import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> _userTransactions;
  final Function _removeItem;

  TransactionList(this._userTransactions, this._removeItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: _userTransactions.isEmpty
          ?
      Column(
        children: [
          Text(
            'No Transactions added yet!',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 400,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            )
          )
        ],
      )
          :
      ListView.builder(
        itemCount: _userTransactions.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text(
                      '\$${_userTransactions[index].amount}'
                    ),
                  ),
                ),
              ),
              title: Text(
                _userTransactions[index].title,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(_userTransactions[index].date)
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete
                ),
                color: Theme.of(context).errorColor,
                onPressed: () => _removeItem(_userTransactions[index].id),
              ),
            ),
          );
//          return Card(
//              child: Row(
//                children: [
//                  Container(
//                    margin: const EdgeInsets.symmetric(
//                        vertical: 10,
//                        horizontal: 15
//                    ),
//                    decoration: BoxDecoration(
//                        border: Border.all(
//                            color: Theme.of(context).primaryColor,
//                            width: 2
//                        )
//                    ),
//                    padding: EdgeInsets.all(10),
//                    child: Text(
//                      '\$${_userTransactions[index].amount.toStringAsFixed(2)}',
//                      style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          fontSize: 20,
//                          color: Theme.of(context).primaryColor
//                      ),
//                    ),
//                  ),
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Text(
//                        _userTransactions[index].title,
//                        style: Theme.of(context).textTheme.headline6,
//                      ),
//                      Text(
//                        DateFormat.yMMMd().format(_userTransactions[index].date),
//                        style: TextStyle(
//                            color: Colors.grey,
//                            fontSize: 13
//                        ),
//                      )
//                    ],
//                  )
//                ],
//              )
//          );
        },
      ),
    );
  }
}
