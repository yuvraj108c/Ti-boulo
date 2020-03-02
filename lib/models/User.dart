class User {
  String username;
  String profileImage;
  String details;

  User.withImage({this.username, this.profileImage});
  User.withImageDetails({this.username, this.profileImage, this.details});
  User(this.username);
}

final currentUser = User.withImage(
    username: "Me",
    profileImage:
        "https://cdn.pixabay.com/photo/2020/01/27/10/28/appetite-4796886__340.jpg");

final userList = <User>[
  User.withImage(
      profileImage:
          "https://cdn.pixabay.com/photo/2020/01/27/19/04/macbook-4798095__340.jpg",
      username: 'Macron'),
  User.withImage(
      profileImage:
          "https://cdn.pixabay.com/photo/2020/01/28/07/17/lamp-4799089__340.jpg",
      username: 'Lita'),
  User.withImage(
      profileImage:
          "https://cdn.pixabay.com/photo/2015/07/27/20/16/book-863418_960_720.jpg",
      username: 'Sareen'),
  User.withImage(
      profileImage:
          "https://cdn.pixabay.com/photo/2018/01/15/07/51/woman-3083383__340.jpg",
      username: 'Worsee'),
  User.withImage(
      profileImage:
          "https://cdn.pixabay.com/photo/2017/03/04/12/15/programming-2115930__340.jpg",
      username: 'Provert'),
  User.withImage(
      profileImage:
          "https://cdn.pixabay.com/photo/2015/07/10/17/24/hipster-839803__340.jpg",
      username: 'Hipster'),
];
