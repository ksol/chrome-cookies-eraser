var erase;

chrome.cookies || (chrome.cookies = chrome.experimental.cookies);

erase = function(tab) {
  var domain, parsed, protocol;
  parsed = new UriParser(tab.url);
  protocol = parsed.protocol;
  domain = parsed.host;

  chrome.cookies.getAll({
    domain: domain
  }, function(cookies) {
    var cookie, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = cookies.length; _i < _len; _i++) {
      cookie = cookies[_i];
      _results.push(chrome.cookies.remove({
        url: "" + protocol + "://" + domain + cookie.path,
        name: cookie.name
      }));
    }
    return _results;
  });
  return console.log("[CRX cookie-eraser] cookies for " + domain + " erased !");
};

chrome.browserAction.onClicked.addListener(function() {
  return chrome.tabs.getSelected(null, function(tab) {
    return erase(tab);
  });
});
