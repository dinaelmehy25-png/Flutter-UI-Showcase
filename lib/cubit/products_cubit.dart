import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:exercise_app/models/product_model.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

Future<void> getProducts() async {
    emit(ProductsLoadingState());

    try {
      final response = await Dio().get(
        'https://ecommerce-5rfssu72u-ahmed-allams-projects-14fb3aa3.vercel.app/products',
      );

      if (response.statusCode == 200) {
        final List productsData = response.data['data']['products'];
        
        List<ProductModel> productsList = productsData.map((json) => ProductModel.fromJson(json)).toList();

        emit(ProductsSuccessState(products: productsList));
      } else {
        emit(ProductsErrorState(error: 'Failed to load products'));
      }

    } catch (e) {
      emit(ProductsErrorState(error: e.toString()));
    }
  }













}
