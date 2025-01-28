class ExpenseModel {
  int? amount;
  String? desc;
  String? date;
  ExpenseModel({this.amount, this.desc, this.date});

  Map<String, dynamic> toMap() {
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
    );
  }
}
