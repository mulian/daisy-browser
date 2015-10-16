View = require './view'
$ = jQuery = require 'jquery'
FavTitle = require('favicon');

module.exports =
class App extends View
  # * options{Object}:
  #   * src {String}: Is the Url and necessary!
  #   * reUse {Boolean}: If you call this src again, use the first used source. Even if the Url has changed.
  #   * withPlugins{boolean}: Use Plugins
  constructor: ({@src,@withPlugins=true,@reUse=true,@nodeintegration=false}) ->
    @setId()
    @firstSrc=@src
    super

  setId: (preId=@src) ->
    preId=preId.replace /:/g,'_'
    preId=preId.replace /\//g,'-'
    preId=preId.replace /&/g,'-'
    preId=preId.replace /\?/g,'_'
    preId=preId.replace /\=/g,'_'
    preId=preId.replace /\./g,'-'
    @id = "app_#{preId}"

  initialize: ->
    @getOrCreateElement()
    @createEntry()
    @dom.addEventListener 'did-finish-load', @afterPageLoad

  afterPageLoad: (event) =>
    @changeUrl @dom.getUrl()
    @changeName @dom.getTitle()

  getSrcId: ->
    if @reUse
      return @firstSrc
    else return @url

  changeName: (name=@name) ->
    @name = name
    @entryName.text @name
  changeUrl: (url) ->
    @changeId()
    @url = url
    @setFavIcon url
  changeId: (preId=@src,force=false) ->
    if not @reUse or force
      @setId preId
      @element.attr 'id',@id

  setFavIcon: (src=@src) ->
    FavTitle src, (err, favicon_url,title) =>
      # console.log @favIcon
      if @entry?
        # @entryName.text title if title.length>0
        if not @favIcon?
          @favIcon = $ '<img />', {} =
            src: favicon_url
          @entry.prepend @favIcon
        else
          @favIcon.attr 'src', favicon_url


  createEntry: ->
    @entry = $('<li />')
    if @favIcon?
      fav = $ '<img />', {} =
        src: @favIcon
    @entryName = $ '<span />', {} =
      text: @name

    @entry.append fav
    @entry.append @entryName
    @entry.click =>
      window.eventbus.fire "AppManager",'changeApp',@

  #search for app or create if not exist
  getOrCreateElement: ->
    @element = $ "##{@id}"
    if not @element[0]? #if there is no with app id on dom
      @element = $ "<webview />", {} =
        id : @id
        class : "app"
        src : @src
        preload: @getPreload() if @getPreload?
      $('body').prepend @element #add to Dom
    else #check src, class
      @element.attr('preload',@getPreload()) if @getPreload?
      @element.attr('src',@src) if not @element.attr('src')?
      @element.addClass 'app' if not @element.hasClass 'app'
    @element.attr('plugins','') if @withPlugins
    @element.attr('nodeintegration','') if @nodeintegration
    @dom = @element[0]
