import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/custom_network_image.dart';
import 'package:elevator_management_app/core/utils/url.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';
import 'package:elevator_management_app/modules/catalog/presentation/screens/update_cataog_screen.dart';

class CatalogView extends StatelessWidget {
  final CatalogModel model;
  const CatalogView(this.model,{super.key});


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(2.5.vmin),
      child: Padding(
        padding: EdgeInsets.all(1.25.vmin),
        child: Column(
          children: [
            ListTile(
              title: Text(model.title),
              subtitle: Text(DateFormat("yyyy-MM-dd").format(model.createdAt)),
              trailing: IconButton(
                onPressed: () => UpdateCatalogScreen.navigate(model),
                icon: Icon(Icons.edit),
              ),
            ),
            ListTile(
              title: const Text("Description"),
              subtitle: Text(model.description),
            ),
            ListTile(
              title: const Text("Price"),
              subtitle: Text("${model.price}"),
            ),
            ListTile(
              title: const Text("Videos :"),
              subtitle: Text("${model.videos.length}"),
            ),
            SizedBox(
              height: 7.5.vmin,
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: model.videos.length,
                  itemBuilder: (_,i) => Container(
                      height: 7.5.vmin,
                      padding: EdgeInsets.all(1.25.vmin),
                      child: InkWell(
                        onTap: (){
                          UrlHelper.tryLaunch(model.videos[i].url ?? '');
                        },
                        child: Text(model.videos[i].url ??'',
                          style: TextStyle(
                            color: Colors.blue.shade600
                          ),
                        ),
                      ),
                  ),
                  separatorBuilder: (_,__)=>Padding(
                    padding:  EdgeInsets.all(1.25.vmin),
                    child: const Text(","),
                  ) ,
              ),
            ),
            ListTile(
              title: const Text("Images :"),
              subtitle: Text("${model.images.length}"),
            ),
            SizedBox(
              height: 15.vmin,
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: model.images.length,
                  itemBuilder: (_,i) => SizedBox(
                      height: 15.vmin,
                      width: 15.vmin,
                      child: CustomNetworkImage(
                          url:model.images[i].url ?? '',
                          fit: BoxFit.cover,
                      ),
                  ),
                  separatorBuilder: (_,__)=>Padding(
                    padding:  EdgeInsets.all(1.25.vmin),
                    child: const VerticalDivider(),
                  ) ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
