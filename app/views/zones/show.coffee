div '.page-header', ->
  h1 'Details of zone'

div(about=path_to.zone(zone))
  .field(property='origin')= zone.origin
  .field(property='ttl')= zone.ttl
  .field(property='class')= zone.class

div '.actions'
  a '.btn.primary', href: path_to.edit_zone zone, 'Edit' 
  a '.btn.danger', href: path_to.zone zone, data: method: 'delete', remote: true, jsonp: (u) -> location.href = u, 'Delete'
  span ' or '
  link_to 'Back to index', path_to.zones()
