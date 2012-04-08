doctype 5
html ->
  head ->
    meta charset: 'utf-8'

    title @title if @title?
    stylesheet_link_tag 'reset', 'style'
    javascript_include_tag 'https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js', 'rails', 'application'
    csrf_meta_tag()
  body ->
    @body
