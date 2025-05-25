import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network_caller/network_caller.dart';
import 'package:ecommerce/features/common/data/models/slider_model.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage ;

  String? get errorMessage => _errorMessage;

  List<SliderModel> _sliderList = [];
  List<SliderModel> get sliderList => _sliderList;

  Future<bool> getSliders() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: AppUrls.sliderUrl);

    if(response.isSuccess){
      List<SliderModel> list = [];
      for(Map<String, dynamic> data in response.responseData?['data']['results'] ?? []){
        list.add(SliderModel.formJson(data));
      }
      _sliderList = list;
      isSuccess = true;
      _errorMessage = null;
    } else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
}