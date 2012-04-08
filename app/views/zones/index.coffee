div '.page-header', ->
  h1 'Index of zones'
###
for zone in zones
  div '.row', ->
    span '.span-two-thirds', 'zone #' + zone.id
    span '.span-one-third', ->
      link_to 'Edit', path_to.edit_zone zone, class: 'btn primary'
      link_to 'Delete', path_to.zone zone, class: 'btn danger', method: 'delete', remote: true, jsonp: ((u) -> location.href = u)

hr

div '.well', ->
 link_to 'New zone', path_to.new_zone, class: 'btn'
###
