import 'package:flutter/material.dart';

/// @author SumMer
/// @date 2019-06-11 01117:08
/// @Description:搜索控件

class SearchWidget extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SearchWidgetState();
  }

  @override
  Size get preferredSize => null;
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: GestureDetector(
        onTap: () async {
          showSearch(context: context);
        },
        child: new Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          decoration: BoxDecoration(
            color: Colors.white,
            //边角圆度
            borderRadius: BorderRadius.circular(5.0),
          ),
          height: 35,
          padding:
              EdgeInsets.only(left: 2.0, right: 2.0, top: 0.0, bottom: 5.0),
          child: new Center(
            child: FlatButton.icon(
              onPressed: null,
              icon: Icon(Icons.search),
              label: new Text(
                "搜索",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
      preferredSize: Size(0, 50),
    );
  }
}

//显示搜索框
Future showSearch({
  @required BuildContext context,
}) {
  return Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) => new SearchPageRouteWidget()));
}

class SearchPageRouteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new __SearchPageRouteState();
  }
}

class __SearchPageRouteState extends State<SearchPageRouteWidget> {
  String _query;
  final _textKey = GlobalKey<FormFieldState>();
  bool _isVlues;

  @override
  void initState() {
    super.initState();
    this._query = "";
    _isVlues = true;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false, //设置没有返回按钮
        title: new Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              //边角圆度
              borderRadius: new BorderRadius.circular(5.0)),
          //设置最大高度
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 35,
            ),
            //搜索文本框
            child: new TextField(
              key: _textKey,
              autofocus: true,
              controller: TextEditingController.fromValue(TextEditingValue(
                // 设置内容
                  text: this._query,
                  // 保持光标在最后
                  selection: TextSelection.fromPosition(TextPosition(
                      affinity: TextAffinity.downstream,
                      offset: this._query.length)))),
              //修改键盘状态为搜索
              textInputAction: TextInputAction.search,
              onSubmitted: (str) {
                print(str);
                setState(() {
                  this._isVlues = false;
                });
              },
              onChanged: (str) {
                setState(() {
                  this._query = str;
                });
              },
              decoration: InputDecoration(
                //在文本框左侧图标
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                //在文本框右侧图标
                suffixIcon: new GestureDetector(
                  onTap: () {
                    setState(() {
                      _query = "";
                      _isVlues = true;
                    });
                  },
                  child: Icon(
                    _query == "" ? null : Icons.clear,
                    color: Colors.grey,
                  ),
                ),
                //获取焦点时去除边框
                focusedBorder: InputBorder.none,
                // 以下属性可用来去除TextField的边框
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "搜索",
                //内容边距
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              ),
            ),
          ),
        ),
        actions: buildActions(context),
      ),
      body: _isVlues ? buildSuggestions(context) : buildResults(context),
    );
  }

  //点击取消按钮
  List<Widget> buildActions(BuildContext context) {
    return [
      new GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: new Container(
            padding: EdgeInsets.only(right: 15.0),
            alignment: Alignment.center,
            child: new Text(
              "取消",
              style: TextStyle(fontSize: 18.0, color: Colors.blueGrey[600]),
            ),
          ))
    ];
  }

  /// 模拟的假数据
  List searchList = ["lao-老王", "lao-老张", "xiao-小王", "xiao-小张"];

  List recentSuggest = ["马云-1", "马化腾-2"];

  //搜索下拉框提示的方法
  Widget buildSuggestions(BuildContext context) {
    // 定义变量 并进行判断
    final suggestionList = _query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(_query)).toList();
    return new ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: RichText(
              text: TextSpan(
                // 获取搜索框内输入的字符串，设置它的颜色并让让加粗
                text: suggestionList[index].substring(0, _query.length),
                style:
                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    //获取剩下的字符串，并让它变成灰色
                      text: suggestionList[index].substring(_query.length),
                      style: TextStyle(color: Colors.black))
                ],
              ),
            ),
            onTap: () async {
              setState(() {
                _query = suggestionList[index];
                _isVlues = false;
              });
            },
          );
        });
  }

  //搜索结果
  Widget buildResults(BuildContext context) {
    bool result = searchList.contains(_query);
    return result
        ? ListView(
      children: <Widget>[
        new ListTile(
          title: new Text(_query),
          onTap: () async {
            print(_query);
          },
        ),
      ],
    )
        : Center(
      child: Text(
        "未查询到合适条件（$_query）的数据",
      ),
    );
  }
}
