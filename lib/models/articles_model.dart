class ArticlesModel{

  final String ? image;
  final String ? title;
  final String ? subTitle;

  ArticlesModel(
      {required this.image ,
        required this.title ,
        required this.subTitle,
      });

 factory ArticlesModel.formJson(json){
    return ArticlesModel(
      image: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
    );
  }


}