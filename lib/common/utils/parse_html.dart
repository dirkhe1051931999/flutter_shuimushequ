List<String> collectHtmlImageSrc(String html) {
  List<String> arr = [];
  String regexString = r'(<img.*?(?:>|\/>))';
  RegExp regExp = new RegExp(regexString);
  var matches = regExp.allMatches(html).toList();
  // matches.toList();
  for (var i = 0; i < matches.length; i++) {
    String r = r'''(src=[\'\"]?([^\'\"]*)[\'\"]?)''';
    RegExp reg = new RegExp(r);

    var src = reg.allMatches(matches.elementAt(i).group(0)).toList();
    for (var j = 0; j < src.length; j++) {
      arr.add(src
          .elementAt(j)
          .group(0)
          .split('=')[1]
          .replaceAll('"', '')
          .replaceAll("'", ''));
    }
  }
  return arr;
}

List<String> collectHtmlPContent(String html) {
  List<String> arr = [];
  String regexString = r'(<p>(.*?)<\/p>)';
  RegExp regExp = new RegExp(regexString);
  var matches = regExp.allMatches(html).toList();
  // matches.toList();
  for (var i = 0; i < matches.length; i++) {
    var pStr = matches.elementAt(i).group(0);
    arr.add(
      pStr
          .replaceAll('<p>', '')
          .replaceAll("</p>", '')
          .replaceAll('&nbsp;', '')
          .replaceAll(new RegExp(r"<img (.*?)/>"), '')
          .replaceAll(new RegExp(r"class=\w?.+>"), '')
          .replaceAll(new RegExp(r"color=\w?.+>"), '')
          .replaceAll(new RegExp(r"size=\w?.+>"), '')
          .replaceAll(new RegExp(r"(<a (.*?)<\/a>)"), '')
          .replaceAll('购买链接：', '')
          .replaceAll('-', '')
          .replaceAll('<font', '')
          .replaceAll('</font>', '')
          .replaceAll('</b>', '')
          .replaceAll('<b>', ''),
    );
  }
  return arr;
}

List<String> collectHtmlAHref(String html) {
  List<String> arr = [];
  String regexString = r'''(href *= *['"]*(\S+)["'])''';
  RegExp regExp = new RegExp(regexString);
  var matches = regExp.allMatches(html).toList();
  for (var i = 0; i < matches.length; i++) {
    arr.add(matches.elementAt(i).group(2).replaceAll('&amp;', '&'));
  }
  return arr;
}

main(List<String> args) {
  List a = [1];
  a.addAll([1, 2, 3]);
  print(a);
}
