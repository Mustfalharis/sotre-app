import 'package:store_getx/core/class/status_request.dart';

handlingData(response)
{
  if(response is StatusRequest)
    {
      return response;
    }else
    {
     return StatusRequest.success;
    }
}