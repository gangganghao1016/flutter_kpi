import 'package:flutter/material.dart';
import 'package:flutter_kpi/common/common.dart';
import 'package:flutter_kpi/res/index.dart';
import 'package:flutter_kpi/utils/utils.dart';

class RoundCircleButton extends StatelessWidget {
  const RoundCircleButton({
    Key key,
    this.width,
    this.height = 48,
    this.margin,
    this.radius,
    this.bgColor,
    this.highlightColor,
    this.splashColor,
    this.child,
    this.text,
    this.style,
    this.onPressed,
  }) : super(key: key);

  final double width;
  final double height;

  /// Empty space to surround the [decoration] and [child].
  final EdgeInsetsGeometry margin;

  final double radius;
  final Color bgColor;
  final Color highlightColor;
  final Color splashColor;

  final Widget child;

  final String text;
  final TextStyle style;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Color _bgColor = bgColor ?? Theme.of(context).primaryColor;
    BorderRadius _borderRadius = BorderRadius.circular(radius ?? (height / 2));
    return new Container(
      width: width,
      height: height,
      margin: margin,
      child: new Material(
        borderRadius: _borderRadius,
        color: _bgColor,
        child: new InkWell(
          borderRadius: _borderRadius,
          onTap: () => onPressed(),
          child: child ??
              new Center(
                child: new Text(
                  text,
                  style:
                      style ?? new TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key key,
    this.text: "",
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      textColor: Colors.white,
      color: Colours.app_main,
      disabledTextColor: Colours.button_text_disabled,
      disabledColor: Colours.button_bg_disabled,
//      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          Container(
            height: 48,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(fontSize: Dimens.font_sp18),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginItemView extends StatelessWidget {
  const LoginItemView(
      {this.controller,
      this.prefixIcon,
      this.hintText,
      Key key,
      this.obscureText = false})
      : super(key: key);
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController controller;

  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new IconButton(
            iconSize: 28,
            icon: new Icon(
              prefixIcon,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {}),
        Gaps.hGap30,
        new Expanded(
          child:
          new TextField(
              obscureText: obscureText,
              controller: controller,
              style: new TextStyle(color: Colours.gray_33, fontSize: 16),
              decoration: new InputDecoration(
                hintText: hintText,
                hintStyle: new TextStyle(color: Colours.gray_99, fontSize: 16),
//                suffixIcon: hasSuffixIcon
//                    ? new IconButton(
//                    icon: new Icon(
//                      _obscureText ? Icons.visibility : Icons.visibility_off,
//                      color: Colours.gray_66,
//                    ),
//                    onPressed: () {
//                      setState(() {
//                        _obscureText = !_obscureText;
//                      });
//                    })
//                    : null,
                focusedBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colours.app_main)),
                enabledBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colours.green_de)),
              ))
//          new MyTextField(
//            obscureText: obscureText,
//            controller: controller,
//            hintText: hintText,
//            hasSuffixIcon: hasSuffixIcon,
//          ),
        ),
      ],
    );
  }
}

class MyTextField extends StatefulWidget {
  const MyTextField(
      {Key key,
      this.obscureText,
      this.controller,
      this.hintText,
      this.hasSuffixIcon})
      : super(key: key);
  final bool obscureText;
  final bool hasSuffixIcon;
  final String hintText;
  final TextEditingController controller;

  @override
  State<StatefulWidget> createState() {
    return MyTextFieldState();
  }
}

class MyTextFieldState extends State<MyTextField> {
  bool _obscureText;
  TextEditingController controller;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    controller=widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return new TextField(
        obscureText: _obscureText,
        controller: controller,
        style: new TextStyle(color: Colours.gray_33, fontSize: 16),
        decoration: new InputDecoration(
          hintText: widget.hintText,
          hintStyle: new TextStyle(color: Colours.gray_99, fontSize: 16),
          suffixIcon: widget.hasSuffixIcon
              ? new IconButton(
                  icon: new Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colours.gray_66,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  })
              : null,
          focusedBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colours.app_main)),
          enabledBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colours.green_de)),
        ));
  }
}

class LoginItem extends StatefulWidget {
  const LoginItem({
    Key key,
    this.prefixIcon,
    this.hasSuffixIcon = false,
    this.hintText,
    this.controller,
  }) : super(key: key);

  final IconData prefixIcon;
  final bool hasSuffixIcon;
  final String hintText;
  final TextEditingController controller;

  @override
  State<StatefulWidget> createState() {
    return LoginItemState();
  }
}

class LoginItemState extends State<LoginItem> {
  bool _obscureText;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.hasSuffixIcon;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new IconButton(
            iconSize: 28,
            icon: new Icon(
              widget.prefixIcon,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {}),
        Gaps.hGap30,
        new Expanded(
          child: new TextField(
              obscureText: _obscureText,
              controller: widget.controller,
              style: new TextStyle(color: Colours.gray_33, fontSize: 16),
              decoration: new InputDecoration(
                hintText: widget.hintText,
                hintStyle: new TextStyle(color: Colours.gray_99, fontSize: 16),
                suffixIcon: widget.hasSuffixIcon
                    ? new IconButton(
                        icon: new Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colours.gray_66,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        })
                    : null,
                focusedBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colours.app_main)),
                enabledBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colours.green_de)),
              )),
        ),
      ],
    );
  }
}

class StatusViews extends StatelessWidget {
  const StatusViews(this.status, {Key key, this.onTap}) : super(key: key);
  final int status;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case LoadStatus.fail:
        return new Container(
          width: double.infinity,
          child: new Material(
            color: Colors.white,
            child: new InkWell(
              onTap: () {
                onTap();
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    Util.getImgPath("ic_network_error"),
                    package: BaseConstant.package_base,
                    width: 100,
                    height: 100,
                  ),
                  Gaps.vGap10,
                  new Text(
                    "网络出问题了～ 请您查看网络设置",
                    style: TextStyles.listContent,
                  ),
                  Gaps.vGap5,
                  new Text(
                    "点击屏幕，重新加载",
                    style: TextStyles.listContent,
                  ),
                ],
              ),
            ),
          ),
        );
        break;
      case LoadStatus.loading:
        return new Container(
          alignment: Alignment.center,
          color: Colours.gray_f0,
          child: new ProgressView(),
        );
        break;
      case LoadStatus.empty:
        return new Container(
          color: Colors.white,
          width: double.infinity,
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  Util.getImgPath("ic_data_empty"),
                  package: BaseConstant.package_base,
                  width: 60,
                  height: 60,
                ),
                Gaps.vGap10,
                new Text(
                  "空空如也～",
                  style: TextStyles.listContent2,
                ),
              ],
            ),
          ),
        );
        break;
      default:
        return Container();
        break;
    }
  }
}

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new SizedBox(
        width: 24.0,
        height: 24.0,
        child: new CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
