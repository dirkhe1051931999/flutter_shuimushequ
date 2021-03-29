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
