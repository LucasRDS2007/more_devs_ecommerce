import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controllers/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/models/category_models.dart';
import 'package:more_devs_ecommerce/features/home/widgets/home_categorie_card.dart';
import 'package:more_devs_ecommerce/shared/mocks.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeCategorieSection extends StatelessWidget {
  const HomeCategorieSection({
    super.key,
    required this.controllerListCategories,
    required this.controllerViewState,
  });

  final List<Category> controllerListCategories;
  final CategoriesViewState controllerViewState;

  @override
  Widget build(BuildContext context) {
    if (controllerViewState == CategoriesViewState.error) {
      return const Text('Problema ao resgatar categorias');
    }
    return Skeletonizer(
      enabled: controllerViewState == CategoriesViewState.loading,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.18,

        child: ListView.builder(
          itemCount: _getCategoriesList().length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Category category = _getCategoriesList()[index];
            return HomeCategorieCard(category: category);
          },
        ),
      ),
    );
  }

  List<Category> _getCategoriesList() {
    return controllerViewState == CategoriesViewState.loading
        ? fakeLoadingCategories
        : controllerListCategories;
  }
}
