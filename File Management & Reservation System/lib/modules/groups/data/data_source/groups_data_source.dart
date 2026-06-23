

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:web_app/core/const/api_const.dart';
import 'package:web_app/core/network/network_handler.dart';
import 'package:web_app/modules/groups/data/model/group_model.dart';
import 'package:web_app/modules/groups/data/model/invite_model.dart';
import 'package:web_app/modules/groups/data/model/log_model.dart';
import 'package:web_app/modules/groups/data/model/upload_request_model.dart';
import 'package:web_app/modules/groups/data/model/user_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../model/group_info_model.dart';

class GroupsDataSource {

  static Future<void> createGroup(String name){
    return NetworkHandler().post(ApiConst.createGroup,data: {
      'name':name
    });
  }


  static Future<List<GroupModel>> getMyGroups()async{
    var res = await NetworkHandler().get(ApiConst.getGroups);
    List data = res.data['data'] ?? [];
    return data.map((e) => GroupModel.fromJson(e)).toList();
  }

  static Future<(List<FileModel>,bool)> getMyFiles(int id) async {
    var res = await NetworkHandler().get(ApiConst.getGroupFiles(id));
    List data = res.data['data']['data'];
    return (data.map((e) => FileModel.fromJson(e)).toList(),res.data['role'] == 'admin');
  }


  static Future<List<UserModel>> searchUsers(int groupId,String name)async{
    var res = await NetworkHandler().get(ApiConst.searchUsers(groupId,name));
    List data = res.data['data']?['data'] ?? [];
    return data.map((e) => UserModel.fromJson(e)).toList();
  }

  static Future<List<UserModel>> getGroupMembers(int groupId,)async{
    var res = await NetworkHandler().get(ApiConst.members(groupId));
    print(res.data);
    print(groupId);
    List data = res.data['data']?['data'] ?? [];
    return data.map((e) => UserModel.fromJson(e)).toList();
  }

  static Future<void> addMember(int groupId,int userId)=>
      NetworkHandler().post(
        ApiConst.addUser(groupId),
        data: {
          'user_id':userId
        }
      );

  static Future<List<InviteModel>> getInvites() async {
    var response = await NetworkHandler().get(ApiConst.invites);
    List data = response.data['data']['data'];
    return data.map(
            (e) => InviteModel.fromJson(e)
    ).toList();
  }


  static Future<void> acceptInvite(int id)=>
      NetworkHandler().post(
          ApiConst.acceptInvite(id),
      );

  static Future<void> rejectInvite(int id)=>
      NetworkHandler().patch(
          ApiConst.rejectInvite(id),
      );

  static Future<void> acceptUploadRequest(int groupId,int reqId)=>
      NetworkHandler().post(
          ApiConst.acceptUploadRequest(groupId,reqId),
      );

  static Future<void> rejectUploadRequest(int groupId,int reqId)=>
      NetworkHandler().patch(
          ApiConst.rejectUploadRequest(groupId,reqId),
      );

  static Future<void> uploadFile(int groupId,PlatformFile file)=>
      NetworkHandler().post(
        ApiConst.addFile(groupId),
        data: FormData.fromMap({
          'file':MultipartFile.fromBytes(file.bytes!.toList(),filename: file.name),
        })
      );

  static Future<void> checkOut(int fileId,PlatformFile file)=>
      NetworkHandler().post(
        ApiConst.checkOut,
        data: FormData.fromMap({
          'file':MultipartFile.fromBytes(file.bytes!.toList(),filename: file.name),
          'file_id' :fileId
        })
      );

  static Future<List<UploadRequestModel>> getUploadRequests(int groupId)async{
    var response = await NetworkHandler().get(ApiConst.getUploadRequests(groupId));
    List data = response.data['data']?['data'] ?? [];
    return data.map(
            (e) => UploadRequestModel.fromJson(e)
    ).toList();
  }
  
  static Future<void> checkIn(List<int> files,int groupId)=>
      NetworkHandler().post(ApiConst.checkIn(groupId),
        data: {
          "file_ids":files
        }
      );

  static Future<List<LogModel>> getFileLogs(int groupId,int fileId)async{
    var response = await NetworkHandler().get(ApiConst.fileLog(groupId,fileId));
    List data = response.data['data'] ?? [];
    return data.map(
            (e) => LogModel.fromJson(e)
    ).toList();
  }

  static Future<List<LogModel>> getMemberLogs(int groupId,int userId) async{
    var response = await NetworkHandler().get(ApiConst.memberLog(groupId,userId));
    List data = response.data['data'] ?? [];
    return data.map(
            (e) => LogModel.fromJson(e)
    ).toList();
  }


  static Future<void> deleteFile(int groupId,int fileId)
    => NetworkHandler().delete(ApiConst.delete(groupId, fileId));


  static Stream<String> getNotifications(int id) async*{
    WebSocketChannel channel = WebSocketChannel.connect(Uri.parse(ApiConst.pusher));
    await channel.ready;
    channel.sink.add(ApiConst.subscribe('group.$id'));
    await for(var x in channel.stream){
      yield x.toString();
    }
  }



}