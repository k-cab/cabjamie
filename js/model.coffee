

class Sticker
  constructor: (data) ->
    if data
      Object.keys(data).map (key) =>
        this[key] = data[key]  

  name: 'unnamed sticker'
  colour: 'yellow'

  isColour: (colour) ->
    return @colour == colour.name if colour.name
    @colour == colour.value

  setColour: (colour) ->
    if colour.name
      @colour = colour.name
    else
      @colour = colour.value
  
class Page
  constructor: (data) ->
    if data
      Object.keys(data).map (key)=>
        this[key] = data[key]  
  
  url: 'http://stub-url'

  addSticker: (sticker) ->
    console.log "add sticker #{sticker} to #{this.url}"

    this.stickers = [] unless this.stickers
    this.stickers.push sticker unless _.include this.stickers, sticker

    # $log.info   # TODO factor out as angular module
    console.log { this:this, stickers: this.stickers }

  removeSticker: (sticker) ->
    console.log "remove sticker #{sticker} from #{this.url}"
    this.stickers = this.stickers.filter( (e) -> e.name != sticker.name )
  
  hasSticker: (sticker) ->
    if _.include this.stickers?.map((e) -> e.name), sticker.name
      true
    else
      false


@Sticker = Sticker
@Page = Page