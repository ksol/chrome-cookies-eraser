var erase;

chrome.cookies || (chrome.cookies = chrome.experimental.cookies);

erase = function() {
  chrome.cookies.getAll({
    domain: 'localhost'
  }, function(cookies) {
    var cookie, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = cookies.length; _i < _len; _i++) {
      cookie = cookies[_i];
      _results.push(chrome.cookies.remove({
        url: "http://localhost" + cookie.path,
        name: cookie.name
      }));
    }
    return _results;
  });
  return console.log('[CRX cookie-eraser] cookies for localhost erased !');
};

chrome.browserAction.onClicked.addListener(erase);
