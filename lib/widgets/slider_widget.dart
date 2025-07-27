import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/models/pagination.dart';
import 'package:grocery_app/models/slider.dart';
import 'package:grocery_app/providers/providers.dart';

class HomeSliderWidget extends ConsumerWidget {
  const HomeSliderWidget({super.key});

  Widget _sliderList(WidgetRef ref) {
    final sliders =
        ref.watch(slidersProvider(PaginationModel(page: 1, pageSize: 10)));
    return sliders.when(
        data: (list) {
          return imageCarousal(list!);
        },
        error: (_, __) => const Center(
              child: Text('error'),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget imageCarousal(
    List<SliderModel> sliderList,
  ) {
    return CarouselSlider(
        items: sliderList.map((model) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(model.fullImagePath),
                  fit: BoxFit.contain),
            ),
          );
        }).toList(),
        options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.decelerate,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: _sliderList(ref),
    );
  }
}
