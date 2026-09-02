import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controlles/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/models/carousel_models.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppCarousel extends StatelessWidget {
  const AppCarousel({
    super.key,
    required this.controllerChangeIndex,
    required this.controllerIndex,
    required this.controllerCarouselItens,
    required this.controllerCarouselViewState,
  });

  final Function(int) controllerChangeIndex;
  final int controllerIndex;
  final List<CarouselItem> controllerCarouselItens;
  final CarouselViewState controllerCarouselViewState;

  @override
  Widget build(BuildContext context) {
    if (controllerCarouselViewState == CarouselViewState.error) {
      return Text('Problema ao resgatar produtos');
    }
    return Skeletonizer(
      enabled: controllerCarouselViewState == CarouselViewState.loading,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 195.0,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  controllerChangeIndex(index);
                },
              ),
              items: controllerCarouselItens.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                        color: AppColors.grey50,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                item.title,
                                style: AppTextStyle.carouselLabel,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(item.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            AnimatedSmoothIndicator(
              activeIndex: controllerIndex,
              count: controllerCarouselItens.length,
              effect: const WormEffect(
                dotColor: AppColors.grey100,
                activeDotColor: AppColors.black,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
