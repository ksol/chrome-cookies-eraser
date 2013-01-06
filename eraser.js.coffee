# Just in case
chrome.cookies ||= chrome.experimental.cookies;

# Ensuring notification support
notificationSupport = webkitNotifications?.createNotification?

# Display a notification
displayNotification = (domain) ->
  return unless notificationSupport

  icon = 'icon_48.png'
  title = 'Cookies erased!'
  text = "Cookies for #{domain} erased!"
  notification = webkitNotifications.createNotification(icon, title, text)
  notification.show()

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
  displayNotification(domain)

# Event listener
chrome.browserAction.onClicked.addListener ->
  chrome.tabs.getSelected null, (tab) ->
    erase(tab)
