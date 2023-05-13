import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/class/status_request.dart';
import '../functions/check_internet.dart';
class Crud
{
  Future<Either<StatusRequest,Map>>postData(String linkUrl,Map data)async
  {

    try
    {
      if(await checkInternet()==true)
      {
        var response= await http.post(Uri.parse(linkUrl),body: data);
        if(response.statusCode==200||response.statusCode==201)
        {
          Map responseBody=jsonDecode(response.body);
          return Right(responseBody);
        }
        else
        {

          return const Left(StatusRequest.serverFailure);
        }
      }
      else
      {
        return const Left(StatusRequest.offlineFailure);
      }
    }catch(_)
    {
      return const Left(StatusRequest.serverFailure);
    }

  }
}