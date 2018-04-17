if (props.footer) {
  footer = React.createElement("div", { className: prefixCls + '-footer', ref: "footer" }, props.footer);
}
var header = void 0;
if (props.title) {
  header = React.createElement("div", { className: prefixCls + '-header', ref: "header" }, React.createElement("div", { className: prefixCls + '-title', id: _this.titleId }, props.title));
}
