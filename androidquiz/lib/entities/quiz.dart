class Quiz {
  final int id;
  final String quiztitle;
  final String quizdesc;
  final int creator_id;

  String getQuiztitle(){
    return quiztitle;
  }
  String getQuizdesc(){
    return quizdesc;
  }
  int getCreator_id(){
    return creator_id;
  }
  int getQuizId(){
    return id;
  }

  const Quiz({
    required this.id,
    required this.quiztitle,
    required this.quizdesc,
    required this.creator_id,
  });
  
  factory Quiz.fromJson(Map<String, dynamic> json ){
    return Quiz(
      id: json['id'],
      quiztitle: json['quiztitle'],
      quizdesc: json['quizdesc'],
      creator_id: json['creator_id'],
    );
  }
}