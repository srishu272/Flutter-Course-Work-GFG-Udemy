import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/appBar_widgets.dart';

class ImageFullScreenView extends StatefulWidget {
  final List<dynamic> imagesUrlList;

  const ImageFullScreenView({super.key, required this.imagesUrlList});

  @override
  State<ImageFullScreenView> createState() => _ImageFullScreenViewState();
}

class _ImageFullScreenViewState extends State<ImageFullScreenView> {
  final PageController _controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: AppBarBackButton(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(
              "${index + 1} / ${widget.imagesUrlList.length}",
              style: TextStyle(fontSize: 24, letterSpacing: 8),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                controller: _controller,
                children: images()),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: imageView())
        ],
      ),
    ));
  }

  Widget imageView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.imagesUrlList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _controller.jumpToPage(index);
            },
            child: Container(
                width: 120,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.teal),
                    borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.imagesUrlList[index].toString(),
                    fit: BoxFit.cover,
                  ),
                )),
          );
        });
  }

  List<Widget> images() {
    return List.generate(widget.imagesUrlList.length, (index) {
      return InteractiveViewer(
          transformationController: TransformationController(),
          child: Image.network(widget.imagesUrlList[index].toString()));
    });
  }
}
