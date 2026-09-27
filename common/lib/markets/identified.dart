import 'buyer_predicate.dart';

abstract interface class Identified {
  String get id;
}

abstract interface class Sourced implements Identified {
  String get sourceId;
}

abstract interface class ConditionalRule implements Identified {
  BuyerPredicate? get appliesTo;
}
