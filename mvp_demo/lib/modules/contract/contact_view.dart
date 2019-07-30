import 'package:flutter/material.dart';

import '../../data/contact_data.dart';
import 'contact_contract.dart';
import 'contact_presenter.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ContactListView(),
    );
  }
}

class ContactListView extends StatefulWidget {
  @override
  _ContactListViewState createState() => _ContactListViewState();
}

class _ContactListViewState extends State<ContactListView>
    implements ContactListViewContract {
  ContactPresenterContract _presenter;
  List<Contact> _contacts;

  /// 是否在查找联系人数据
  bool _isSearching;

  _ContactListViewState() {
    _presenter = new ContactPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isSearching = true;
    // 异步加载联系人数据
    _presenter.loadContacts();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (_isSearching) {
      widget = Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      widget = ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                child: Center(
                  child: Text(_contacts[index].fullName.substring(0, 1)),
                ),
              ),
              title: Text(_contacts[index].fullName),
              subtitle: Text(_contacts[index].email),
            );
          });
    }
    return widget;
  }

  @override
  void onLoadContactComplete(List<Contact> items) {
    setState(() {
      _contacts = items;
      _isSearching = false;
    });
  }

  @override
  void onLoadContactError() {
    //TODO 加载失败后进行的操作
  }
}
