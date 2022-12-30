import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/utils/app_colors.dart';
import 'package:flutter_ecommerce/core/utils/routes/routes_name.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/controllers/database_controller.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/models/product_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ListItemHome extends StatefulWidget {
  final ProductModel productModel;
  bool isFavorite;
  ListItemHome({
    Key? key,
    required this.productModel,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  State<ListItemHome> createState() => _ListItemHomeState();
}

class _ListItemHomeState extends State<ListItemHome> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true).pushNamed(
        RoutesName.productDetailsRoute,
        // TODO: we need to refactor to create models for the arguments
        arguments: {
          'product': widget.productModel,
          'database': database,
        },
      ),
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
                    color: AppColors.noColor,
                    // color: Colors.cyanAccent,
                    child: Image.network(
                      widget.productModel.imgUrl,
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
                          '${widget.productModel.discountValue}%',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: AppColors.wColor),
                        ),
                      ),
                    ),
                  ),
                ),
                // TODO : Create one component for the favorate button
                Positioned(
                  bottom: -2.h,
                  right: 0,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        widget.isFavorite = !widget.isFavorite;
                      });
                    },
                    mini: true,
                    backgroundColor: AppColors.wColor,
                    child: Icon(
                      widget.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: AppColors.greyColor,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                RatingBarIndicator(
                  itemSize: 20.sp,
                  rating: widget.productModel.rate?.toDouble() ?? 0.0,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  direction: Axis.horizontal,
                  itemPadding: EdgeInsets.only(right: 1.w),
                ),
                SizedBox(width: 2.w),
                Text(
                  '(100)',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
            Text(
              widget.productModel.category,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: AppColors.greyColor,
                  ),
            ),
            SizedBox(height: 0.5.h),
            Text(
              widget.productModel.title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 0.5.h),
            Text(
              '${widget.productModel.price}\$',
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
