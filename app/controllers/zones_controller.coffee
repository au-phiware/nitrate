load 'application'

before 'load zone', ->
    Zone.find params.id, (err, zone) =>
        if err
            redirect path_to.zones()
        else
            @zone = zone
            next()
, only: ['show', 'edit', 'update', 'destroy']

action 'new', ->
    @zone = new Zone
    @title = 'New zone'
    render @actionName

action 'create', ->
    Zone.create body.Zone, (err, zone) =>
        if err
            flash 'error', 'Zone can not be created'
            @zone = zone
            @title = 'New zone'
            render 'new'
        else
            flash 'info', 'Zone created'
            redirect path_to.zones()

action 'index', ->
    unless (Zone.all (err, zones) =>
        @zones = zones
        @title = 'Zones index'
        render @actionName
    )?
        render @actionName

action 'show', ->
    @title = 'Zone show'
    render @actionName

action 'edit', ->
    @title = 'Zone edit'
    render @actionName

action 'update', ->
    @zone.updateAttributes body.Zone, (err) =>
        if !err
            flash 'info', 'Zone updated'
            redirect path_to.zone(@zone)
        else
            flash 'error', 'Zone can not be updated'
            @title = 'Edit zone details'
            render 'edit'

action 'destroy', ->
    @zone.destroy (error) ->
        if error
            flash 'error', 'Can not destroy zone'
        else
            flash 'info', 'Zone successfully removed'
        send "'" + path_to.zones() + "'"

