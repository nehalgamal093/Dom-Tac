import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/is_home_bloc/is_home_bloc.dart';
import '../../../resources/colors_manager.dart';
import '../../appBar/widgets/app_bar_btns.dart';
import '../../search/widgets/search_bar.dart';

PreferredSizeWidget mainAppBar(
    BuildContext context, TextEditingController controller) {
  return context.watch<IsHomeBloc>().state.isHome
      ? AppBar(
          actions: [
            InkWell(
              onTap: () {
                context
                    .read<IsHomeBloc>()
                    .add(const setCurrentWidgetEvent(isHome: false));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [appBarBtns(Icons.search)],
              ),
            ),
          ],
          backgroundColor: ColorsManager.primaryColor,
          bottom: const TabBar(
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabs: [
              Text(
                'Tracks',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Playlists',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          title: const Text(
            'Dom Tac',
            style: TextStyle(color: Colors.white),
          ),
        )
      : searchBar(context, controller);
}
