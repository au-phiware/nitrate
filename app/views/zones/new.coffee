div '.page-header', ->
  h1 'New zone'
form '#zone_form', action: path_to.zones(), method: 'POST', ->
#form_for @zone, {action: path_to.zones(), method: 'POST', id: "zone_form"}, (form) ->
  partial 'zones/form', locals: zone: zone
  #partial('zones/form', {locals: {form: form, zone: zone}})
  div '.actions', ->
    input '.btn', type: 'submit', 'Create zone'
    span ' or '
    link_to 'Cancel', path_to.zones(), class: 'btn'
