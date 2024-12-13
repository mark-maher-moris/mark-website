import 'package:flutter/material.dart';
import 'package:mark_website/home_lanading_page.dart';
import 'package:mark_website/project_model.dart';
import 'package:media_collection_previewer/media_collection_previewer.dart';

class ProjectScreen extends StatelessWidget {
  ProjectScreen({super.key, required this.projectModel});
  ProjectModel projectModel = ProjectModel();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(projectModel.name.toString(),
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(projectModel.image.toString(),
                        height: height / 2, width: width / 2),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: height / 2,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(projectModel.description.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  )),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  if (projectModel.appStore != null)
                                    linkButton(LinkType.appstore,
                                        projectModel.appStore.toString()),
                                  if (projectModel.googlePlay != null)
                                    linkButton(LinkType.googleplay,
                                        projectModel.googlePlay.toString()),
                                  if (projectModel.url != null)
                                    linkButton(LinkType.url,
                                        projectModel.url.toString()),
                                  if (projectModel.github != null)
                                    linkButton(LinkType.github,
                                        projectModel.github.toString()),
                                ],
                              )
                            ],
                          ),
                        ))),
                  )
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  // MediaCollection(medias: [
                  //   for (var i = 0; i < projectModel.screenshots!.length; i++)
                  //     Media(
                  //       url: projectModel.screenshots![i].toString(),
                  //       type: MediaType.image,
                  //       id: i,
                  //     )
                  // ]),
                  for (var i = 0; i < projectModel.screenshots!.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {},
                          child: Image.network(
                            projectModel.screenshots![i].toString(),
                            height: 400,
                          ),
                        ),
                      ),
                    )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget linkButton(LinkType linkType, String link) {
  return InkWell(
    onTap: () {
      openLink(link);
    },
    child: linkType == LinkType.url
        ? Container(
            child: Image.asset(
              'assets/images/link.png',
              height: 40,
            ),
          )
        : linkType == LinkType.appstore
            ? Container(
                child: Image.asset(
                  'assets/images/appstore.png',
                  height: 40,
                ),
              )
            : linkType == LinkType.googleplay
                ? Container(
                    child: Image.asset(
                      'assets/images/googleplay.png',
                      height: 60,
                    ),
                  )
                : Container(
                    child: Image.asset(
                      'assets/images/github.png',
                      height: 50,
                    ),
                  ),
  );
}

enum LinkType { github, googleplay, appstore, url }
