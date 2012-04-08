doctype 5
html ->
  head ->
    meta charset: 'utf-8'

#    title @title
#    stylesheet_link_tag 'http://twitter.github.com/bootstrap/1.3.0/bootstrap.min.css'
    csrf_meta_tag()
  body ->
    div '.container', ->
#      flash = (type) ->
#        flash = @request.flash(type).pop
#        if flash?
#          div '.alert-message.'+type, -> flash

#      flash 'info'
#      flash 'error'

      @body

#  javascript_include_tag 'https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js', 'rails', 'application'
