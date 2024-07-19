import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product_model.dart';

class CartNotifier extends StateNotifier<List<ProductModel>> {
  CartNotifier() : super([]);

  void addToCart(ProductModel product) {
    final existingIndex = state.indexWhere((item) => item.name == product.name);
    if (existingIndex >= 0) {
      state[existingIndex].quantity++;
      state = [...state];
    } else {
      product.quantity = 1;
      state = [...state, product];
    }
  }

  bool isInCart(ProductModel product) {
    return state.any((item) => item.name == product.name);
  }

  int getQuantity(ProductModel product) {
    final existingItem = state.firstWhere(
      (item) => item.name == product.name,
    );
    return existingItem.quantity;
  }

  void removeFromCart(ProductModel product) {
    state = state.where((item) => item.name != product.name).toList();
  }

  void decreaseQuantity(ProductModel product) {
    final existingIndex = state.indexWhere((item) => item.name == product.name);
    if (existingIndex >= 0) {
      if (state[existingIndex].quantity > 1) {
        state[existingIndex].quantity--;
      } else {
        state.removeAt(existingIndex);
      }
      state = [...state];
    }
  }

  double get totalAmount {
    return state.fold(
        0, (total, product) => total + (product.price * product.quantity));
  }

  void clearCart() {
    state = [];
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, List<ProductModel>>((ref) {
  return CartNotifier();
});
