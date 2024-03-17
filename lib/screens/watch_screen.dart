import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/data/data.dart';
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

  String videoUrl3 = 'https://www.youtube.com/watch?v=kgqomHejqtU&t';
  late YoutubePlayerController _controller3;

  String videoUrl4 = 'https://www.youtube.com/watch?v=mApB6lTJ6_A';
  late YoutubePlayerController _controller4;

  String videoUrl5 = 'https://www.youtube.com/watch?v=4jIFC8kSj5M';
  late YoutubePlayerController _controller5;

  @override
  void initState() {
    super.initState();
    _controller1 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl1)!);
    _controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl2)!);
    _controller3 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl3)!);
    _controller4 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl4)!);
    _controller5 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl5)!);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
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
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          sliver: SliverAppBar(
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
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: <Widget>[
                ProfileAvatar(
                    imageUrl:
                        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
                SizedBox(width: 5.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          sliver: SliverToBoxAdapter(
            child: YoutubePlayer(
                controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(
                        'https://www.youtube.com/watch?v=fNnChc2w2aM&t=395s')!)),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          sliver: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.thumb_up, size: 15.0, color: Colors.blue),
              Text(' 23'),
              Text('2 comments  •  '),
              Text('1 share'),
            ],
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
              SliverToBoxAdapter(
                child: Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ),
              SliverToBoxAdapter(child: WatchBar()),
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
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Palette.facebookBlue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.thumb_up,
                        size: 10.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Expanded(
                      child: Text(
                        '100',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Text(
                      '100Comments',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      '20Shares',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
              )
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
