
String textLimiter({String text="", limit=0, overflowText="..."}){

  if (limit >= text.length) {
    return text;
  }
  return text.replaceRange(limit, text.length, overflowText);
}