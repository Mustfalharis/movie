

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controller/serach_controller.dart';
import '../widget/search/costom_search_from_field.dart';
import 'package:get/get.dart';

import '../widget/search/list_moive_recet_search.dart';
import '../widget/search/list_movie_search.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerImp());
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child:
      GetBuilder<SearchControllerImp>(
        builder: (controller)=>SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              CustomSearchFromField(
                myController: controller.searchController!,
                 onChanged:(value){
                   controller.search(value);
                 },
              ),
              controller.searchController!.text.isEmpty?
               ListMovieRecentSearch():
               ListMovieSearch()

          ]
          ),
        ),
      ),
    );
  }
}
