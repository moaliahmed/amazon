import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'add_car_state.dart';

class AddCartCubit extends Cubit<AddCarState> {
  AddCartCubit() : super(AddCarInitial());
  static AddCartCubit get(context) => BlocProvider.of(context);

  List itemCard = [];

  int cartlenght = 0;
  late int nqty;

   late String fname;
   late int fprice;
   late int fqty;
    int total=0;
  add(
      {required int id,
      required String name,
      required int price,
      int qty = 1}) {
    bool rebted = false;
    int place = 0;
    itemCard.forEach(
      (element) {
        Map m = element;

        m.forEach((key, value) {
            if (key == id) {
              rebted = true;
              nqty = value['qty'];
            } 
          },
        );
        if (rebted != true) {
          place++;
        }
      },
    );

    if (rebted == true) {
      itemCard.removeAt(place);
      itemCard.addAll([
        {
          id: {'name': name, 'price': price, 'qty': nqty + 1}
        }
      ]);
    } else {
      itemCard.addAll([
        {
          id: {'name': name, 'price': price, 'qty': qty},
        }
      ]);
      cartlenght++;
    }
    
    print(itemCard);
    print(cartlenght);
  }

  removeItem(int index) {
    itemCard.removeAt(index);
    cartlenght--;
    emit(AddCarSuccess());
    getTotel();
  }

   rcart(int index) {
   Map b= itemCard[index];
   b.forEach((key, value) {  
    b=value;
});
print('$b');
fname=b['name'];
fprice=b['price'];
fqty=b['qty'];

  }


getTotel(){
  total=0;
  itemCard.forEach((element) {
    Map T=element;
    T.forEach((key, value) {
      T=value;
    });
    int q=T['qty'];
    int e=T['price'];
    total+= (e*q);
   });

}

}
