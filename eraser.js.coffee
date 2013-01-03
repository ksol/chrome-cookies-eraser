# Just in case
chrome.cookies ||= chrome.experimental.cookies;

# Main function
erase = ->
  # Find all cookies for localhost
  chrome.cookies.getAll {domain: 'localhost'}, (cookies) ->
    # Remove each cookie
    for cookie in cookies
      chrome.cookies.remove
        url: "http://localhost#{cookie.path}"
        name: cookie.name

  # Display a warning in the console
  console.log '[CRX cookie-eraser] cookies for localhost erased !'

# Event listenet
chrome.browserAction.onClicked.addListener erase 
