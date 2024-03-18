class UserNotification {
  final String imageUrl;
  final String content;
  final String time;

  UserNotification(
      {required this.imageUrl, required this.content, required this.time});
}

List<UserNotification> notifications = [
  new UserNotification(
      imageUrl:
          'https://scontent.fbkk7-2.fna.fbcdn.net/v/t39.30808-6/263782278_453917936101910_954986000470792926_n.png?_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_ohc=f4DUkNYjP_MAX-ZiTK2&_nc_ht=scontent.fbkk7-2.fna&oh=00_AfDIxIMcAJJaVntNYcCBAb0fbe9Fw7zEJWMKD4KRjZZbXQ&oe=65FCD719',
      content: 'Goalcast posted a new video',
      time: '3 hours ago'),
  new UserNotification(
      imageUrl:
          'https://scontent.fbkk7-2.fna.fbcdn.net/v/t39.30808-6/352234250_9407179106019698_7426267769582954875_n.png?_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_ohc=pA52vqWKIOoAX_S1a07&_nc_ht=scontent.fbkk7-2.fna&oh=00_AfDggpVlIPy6BlA2pZVVO4x3tSAs8BcJ_5j0TTjuOlV3Cg&oe=65FD2C51',
      content: 'Playstation posted a new video',
      time: '8 hours ago'),
  new UserNotification(
      imageUrl:
          'https://scontent.fbkk7-2.fna.fbcdn.net/v/t39.30808-1/428656784_806125541553174_9127202761435783561_n.jpg?stp=dst-jpg_p320x320&_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_ohc=U6RhXktXjasAX_MgaAB&_nc_ht=scontent.fbkk7-2.fna&oh=00_AfB-QruLbI_sjX_lq9PMV_AEKFkxlTFcH1o-F5B3xUyHDA&oe=65FCEAF7',
      content: 'Xbox posted a new video',
      time: '9 hours ago'),
  new UserNotification(
      imageUrl:
          'https://scontent.fbkk7-2.fna.fbcdn.net/v/t39.30808-1/404685323_761776599317662_2898655837631716930_n.jpg?stp=dst-jpg_p320x320&_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_ohc=vhL31TRda3IAX9yIzoh&_nc_ht=scontent.fbkk7-2.fna&oh=00_AfB7CIAGorjL1RWD3BLqUb4bns_ld2SL4ic3Hnqun33_LA&oe=65FC9EEB',
      content: 'Reddit posted a new video',
      time: '22 hours ago'),
  new UserNotification(
      imageUrl:
          'https://scontent.fbkk7-2.fna.fbcdn.net/v/t39.30808-6/277519684_10158675188522823_7436488509713286219_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_ohc=tHF6KGHgT4cAX_rtx3a&_nc_ht=scontent.fbkk7-2.fna&oh=00_AfACTWPbOnT6jaNjrJE4LD0lh-g-BRliSWal-Gpz0wC3Kg&oe=65FDB66B',
      content: 'Linkedin posted a new photo',
      time: '1 day ago'),
  new UserNotification(
      imageUrl:
          'https://scontent.fbkk7-2.fna.fbcdn.net/v/t39.30808-1/431398008_960172219097917_6830646626786920516_n.jpg?stp=dst-jpg_p320x320&_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_ohc=X1NKPdLgTj8AX8dg2UU&_nc_ht=scontent.fbkk7-2.fna&oh=00_AfAnedo0AZTGQEsWNUD14I0ENgbOQmsrWgAXMhWzeprm2w&oe=65FD67F5',
      content: 'IGN posted a new video',
      time: '4 days ago'),
  new UserNotification(
      imageUrl:
          'https://yt3.googleusercontent.com/ytc/AIdro_lXPtpQENlzGAhOOdwoBgbWgdZZspr_D5wmS1dR6w=s160-c-k-c0x00ffffff-no-rj',
      content: 'Skooldio posted a new video',
      time: '6 days ago'),
  new UserNotification(
      imageUrl:
          'https://scontent.fbkk7-2.fna.fbcdn.net/v/t39.30808-1/312886623_663859701769926_2823600560393023460_n.png?stp=dst-png_p320x320&_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=aUnNvPH1p4gAX-rHEpo&_nc_ht=scontent.fbkk7-2.fna&oh=00_AfDKqFXCku_q15lm23GX-TRfur-Twutxp3xHZhI5yK6G1w&oe=65FD8E62',
      content: 'หนุ่มจืด posted a new photo',
      time: '1 week ago'),
  new UserNotification(
      imageUrl:
          'https://scontent.fbkk7-2.fna.fbcdn.net/v/t39.30808-6/420203590_402433122318389_5539248641210178279_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_ohc=8tVKYcqdwL8AX8dT0R2&_nc_ht=scontent.fbkk7-2.fna&oh=00_AfD2NE3w7456oDPmHIT-K0-bbuoUPayovDRmojLYiph3-g&oe=65FD06BF',
      content: 'ขอบสนาม posted a new photo',
      time: '3 weeks ago'),
  new UserNotification(
      imageUrl:
          'https://scontent.fbkk7-2.fna.fbcdn.net/v/t39.30808-6/357114132_663626395803876_9160901486783268101_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_ohc=tiPQfLCyTccAX-dqnOB&_nc_ht=scontent.fbkk7-2.fna&oh=00_AfCE4CW5FGNN-Zk2_RqIq5uSluX77HbzA3hw3xWVLdUqww&oe=65FD4335',
      content: 'FPS Thailand posted a new photo',
      time: '1 month ago')
];
