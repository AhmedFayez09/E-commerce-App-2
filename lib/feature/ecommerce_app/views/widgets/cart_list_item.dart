import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/models/add_to_cart_model.dart';
import 'package:sizer/sizer.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.cartItem});
  final AddToCartModel cartItem;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.sp),
                    bottomRight: Radius.circular(10.sp),
                  ),
                  child: Image.network(
                    cartItem.imUrl,
                    height: 12.h,
                    width: 40.w,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cartItem.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Color : ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                                TextSpan(
                                    text: cartItem.color,
                                    style: Theme.of(context).textTheme.caption)
                              ],
                            ),
                          ),
                          SizedBox(width: 1.w),
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Size : ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                                TextSpan(
                                    text: cartItem.size,
                                    style: Theme.of(context).textTheme.caption)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(Icons.more_vert),
                      Text(
                        "${cartItem.price}\$",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
