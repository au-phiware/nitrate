div '.page-header' ->
  h1 'Edit zone'

form '#zone_form', action: path_to.zone zone, method: 'PUT', ->
#- form_for(zone, {action: path_to.zone(zone), method: 'PUT', id: "zone_form"}, function (form) {
  partial 'zones/form', locals: zone: zone
  div '.actions' ->
    input '.btn.primary', type: 'submit', 'Update zone'
    span ' or '
    link_to 'Cancel', path_to.zone zone, class: 'btn'
