import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/utils/app_colors.dart';
import 'package:flutter_ecommerce/core/utils/constants.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/controllers/database_controller.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/models/add_to_cart_model.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/models/product_model.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/widgets/drop_down_menu.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/widgets/main_dialog.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, required this.productModel});
  ProductModel productModel;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavorite = false;
  late String dropdownValue;

  Future<void> _addToCart(Database database) async {
    try {
      final addToCartProduct = AddToCartModel(
        productId: widget.productModel.id,
        id: documentIdFromLocalData(),
        title: widget.productModel.title,
        price: widget.productModel.price,
        imUrl: widget.productModel.imgUrl,
        size: dropdownValue,
      );
      await database.addToCart(addToCartProduct);
    } catch (e) {
      return MainDialog(
        context: context,
        title: 'Error',
        content: "Couldn't adding to the cart, please try again",
      ).showAlertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.productModel.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.productModel.imgUrl,
              width: double.infinity,
              height: 60.h,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 6.5.h,
                        width: 30.w,
                        child: DropdownButtonComponant(
                          hintText: 'Size',
                          items: const ['S', 'M', 'L', 'XL', 'XXL'],
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                        ),
                      ),
                      // ignore: todo
                      // TODO : Create one component for the favorate button
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          height: 6.h,
                          width: 20.w,
                          child: InkWell(
                            focusColor: AppColors.noColor,
                            hoverColor: AppColors.noColor,
                            splashColor: AppColors.noColor,
                            highlightColor: AppColors.noColor,
                            onTap: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.wColor,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productModel.title,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        "\$${widget.productModel.price}",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    widget.productModel.category,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.grey.withOpacity(0.9),
                        ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'This is a dummy description for this product! i think we will add it in the future! i need to add more lines, so I add thess words just to have more than two lines!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 2.h),
                  MainButton(
                    hasCirularBorder: true,
                    onPressed: ()  =>  _addToCart(database),
                    text: 'Add to Card',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
