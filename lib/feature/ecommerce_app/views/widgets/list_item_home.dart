import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/utils/app_colors.dart';
import 'package:flutter_ecommerce/core/utils/routes/routes_name.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/models/product_model.dart';
import 'package:sizer/sizer.dart';

class ListItemHome extends StatelessWidget {
  final ProductModel productModel;

  const ListItemHome({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(RoutesName.productDetailsRoute,arguments: productModel),
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.sp),
                  child: Container(
                    color: Colors.cyanAccent,
                    child: Image.network(
                      productModel.imgUrl,
                      fit: BoxFit.contain,
                      height: 24.h,
                      width: 40.w,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.w),
                  child: SizedBox(
                    width: 10.w,
                    height: 3.h,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        color: AppColors.redColor,
                      ),
                      child: Center(
                        child: Text(
                          '${productModel.discountValue}%',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: AppColors.wColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -2.h,
                  right: 0,
                  child: FloatingActionButton(
                    onPressed: () {},
                    mini: true,
                    backgroundColor: AppColors.wColor,
                    child: const Icon(
                      Icons.favorite_border,
                      color: AppColors.greyColor,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 2.h),
            Text(
              productModel.category,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: AppColors.greyColor,
                  ),
            ),
            SizedBox(height: 0.5.h),
            Text(
              productModel.title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 0.5.h),
            Text(
              '${productModel.price}\$',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: AppColors.greyColor),
            )
          ],
        ),
      ),
    );
  }
}
