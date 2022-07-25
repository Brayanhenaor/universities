import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universities/controllers/home_controller.dart';
import 'package:universities/models/college.dart';
import 'package:universities/models/colleges_response.dart';
import 'package:universities/theme/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _onTap(int index) {
    Get.find<HomeController>().changeIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      'All colleges',
      'Public',
      'Private',
      'Liberal',
      'Liberal',
      'Liberal',
    ];

    final List<College> colleges = [
      const College(
        name: 'Harvard University',
        image:
            'https://www.isdi.education/uploads/media/16-9-large/06/1726-o-HARVARD-UNIVERSITY-BUILDING-facebook-1024x512.jpg?v=1-0',
        description:
            'Aliqua amet Lorem duis amet exercitation ea labore veniam consequat irure magna. Aliquip aliquip quis nostrud mollit sunt do. Esse in duis nulla irure fugiat non enim non tempor cupidatat culpa ut quis. ',
        ubication: 'Gainesville, FL',
      )
    ];

    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: const _BottomNavBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  SearchInput(
                    searchHandler: controller.searchCollegeByName,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Obx(
                      () => Categories(
                        onTap: _onTap,
                        tabs: tabs,
                        selected: controller.selectedIndex.value,
                      ),
                    ),
                  ),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.colleges.length,
                      itemBuilder: (context, index) => _CollegeCard(
                        college: controller.colleges[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 0,
      selectedItemColor: const Color(0xff2B924E),
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 30,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.location_on_outlined,
            size: 30,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.grid_view_outlined,
            size: 30,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
            size: 30,
          ),
          label: '',
        ),
      ],
    );
  }
}

class _CollegeCard extends StatelessWidget {
  final CollegesResponse college;

  const _CollegeCard({
    Key? key,
    required this.college,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 600),
      builder: (_, double opacity, __) => GestureDetector(
        onTap: () => Get.toNamed(
          '/detail',
          arguments: {'college': college},
        ),
        child: Hero(
          tag: college.name,
          child: Opacity(
            opacity: opacity,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Stack(
                children: [
                  Container(
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://media.gq.com.mx/photos/607dc9cf7a5da02e8a3dbb6d/master/pass/universidades%20harvard-1209892117.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 230,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0, 0.4],
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                          color: Colors.black.withOpacity(.2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            child: Text(
                              textAlign: TextAlign.start,
                              college.name,
                            ),
                          ),
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            child: Text(
                              textAlign: TextAlign.start,
                              college.country,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final int selected;
  final Function onTap;

  const Categories({
    Key? key,
    required this.tabs,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () => onTap(index),
            child: Text(
              tabs[index],
              style: selected == index
                  ? AppTextStyles.labelStyle
                  : AppTextStyles.unselectedLabelStyle,
            ),
          ),
        ),
        itemCount: tabs.length,
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  final void Function(String) searchHandler;

  const SearchInput({
    Key? key,
    required this.searchHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: searchHandler,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(fontSize: 16),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
