import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mutidatabaseapp/view_model/data_registration_view_model.dart';
import 'package:mutidatabaseapp/views/components/button_with_icon.dart';
import 'package:provider/provider.dart';

class DataRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(  'DBデータを表示'),
          ),
          body: SingleChildScrollView(
            child: Center(

              child: Consumer<DataRegistrationViewModel>(
              builder: (context, model, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    Text('productName:${model.productName}'),
                    const SizedBox(height: 10,),
                    Text('productDescription:${model.productDescription}'),
                    const SizedBox(height: 10,),
                    Text('productImage:small:${model.productImage}'),
                    const SizedBox(height: 20,),
                    ButtonWithIcon(
                      label: 'バーコードで商品情報取得',
                      icon: const FaIcon(FontAwesomeIcons.barcode),
                      buttonColor: Colors.orangeAccent,
                      onPressed: () =>  getProductInfo(context),
                    ),

                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(15)),
                      child: const Text('保存'),
                      onPressed: () => registerProductData(context),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),

    );
  }

///商品情報検索
  Future<void> getProductInfo(BuildContext context) async{
    final viewModel =
    Provider.of<DataRegistrationViewModel>(context, listen: false);
    await viewModel.getProductInfo();
  }

  ///保存ボタン
  Future<void> registerProductData(BuildContext context) async{
    final viewModel =
    Provider.of<DataRegistrationViewModel>(context, listen: false);
    //todo テキストデータ(渡さなくてもviewModelから直接取れば良い？)
    await viewModel.registerProductData();
  }


}
