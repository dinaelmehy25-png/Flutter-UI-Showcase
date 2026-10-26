class UserModel {
    int? id  ;
    String? title;
    String? body;
    int? views;
    int? likes;
    int? dislikes; 

      
    UserModel({this.id,this.title,this.body,this.views,this.likes,this.dislikes}) ;

    UserModel.fromJson(Map<String, dynamic> json){
      id = json['id'];
      title = json['title'];
      body = json['body'];
      views = json['views'];
      likes = json['likes'];
      dislikes = json['dislikes'];
    } 




}
