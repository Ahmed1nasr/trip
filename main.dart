import 'dart:io';

void main() {
  int select;

  do {
    stdout.write('\t1) for Add trip\t\t    4) for view trip\n');
    stdout.write('\t2) for Edit trip\t\t5) for Search trips\n');
    stdout.write('\t3) for Delet trip\t\t6) for reverse\n\n');
    stdout.write('Enter your choice > ');
    select = int.parse(stdin.readLineSync());
    stdout.write('\n');
    if (select == 1) {
      newTrep();
    } else if (select == 2) {
      editTrip();
    } else if (select == 3) {
      deletTrip();
    } else if (select == 4) {
      viewTrip();
    } else if (select == 5) {
    } else if (select == 6) {}
  } while (true);
}

ListTrip listTrip = ListTrip();

void newTrep() {
  stdout.write('Enter id : ');
  int id = int.parse(stdin.readLineSync());
  stdout.write('Enter location : ');
  String location = stdin.readLineSync();
  stdout.write('Enter passengerLimit : ');
  int passengerLimit = int.parse(stdin.readLineSync());
  stdout.write('Enter date : \n');
  stdout.write('            day > ');
  int day = int.parse(stdin.readLineSync());
  stdout.write('            month > ');
  int month = int.parse(stdin.readLineSync());
  stdout.write('            year > ');
  int year = int.parse(stdin.readLineSync());
  stdout.write('Enter price : ');
  double price = double.parse(stdin.readLineSync());
  Trip trip = Trip(
      id: id,
      location: location,
      passengerLimit: passengerLimit,
      day: day,
      month: month,
      year: year,
      price: price);
  listTrip.addObject(trip);
}

void sortLestdate() {
  var listObject = listTrip.listObject;
  Trip trip1 = Trip();
  Trip trip2 = Trip();

  int i, j;

  int n = listObject.length;
  int y1, m1, d1, y2, m2, d2;
  for (i = 0; i < n - 1; i++) {
    for (j = 0; j < n - i - 1; j++) {
      trip1 = listTrip.listObject[j];
      y1 = trip1.year;
      m1 = trip1.month;
      d1 = trip1.day;
      trip2 = listTrip.listObject[j + 1];
      y2 = trip2.year;
      m2 = trip2.month;
      d2 = trip2.day;
      if (y1 > y2) {
        var temp = listObject[j];
        listObject[j] = listObject[j + 1];
        listObject[j + 1] = temp;
      } else if (y1 == y2) {
        if (m1 > m2) {
          var temp = listObject[j];
          listObject[j] = listObject[j + 1];
          listObject[j + 1] = temp;
        } else if (m1 == m2) {
          if (d1 > d2) {
            var temp = listObject[j];
            listObject[j] = listObject[j + 1];
            listObject[j + 1] = temp;
          }
        }
      }
    }
  }
}

void viewTrip() {
  var listObject = listTrip.listObject;
  var id, location, passengerLimit, day, month, year, price;
  Trip tripo = Trip();
  sortLestdate();
  print('id\tlocation\tpsLm\t d a t e\tprice');
  for (int i = 0; i < listObject.length; i++) {
    tripo = listTrip.listObject[i];
    id = tripo.id;
    location = tripo.location;
    passengerLimit = tripo.passengerLimit;
    day = tripo.day;
    month = tripo.month;
    year = tripo.year;
    price = tripo.price;
    stdout.write('$id');
    stdout.write('\t$location');
    stdout.write('\t\t $passengerLimit');
    stdout.write('\t\t$day/$month/$year');
    stdout.write('\t $price');
    print('\n');
  }
}

void deletTrip() {
  var listObject = listTrip.listObject;
  Trip dtrip = Trip();
  stdout.write('Enter id of trip > ');
  int id = int.parse(stdin.readLineSync());
  int index;

  for (index = 0; index < listObject.length; index++) {
    dtrip = listObject[index];
    if (id == dtrip.id) {
      listObject.removeAt(index);
    }
  }
}

void editTrip() {
  var listObject = listTrip.listObject;
  var id;
  Trip etrip = Trip();
  void editItem(int id) {
    int index;
    for (index = 0; index < listObject.length; index++) {
      etrip = listObject[index];

      if (id == etrip.id) {
        bool submit = true;
        void fieldEdit() {
          stdout.write('\nare you need to edit other field (y/n):');
          String edit = stdin.readLineSync();
          if (edit == 'y') {
            submit = true;
          } else if (edit == 'n') {
            submit = false;
          }
        }

        void selectedNum(int number) {
          if (number == 1) {
            stdout.write('\nenter new id : ');
            etrip.id = int.parse(stdin.readLineSync());
          } else if (number == 2) {
            stdout.write('\nenter new location : ');
            etrip.location = stdin.readLineSync();
          } else if (number == 3) {
            stdout.write('\nenter new passengerLimit');
            etrip.passengerLimit = int.parse(stdin.readLineSync());
          } else if (number == 4) {
            stdout.write('\nenter new date\n');
            stdout.write('            day > ');
            etrip.day = int.parse(stdin.readLineSync());
            stdout.write('            month > ');
            etrip.month = int.parse(stdin.readLineSync());
            stdout.write('            year > ');
            etrip.year = int.parse(stdin.readLineSync());
          } else if (number == 5) {
            stdout.write('\nenter new price\n');
            etrip.price = int.parse(stdin.readLineSync());
          }
        }

        do {
          stdout.write('\n1) edit id');
          stdout.write('\n2) edit location');
          stdout.write('\n3) edit passengerLimit');
          stdout.write('\n4) edit date');
          stdout.write('\n5) edit price\n');
          stdout.write('Enter number to edit> ');
          int number = int.parse(stdin.readLineSync());
          selectedNum(number);
          fieldEdit();
        } while (submit);
      }
    }
  }

  bool submitTrip = true;
  void tripEdit() {
    stdout.write('\nare you need to edit other Trip (y/n):');
    String edit = stdin.readLineSync();
    if (edit == 'y') {
      submitTrip = true;
    } else if (edit == 'n') {
      submitTrip = false;
    }
  }

  do {
    stdout.write('Enter id of trip > ');
    id = int.parse(stdin.readLineSync());
    editItem(id);
    tripEdit();
  } while (submitTrip);
}

class ListTrip {
  var listObject = new List();
  // Trip trip = Trip();
  //ListTrip(this.trip);
  void addObject(trip) {
    listObject.add(trip);
  }
}

class Trip {
  var id, location, passengerLimit, day, month, year, price;
  Trip(
      {this.id,
      this.location,
      this.passengerLimit,
      this.day,
      this.month,
      this.year,
      this.price});
}
