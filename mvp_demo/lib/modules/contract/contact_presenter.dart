import '../../data/contact_data.dart';
import '../../injection/injection.dart';
import 'contact_contract.dart';

class ContactPresenter implements ContactPresenterContract {
  ContactListViewContract _view;
  ContactRepository _repository;

  ContactPresenter(this._view) : _repository = new Injector().contactRepository;

  @override
  void loadContacts() {
    assert(_view != null);

    _repository
        .fetch()
        .then((items) => _view.onLoadContactComplete(items))
        .catchError((onError) {
      print(onError);
      _view.onLoadContactError();
    });
  }
}
