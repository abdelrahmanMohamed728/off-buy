import '../../../shared/supabase/api_provider.dart';

class ProductsRepo {
  final _provider = ApiProvider();

  Future<dynamic> getProducts() {
    return _provider.getProducts();
  }
}
