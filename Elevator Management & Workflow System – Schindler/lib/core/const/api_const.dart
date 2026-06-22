
import 'dart:convert';

import '../storage/storage_handler.dart';

class ApiConst {

  static const _base = 'https://www.test.alz-sy.com';
  static const _baseApi = '$_base/api';

  static const login = '$_baseApi/login';
  static const register = '$_baseApi/register';
  static const users = '$_baseApi/user';
  static const roles = '$_baseApi/role';
  static const orderStep = '$_baseApi/order-step';
  static const permissions = '$_baseApi/permission';
  static const team = '$_baseApi/team';
  static String teamById(id) => '$team/$id';
  static const visit = '$_baseApi/visit';
  static const confirmVisit = '$_baseApi/visit-confirm';


  static const catalog = '$_baseApi/catalog';
  static const elevators = '$_baseApi/elevators';
  static String catalogById(id) => '$catalog/$id';
  static const part = '$_baseApi/part';
  static const form = '$_baseApi/form';
  static const visitConfirm = '$_baseApi/visit-confirm';


  static const order = '$_baseApi/order';
  static String orderById(id) => '$_baseApi/order/$id';
  static String checkStep(id) => '$_baseApi/check-step/$id';

  static const orderType = '$_baseApi/order-type';
  static String orderTypeById(id) => '$_baseApi/order-type/$id';

  static const contracts = '$_baseApi/contract';
  static String contractById(id) => '$contracts/$id';

  static const client = '$_baseApi/client';
  static String clientById(id) => '$client/$id';

}