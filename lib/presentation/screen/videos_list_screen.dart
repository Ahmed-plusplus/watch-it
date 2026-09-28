import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchit/data/repository/app_repository.dart';
import 'package:watchit/presentation/cubit/app_cubit.dart';
import 'package:watchit/presentation/cubit/app_states.dart';
import 'package:watchit/presentation/screen/widget/video_card.dart';

class VideosListScreen extends StatefulWidget {
  const VideosListScreen({super.key});

  @override
  State<VideosListScreen> createState() => _VideosListScreenState();
}

class _VideosListScreenState extends State<VideosListScreen> {

  ValueNotifier<bool> _isSearchClicked = ValueNotifier(false);
  TextEditingController _searchController = TextEditingController();

  late AppCubit _cubit;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: BlocProvider(
        create: (context) => AppCubit(AppRepository()),
        child: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            _cubit = context.read<AppCubit>();
            return ValueListenableBuilder(
              valueListenable: _isSearchClicked,
              builder: (context, isSearchClicked, child) {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.lightBlue,
                    title: Text('WatchIt', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                      )
                    ),
                    actions: [
                      isSearchClicked ? Focus(
                        onFocusChange: (isFocus) {
                          if(!isFocus){
                            FocusScope.of(context).unfocus();
                            _isSearchClicked.value = false;
                          }
                        },
                        child: SizedBox(
                          width: size.width * 3 / 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _searchController,
                              textInputAction: TextInputAction.search,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                hintStyle: const TextStyle(color: Colors.black45),
                                prefixIcon: const Icon(Icons.search, color: Colors.black45),
                                filled: true,
                                fillColor: Colors.white70,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onSubmitted: (query) => _cubit.getSearchedVideos(query),
                            ),
                          ),
                        ),
                      ) : IconButton(
                        onPressed: () => _isSearchClicked.value = true,
                        icon: const Icon(Icons.search, color: Colors.black45),
                      ),
                    ],
                  ),
                  body: ListView.builder(
                    itemBuilder: (context, index) => VideoCard(video: _cubit.videos[index]),
                    itemCount: _cubit.videos.length,
                  ),
                );
              }
            );
          }
        ),
      ),
    );
  }
}
