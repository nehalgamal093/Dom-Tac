import 'package:dom_tac_music_player/presentation/pages/appBar/widgets/app_bar_btns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/is_home_bloc/is_home_bloc.dart';
import '../../../../bloc/search_term_bloc/search_term_bloc.dart';

PreferredSize searchBar(
    BuildContext context, TextEditingController songController) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(100.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            context
                .read<IsHomeBloc>()
                .add(const setCurrentWidgetEvent(isHome: true));
          },
          child: appBarBtns(Icons.arrow_back),
        ),
        title: SizedBox(
          height: 50,
          width: 300,
          child: TextField(
            onChanged: (String? newSearchTerm) {
              if (newSearchTerm != null) {
                context
                    .read<SearchTermBloc>()
                    .add(SetSearchTermEvent(newSearchTerm: newSearchTerm));
              }
            },
            controller: songController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
