class ExpenseModel {
  int? id ;
  int? amount;
  String? desc;
  String? date;
  ExpenseModel({this.amount, this.desc, this.date , this.id});

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'desc': desc,
      'date': date,
      "id" : id.toString()
    };
  }

  Map<String, dynamic> toMapAdd() {
    return {
      'amount': amount,
      'desc': desc,
      'date': date,

    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      amount: map['amount'],
      desc: map['desc'],
      date: map['date'],
      id : map['id']
    );
  }
}
