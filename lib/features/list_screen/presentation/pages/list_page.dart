import 'package:codenesslab/features/list_screen/presentation/pages/widgets/posts_list.dart';
import 'package:codenesslab/features/list_screen/presentation/pages/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/error/components/error_widget.dart';
import '../../../../core/error/components/loading_widget.dart';
import '../../../../core/utils/responsive.dart';
import '../controllers/list_controller.dart';

class ListPage extends StatelessWidget {
  final ListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Posts List',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ResponsiveScaledBox(
        width: Responsive.getWidth(context),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.getPadding(context),
          ),
          child: Column(
            children: [
              SizedBox(height: 16),
              CustomSearchBar(controller: controller),
              SizedBox(height: 16),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return LoadingWidget();
                  } else if (controller.hasError.value) {
                    return CustomErrorWidget(
                        message: controller.errorMessage.value);
                  } else {
                    return ItemListView(controller: controller);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
