import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:off_buy/products/event/get_products_event.dart';
import '../../../shared/model/base_event.dart';
import '../../../shared/model/states.dart';
import '../repo/products_repo.dart';

class ProductsBloc extends Bloc<OffBuyEvent, OffBuyState> {
  final _productsRepo = ProductsRepo();

  ProductsBloc(super.initialState) {
    on<GetProductsEvent>((event, emit) async {
      try {
        emit(OffBuyLoading());
        final mList = await _productsRepo.getProducts();
        emit(OffBuyLoaded(mList));
      } catch (ex) {
        emit(OffBuyError(ex.toString()));
      }
    });
  }
}
