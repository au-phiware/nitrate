define 'User', ->
    property 'email', String, index: true
    property 'password', String
    property 'activated', Boolean, default: false

Zone = describe 'Zone', () ->
    property 'origin', String
    property 'ttl', Number
    property 'class', String
