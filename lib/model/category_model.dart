import 'package:malltiverse/model/product_model.dart';

class CategoryModel {
  final List<ProductModel> allProducts;

  CategoryModel({required this.allProducts});

  List<ProductModel> get techGadgets {
    // Start with an empty list to hold the products
    List<ProductModel> techProducts = allProducts.where((product) {
      // Check if the product's name starts with "tech:"
      if (product.name.split(":")[0].toLowerCase() == "tech") {
        // Change the product's name by removing the category part
        product.setName = product.name.split(":")[1];
        return true; // Keep this product
      }
      return false; // Ignore this product
    }).toList();
    // Return the list of products
    return techProducts;
  }

  List<ProductModel> get menFashion {
    // Start with an empty list to hold the products
    List<ProductModel> menFashion = allProducts.where((product) {
      // Check if the product's name starts with "tech:"
      if (product.name.split(":")[0].toLowerCase() == "men") {
        // Change the product's name by removing the category part
        product.setName = product.name.split(":")[1];
        return true; // Keep this product
      }
      return false; // Ignore this product
    }).toList();
    // Return the list of products
    return menFashion;
  }

  List<ProductModel> get womenFashion {
    // Start with an empty list to hold the products
    List<ProductModel> womenFashion = allProducts.where((product) {
      // Check if the product's name starts with "women:"
      if (product.name.split(":")[0].toLowerCase() == "women") {
        // Change the product's name by removing the category part
        product.setName = product.name.split(":")[1];
        return true; // Keep this product
      }
      return false; // Ignore this product
    }).toList();
    // Return the list of products
    return womenFashion;
  }

  List<ProductModel> get inCart {
    // Start with an empty list to hold the products
    List<ProductModel> inCart = allProducts.where((product) {
      return product.quantity > 1;
    }).toList();
    // Return the list of products in the cart
    return inCart;
  }
}
