# Just in case
chrome.cookies ||= chrome.experimental.cookies;

# Main function
erase = (tab) ->
  # Parse tab url, extract protocol & domain
  parsed = new UriParser(tab.url)
  protocol, domain = parsed.protocol, parsed.host

  # Find all cookies for localhost
  chrome.cookies.getAll {domain}, (cookies) ->
    # Remove each cookie
    for cookie in cookies
      chrome.cookies.remove
        url: "#{protocol}://#{domain}#{cookie.path}"
        name: cookie.name

  # Display a warning in the console
  console.log "[CRX cookie-eraser] cookies for #{domain} erased !"

# Event listener
chrome.browserAction.onClicked.addListener ->
  chrome.tabs.getSelected null, (tab) ->
    erase(tab)
