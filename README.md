# !! Unmaintained !!

# Chrome extension : quick cookies eraser

I needed a way to quickly delete my localhost cookies without having to go to the settings each time. Then I realized I needed the same thing for non-localhost sites (a staging env, for instance).

So I made a chrome extension that adds a button in the toolbar. Once clicked, the cookies belonging to the current tab domain will be erased. No warning, no confirmation window. One click, and done.

This is mainly a mashup of a the chrome cookie api sample [here](http://developer.chrome.com/extensions/samples.html) and [this stack overflow question](http://stackoverflow.com/questions/6694173/manage-cookies-from-google-chrome-extension). I also used [this code](http://gunblad3.blogspot.fr/2008/05/uri-url-parsing.html) to parse URIs.

## Tests

This is not really tested: I tried it on my laptop, and it worked, so it's good enough for me. The code is pretty short and should be fairly understandable as is.

## Known issues

No handling of subdmain. For instance, facebook cookies are under the domain `facebook.com`, but the webapp always redirect to `www.facebook.com`. Therefore, the cookies will not be erased.

## What's next

If I don't find the time or the need, nothing. Otherwise, support for safari/firefox, maybe better icons, maybe better notifications.

## Contributions

If you want to contribute, do as pleased, and following the classic flow on github : fork, feature branch, pull-request.
Please explain a use-case if you're submitting a feature.

## Licence

See [LICENCE.md](https://github.com/ksol/chrome-cookies-eraser/blob/master/LICENCE.md).

## Changelog

* `1.0`: Same as 0.3. Bumped version number since it looks stable.
* `0.3`: New icons, display a notification after cookies are erased. Changed repository name.
* `0.2`: Button deletes current tab domain cookies
* `0.1`: Toolbar button to delete localhost cookies
