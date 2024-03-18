import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/data/data.dart';
import 'package:flutter_facebook/widgets/post_button.dart';
import 'package:flutter_facebook/widgets/watch_bar.dart';
import 'package:flutter_facebook/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_facebook/widgets/post_container.dart';

class WatchScreen extends StatefulWidget {
  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  String videoUrl1 = 'https://www.youtube.com/watch?v=j5-yKhDd64s';
  late YoutubePlayerController _controller1;

  String videoUrl2 = 'https://www.youtube.com/watch?v=E1ZVSFfCk9g';
  late YoutubePlayerController _controller2;

  String videoUrl3 = 'https://www.youtube.com/watch?v=kgqomHejqtU&t';
  late YoutubePlayerController _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl1)!);
    _controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl2)!);
    _controller3 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl3)!);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
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
              _HomeScreenMobile(scrollController: _trackingScrollController),
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
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: <Widget>[
                ProfileAvatar(
                  imageUrl:
                      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
                ),
                SizedBox(height: 3, width: 8.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 3.0),
                    Text(
                      'Greg',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(height: 1.0),
                    Text('7h'),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 3),
          sliver: SliverToBoxAdapter(
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(
                  'https://www.youtube.com/watch?v=fNnChc2w2aM&t=395s',
                )!,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(47, 3, 47, 3),
          sliver: SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.thumb_up,
                                  size: 15.0, color: Colors.blue),
                              Text(
                                '23',
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '2 comments • 1 share',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(47, 0, 47, 0),
          sliver: SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Divider(
                color: Colors.grey,
                thickness: 1.0,
                height: 2.0,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(47, 3, 47, 50),
          sliver: SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        PostButton(
                          icon: Icon(
                            MdiIcons.thumbUpOutline,
                            color: Colors.grey[600],
                            size: 20.0,
                          ),
                          label: 'Like',
                          onTap: () => print('Like'),
                        ),
                        PostButton(
                          icon: Icon(
                            MdiIcons.commentOutline,
                            color: Colors.grey[600],
                            size: 20.0,
                          ),
                          label: 'Comment',
                          onTap: () => print('Comment'),
                        ),
                        PostButton(
                          icon: Icon(
                            MdiIcons.shareOutline,
                            color: Colors.grey[600],
                            size: 25.0,
                          ),
                          label: 'Share',
                          onTap: () => print('Share'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: <Widget>[
                ProfileAvatar(
                  imageUrl:
                      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
                ),
                SizedBox(height: 3, width: 8.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 3.0),
                    Text(
                      'Greg',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(height: 1.0),
                    Text('7h'),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 3),
          sliver: SliverToBoxAdapter(
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(
                  'https://www.youtube.com/watch?v=fNnChc2w2aM&t=395s',
                )!,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(47, 3, 47, 3),
          sliver: SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.thumb_up,
                                  size: 15.0, color: Colors.blue),
                              Text(
                                '23',
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '2 comments • 1 share',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(47, 0, 47, 0),
          sliver: SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Divider(
                color: Colors.grey,
                thickness: 1.0,
                height: 2.0,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(47, 3, 47, 50),
          sliver: SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        PostButton(
                          icon: Icon(
                            MdiIcons.thumbUpOutline,
                            color: Colors.grey[600],
                            size: 20.0,
                          ),
                          label: 'Like',
                          onTap: () => print('Like'),
                        ),
                        PostButton(
                          icon: Icon(
                            MdiIcons.commentOutline,
                            color: Colors.grey[600],
                            size: 20.0,
                          ),
                          label: 'Comment',
                          onTap: () => print('Comment'),
                        ),
                        PostButton(
                          icon: Icon(
                            MdiIcons.shareOutline,
                            color: Colors.grey[600],
                            size: 25.0,
                          ),
                          label: 'Share',
                          onTap: () => print('Share'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: <Widget>[
                ProfileAvatar(
                  imageUrl:
                      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
                ),
                SizedBox(height: 3, width: 8.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 3.0),
                    Text(
                      'Greg',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(height: 1.0),
                    Text('7h'),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 3),
          sliver: SliverToBoxAdapter(
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(
                  'https://www.youtube.com/watch?v=fNnChc2w2aM&t=395s',
                )!,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(47, 3, 47, 3),
          sliver: SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.thumb_up,
                                  size: 15.0, color: Colors.blue),
                              Text(
                                '23',
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '2 comments • 1 share',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(47, 0, 47, 0),
          sliver: SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Divider(
                color: Colors.grey,
                thickness: 1.0,
                height: 2.0,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(47, 3, 47, 50),
          sliver: SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        PostButton(
                          icon: Icon(
                            MdiIcons.thumbUpOutline,
                            color: Colors.grey[600],
                            size: 20.0,
                          ),
                          label: 'Like',
                          onTap: () => print('Like'),
                        ),
                        PostButton(
                          icon: Icon(
                            MdiIcons.commentOutline,
                            color: Colors.grey[600],
                            size: 20.0,
                          ),
                          label: 'Comment',
                          onTap: () => print('Comment'),
                        ),
                        PostButton(
                          icon: Icon(
                            MdiIcons.shareOutline,
                            color: Colors.grey[600],
                            size: 25.0,
                          ),
                          label: 'Share',
                          onTap: () => print('Share'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 10, 12),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 3,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: WatchBar(),
              )),
              SliverToBoxAdapter(
                child: Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: <Widget>[
                    ProfileAvatar(
                        imageUrl:
                            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
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
                child: Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              ),
              SliverToBoxAdapter(
                child: YoutubePlayer(
                    controller: YoutubePlayerController(
                        initialVideoId: YoutubePlayer.convertUrlToId(
                            'https://www.youtube.com/watch?v=j5-yKhDd64s')!)),
              ),
              SliverToBoxAdapter(
                child: Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // ปรับเป็นสองฝั่ง
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            PostButton(
                              icon: Icon(
                                MdiIcons.thumbUpOutline,
                                color: Colors.grey[600],
                                size: 20.0,
                              ),
                              label: 'Like',
                              onTap: () => print('Like'),
                            ),
                            PostButton(
                              icon: Icon(
                                MdiIcons.commentOutline,
                                color: Colors.grey[600],
                                size: 20.0,
                              ),
                              label: 'Comment',
                              onTap: () => print('Comment'),
                            ),
                            PostButton(
                              icon: Icon(
                                MdiIcons.shareOutline,
                                color: Colors.grey[600],
                                size: 25.0,
                              ),
                              label: 'Share',
                              onTap: () => print('Share'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.thumb_up,
                                size: 15.0, color: Colors.blue),
                            Text(' 23  •  2 comments  •  1 share'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: <Widget>[
                    ProfileAvatar(
                        imageUrl:
                            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
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
                child: Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              ),
              SliverToBoxAdapter(
                child: YoutubePlayer(
                    controller: YoutubePlayerController(
                        initialVideoId: YoutubePlayer.convertUrlToId(
                            'https://www.youtube.com/watch?v=j5-yKhDd64s')!)),
              ),
              SliverToBoxAdapter(
                child: Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // ปรับเป็นสองฝั่ง
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            PostButton(
                              icon: Icon(
                                MdiIcons.thumbUpOutline,
                                color: Colors.grey[600],
                                size: 20.0,
                              ),
                              label: 'Like',
                              onTap: () => print('Like'),
                            ),
                            PostButton(
                              icon: Icon(
                                MdiIcons.commentOutline,
                                color: Colors.grey[600],
                                size: 20.0,
                              ),
                              label: 'Comment',
                              onTap: () => print('Comment'),
                            ),
                            PostButton(
                              icon: Icon(
                                MdiIcons.shareOutline,
                                color: Colors.grey[600],
                                size: 25.0,
                              ),
                              label: 'Share',
                              onTap: () => print('Share'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.thumb_up,
                                size: 15.0, color: Colors.blue),
                            Text(' 23  •  2 comments  •  1 share'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
