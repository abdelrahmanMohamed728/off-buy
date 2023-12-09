import 'package:off_buy/shared/supabase/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiProvider {
  final _client = Supabase.instance.client;

  Future<List<dynamic>> getProducts() async {
    return await _client.from(productsTable).select();
  }
}
