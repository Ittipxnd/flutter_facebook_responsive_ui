import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/data/data.dart';
import 'package:flutter_facebook/models/video_model.dart';
import 'package:flutter_facebook/widgets/video_container.dart';
import 'package:flutter_facebook/widgets/watch_bar.dart';
import 'package:flutter_facebook/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchScreen extends StatefulWidget {
  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  String videoUrl1 = 'https://www.youtube.com/watch?v=j5-yKhDd64s';
  late YoutubePlayerController _controller1;

  String videoUrl2 = 'https://www.youtube.com/watch?v=E1ZVSFfCk9g';
  late YoutubePlayerController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl1)!);
    _controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl2)!);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _trackingScrollController.dispose();
    super.dispose();
  }

  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:
              _HomeScreenMobile(scrollController: _trackingScrollController),
          desktop:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
          tablet:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenMobile({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: Text(
            'facebook',
            style: const TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: () => print('Search'),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: () => print('Messenger'),
            ),
          ],
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: YoutubePlayer(
              controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      'https://www.youtube.com/watch?v=j5-yKhDd64s')!)),
        ),
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenDesktop({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(child: WatchBar()),
              SliverToBoxAdapter(
                child: Row(
                  children: <Widget>[
                    ProfileAvatar(imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
                    SizedBox(width: 7.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Greg',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.0)),
                        SizedBox(height: 5.0),
                        Text('7h')
                      ],
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: YoutubePlayer(
                    controller: YoutubePlayerController(
                        initialVideoId: YoutubePlayer.convertUrlToId(
                            'https://www.youtube.com/watch?v=j5-yKhDd64s')!)),
              ),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactsList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
