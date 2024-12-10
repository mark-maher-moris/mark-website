class ProjectModel {
  final String? name;
  final String? description;
  final String? image;
  final String? github;
  final String? playStore;
  final String? appStore;
  final String? video;
  final String? url;
  List<String>? screenshots;
  final String? projectType;

  ProjectModel(
      {this.name,
      this.description,
      this.image,
      this.github,
      this.playStore,
      this.appStore,
      this.video,
      this.url,
      this.screenshots,
      this.projectType});
}
