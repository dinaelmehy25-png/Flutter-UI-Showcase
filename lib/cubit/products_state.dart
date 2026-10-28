part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoadingState extends ProductsState {}

final class ProductsSuccessState extends ProductsState {
  final List<ProductModel> products;
  ProductsSuccessState({required this.products});
}

final class ProductsErrorState extends ProductsState {
  final String error;
  ProductsErrorState({required this.error});
}