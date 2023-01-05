import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/utils/app_colors.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/controllers/database_controller.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/models/add_to_cart_model.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/widgets/main_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../widgets/cart_list_item.dart';

class CartPage extends StatefulWidget {
 const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return SafeArea(
      child: StreamBuilder<List<AddToCartModel>>(
          stream: database.myProductsCart(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // ignore: non_constant_identifier_names
              final CartItems = snapshot.data;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 1.h,
                    horizontal: 3.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox.shrink(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        "My Cart",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor,
                            ),
                      ),
                      if (CartItems == null || CartItems.isEmpty)
                        const Center(
                          child: Text('No Data Available'),
                        ),
                      if (CartItems != null || CartItems!.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(2.w),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: CartItems.length,
                          itemBuilder: (context, i) {
                            final cartitem = CartItems[i].price;
                            setState(() {
                              totalAmount += cartitem;
                            });
                            return CartListItem(
                              cartItem: CartItems[i],
                            );
                          },
                        ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount",
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.grey,
                                    ),
                          ),
                          Text(
                            "${totalAmount}\$",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      MainButton(
                        onPressed: () {},
                        text: "Checkout",
                        hasCirularBorder: true,
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
