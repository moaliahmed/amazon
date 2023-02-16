part of 'all_item_cubit.dart';

@immutable
abstract class AllItemState {}

class AllItemInitial extends AllItemState {}


class AllItemSueccess extends AllItemState {}
class AllItemError extends AllItemState {}
class AllItemLoding extends AllItemState {}
