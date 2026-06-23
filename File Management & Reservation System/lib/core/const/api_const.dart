
import 'dart:convert';

import '../storage/storage_handler.dart';

class ApiConst {

  static const _base = 'http://127.0.0.1:8000';
  static const _baseApi = '$_base/api';

  static const login = '$_baseApi/login';
  static const register = '$_baseApi/register';

  static const createGroup = '$_baseApi/user/create_group';
  static const getGroups = '$_baseApi/user/view_groups';
  static const invites = '$_baseApi/user/view_invitations';

  static String rejectInvite(int id) => '$invites/$id/reject_invitation';
  static String acceptInvite(int id) => '$invites/$id/accept_invitation';

  static String checkIn(int id) => '$_baseApi/user/group/$id/files/check_in';

  static String delete(int groupId,int fileId) => '$_baseApi/user/group/$groupId/files/$fileId/delete_file';

  static const checkOut = '$_baseApi/user/check_out';


  // TODO :: complete Api
  static String memberLog(int groupId,int userId) => '$_baseApi/user/group/$groupId/members/member_log?user_id=$userId';

  static String fileLog(int groupId,int fileId) => '$_baseApi/user/group/$groupId/files/$fileId/file_log';



  static String getGroupFiles(int id) => '$_baseApi/user/group/$id/files';

  static String getUploadRequests(int id) =>
      '$_baseApi/user/group/$id/view_upload_requests';

  static String acceptUploadRequest(int groupId,int requestId) =>
      '${getUploadRequests(groupId)}/$requestId/accept_request';

  static String rejectUploadRequest(int groupId,int requestId) =>
      '${getUploadRequests(groupId)}/$requestId/reject_request';

  static String addFile(int groupId) =>
    '$_baseApi/user/group/$groupId/add_file';

  static String searchUsers(int groupId,String name)
        => '$_baseApi/user/group/$groupId/send_invite/view_users?name=$name';

  static String members(int groupId)
        => '$_baseApi/user/group/$groupId/members';


  static String addUser(int groupId)
        => '$_baseApi/user/group/$groupId/send_invite';



  static const pusher = 'wss://ws-eu.pusher.com:443/app/e5cbdff808c3292ad8c2';

  static String subscribe(String channel) => jsonEncode({
    'event': 'pusher:subscribe',
    'channel': channel,
    'data': {
      'channel': channel,
    }
  });

  static String download(id) => '$_baseApi/test?file_id=$id';





}