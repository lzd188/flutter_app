import '../data/contact_data.dart';
import '../data/contact_data_impl.dart';
import '../data/contact_data_mock.dart';

enum Flavor {
  // 生产环境
  PRO,
  // 测试环境
  MOCK,
}

/// 简单的依赖注入
class Injector {
  static final Injector _injector = Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _injector;
  }

  // 内部初始化
  Injector._internal();

  ContactRepository get contactRepository {
    switch (_flavor) {
      case Flavor.PRO:
        return new RandomUserRepository();
      case Flavor.MOCK:
        return new ContactMockRepository();
      default:
        return null;
    }
  }
}
