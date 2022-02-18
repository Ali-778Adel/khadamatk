import 'package:khadamatic_auth/models/client_orders_model.dart';

abstract class TransactionStates{}
class InitialTransactionState extends TransactionStates{}
class GetTransactionSuccess extends TransactionStates{
  final ClientOrdersModel clientOrdersModel;

  GetTransactionSuccess(this.clientOrdersModel);
}
class GetTransactionError extends TransactionStates{
final String error;

  GetTransactionError(this.error);
}
class GetTransactionLoading extends TransactionStates{}