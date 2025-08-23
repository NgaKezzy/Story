import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailComic extends StatefulWidget {
  const DetailComic({super.key});

  @override
  State<DetailComic> createState() => _DetailComicState();
}

class _DetailComicState extends State<DetailComic> {
  bool _showBottomContainer = true;
  double _previousOffset = 0;
  final ScrollController _scrollController = ScrollController();

  void _onScroll(ScrollNotification notification) {
    final currentOffset = notification.metrics.pixels;
    final maxScrollExtent = notification.metrics.maxScrollExtent;

    // Bỏ qua nếu ở gần đầu danh sách
    if (currentOffset <= 0 || (currentOffset - _previousOffset).abs() < 5) {
      return;
    }

    // Nếu đã cuộn đến sát cuối danh sách => bỏ qua
    if (currentOffset >= maxScrollExtent - 10) {
      return;
    }

    // Nếu cuộn xuống => ẩn container
    if (currentOffset > _previousOffset + 5) {
      if (_showBottomContainer) {
        setState(() => _showBottomContainer = false);
      }
    }
    // Nếu cuộn lên => hiện container
    else if (currentOffset < _previousOffset - 5) {
      if (!_showBottomContainer) {
        setState(() => _showBottomContainer = true);
      }
    }

    _previousOffset = currentOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          _showBottomContainer ? AppBar(title: Text('Chi tiết truyện')) : null,
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () {
            _showBottomContainer = true;
            setState(() {});
          },
          child: Column(
            children: [
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    _onScroll(scrollNotification);
                    return false;
                  },
                  child: Scrollbar(
                    controller: _scrollController,
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text('Item $index'));
                      },

                      itemCount: 50,
                    ),
                  ),
                ),
              ),
              // Container nổi khi cuộn lên
              // if (_showBottomContainer)
              GestureDetector(
                onTap: () {
                  _scrollController.jumpTo(0);
                },
                child: Container(
                  height: 100,
                  width: ScreenUtil().screenWidth,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text(
                    'Phần Container nổi',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
