import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/utils/app_colors.dart';
import 'package:flutter_ecommerce/core/utils/app_strings/app_strings.dart';
import 'package:flutter_ecommerce/core/utils/app_strings/images_path.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/controllers/database_controller.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/views/widgets/list_item_home.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../models/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // TODO: Temp code till refactor to a separate class with a separate  context
  Widget _buildHeaderOfList(
    BuildContext context, {
    required String title,
    VoidCallback? onPressed,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.blackColor),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(AppStrings.seeAll,
                  style: Theme.of(context).textTheme.headline5),
            ),
          ],
        ),
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: AppColors.greyColor),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Database database = Provider.of<Database>(context);
    return ListView(
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.network(
              AppImagesPathNetwork.topBannerHomePage,
              height: 30.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Opacity(
              opacity: 0.3,
              child: Container(
                color: AppColors.blackColor,
                height: 30.h,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
              child: Text(
                'Street Clothes',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: AppColors.wColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              _buildHeaderOfList(
                context,
                title: 'Sale',
                description: 'Super Summer Sale!!',
              ),
              SizedBox(height: 3.h),
              SizedBox(
                height: 35.h,
                child: StreamBuilder<List<ProductModel>>(
                  stream: database.salesProductsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final product = snapshot.data;
                      if (product == null || product.isEmpty) {
                        return const Center(
                          child: Text('No Data Available!'),
                        );
                      }
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: product.length,
                          itemBuilder: (_, i) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: ListItemHome(productModel: product[i]),
                              ));}
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              _buildHeaderOfList(
                context,
                title: 'New',
                description: 'Super New Products!!',
              ),
              SizedBox(height: 3.h),
              SizedBox(
                height: 35.h,
                child: StreamBuilder(
                  stream: database.newProductsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final product = snapshot.data;

                      if (product == null || product.isEmpty) {
                        return const Center(
                          child: Text('No Data Available!'),
                        );
                      }
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: product.length,
                          itemBuilder: (_, i) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: ListItemHome(productModel: product[i]),
                              ));
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
