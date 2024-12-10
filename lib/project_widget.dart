import 'package:flutter/material.dart';
import 'package:mark_website/project_model.dart';

class ProjectWidget extends StatefulWidget {
  final ProjectModel model;

  const ProjectWidget({Key? key, required this.model}) : super(key: key);

  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onHover: (value) {
          setState(() {
            hover = value;
          });
        },
        onTap: () {},
        child: Stack(
          children: [
            Container(
              width: 700,
              height: 500,
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.model.image.toString(),
                          fit: BoxFit.cover,
                          height: 400,
                          errorBuilder: (context, error, stackTrace) {
                            return Text(
                              'Failed to load image ${error.toString()}',
                              style: TextStyle(color: Colors.white),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            widget.model.name.toString(),
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
            Container(
              width: 700,
              height: 500,
              decoration: BoxDecoration(
                color: hover
                    ? const Color.fromARGB(137, 0, 116, 183)
                    : Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
