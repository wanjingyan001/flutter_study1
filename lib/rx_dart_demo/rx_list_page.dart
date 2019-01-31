import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study1/rx_dart_demo/commodity_bloc.dart';
import 'package:study1/rx_dart_demo/move_bean.dart';
import 'package:study1/rx_dart_demo/request_state.dart';

class RxDartListPage extends StatefulWidget {
  static const String routeName = '/RxDartListPage';
  @override
  _RxDartListState createState() => _RxDartListState();
}

class _RxDartListState extends State<RxDartListPage> {
  final CommodityBloc _bloc = CommodityBloc();
  bool _showSearch = false;
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RequestState>(
      stream: _bloc.data,
      initialData: RequestInitial(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final state = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            leading: _showSearch
                ? IconButton(
                    icon: Icon(Icons.dehaze),
                    onPressed: () {
                      setState(() {
                        _showSearch = false;
                      });
                    })
                : null,
            title: _showSearch
                ? TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '请输入搜索关键字',
                    ),
                    textInputAction: TextInputAction.search,
                    onChanged: _bloc.searchKey.add,
                    controller: _controller,
                  )
                : Text('RxDart测试'),
            actions: <Widget>[
              _showSearch
                  ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _controller.clear();
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          _showSearch = true;
                        });
                      })
            ],
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(RequestState state) {
    if (state is RequestError) {
      return GestureDetector(
        onTap: () {
          _bloc.searchKey.add('');
        },
        child: Center(
          child: Text('请求错误，请重试'),
        ),
      );
    } else if (state is RequestEmpty) {
      return Center(child: Text('暂无数据'));
    } else if (state is RequestInitial) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is RequestPopulated<MoveBean>) {
      var data = state.resultData.result;
      return SmartRefresher(
        child: StaggeredGridView.builder(
            gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(2, index.isEven ? 3 : 2);
                }),
            itemBuilder: (context, index) {
              return _buildItem(data[index]);
            }),
      );
    } else {
      return Center(
        child: Text('Error'),
      );
    }
  }

  Widget _buildItem(MoveResult bean) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Image.network(bean.poster)),
          Text(
            bean.title,
            style: TextStyle(color: Colors.black54, fontSize: 18),
          )
        ],
      ),
    );
  }
}
