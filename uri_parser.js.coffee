# Chrome tab object returns the url as a string, not a Location
# So here is custom parsing. Heavily inspired from
# http://gunblad3.blogspot.fr/2008/05/uri-url-parsing.html
class UriParser
  _regExp: /^((\w+):\/\/\/?)?((\w+):?(\w+)?@)?([^\/\?:]+):?(\d+)?(\/?[^\?#;\|]+)?([;\|])?([^\?#]+)?\??([^#]+)?#?(\w*)/
  username: ''
  password: ''
  port: ''
  protocol: ''
  host: ''
  pathname: ''
  url: ''
  urlparamseparator: ''
  urlparam: ''
  querystring: {}
  fragment: ''
  results: null

  constructor: (uri) ->
    @parse uri  if uri?

  _getVal: (r, i) ->
    r[i] if r?[i]?

  parse: (uri) ->
    return null unless uri?

    @results           = @_regExp.exec uri
    @url               = @_getVal @results, 0
    @protocol          = @_getVal @results, 2
    @username          = @_getVal @results, 4
    @password          = @_getVal @results, 5
    @host              = @_getVal @results, 6
    @port              = @_getVal @results, 7
    @pathname          = @_getVal @results, 8
    @urlparamseparator = @_getVal @results, 9
    @urlparam          = @_getVal @results, 10
    @querystring       = @_getVal @results, 11
    @fragment          = @_getVal @results, 12

    @results
