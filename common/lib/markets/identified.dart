import 'buyer_predicate.dart';

abstract interface class Identified {
  String get id;
}

abstract interface class ConditionalRule implements Identified {
  BuyerPredicate? get appliesTo;
}
