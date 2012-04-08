require('../test_helper.js').controller('zones', module.exports);

var sinon  = require('sinon');

function ValidAttributes () {
    return {
        origin: '',
        ttl: '',
        class: ''
    };
}

exports['zones controller'] = {

    'GET new': function (test) {
        test.get('/zones/new', function () {
            test.success();
            test.render('new');
            test.render('form.' + app.set('view engine'));
            test.done();
        });
    },

    'GET index': function (test) {
        test.get('/zones', function () {
            test.success();
            test.render('index');
            test.done();
        });
    },

    'GET edit': function (test) {
        var find = Zone.find;
        Zone.find = sinon.spy(function (id, callback) {
            callback(null, new Zone);
        });
        test.get('/zones/42/edit', function () {
            test.ok(Zone.find.calledWith('42'));
            Zone.find = find;
            test.success();
            test.render('edit');
            test.done();
        });
    },

    'GET show': function (test) {
        var find = Zone.find;
        Zone.find = sinon.spy(function (id, callback) {
            callback(null, new Zone);
        });
        test.get('/zones/42', function (req, res) {
            test.ok(Zone.find.calledWith('42'));
            Zone.find = find;
            test.success();
            test.render('show');
            test.done();
        });
    },

    'POST create': function (test) {
        var zone = new ValidAttributes;
        var create = Zone.create;
        Zone.create = sinon.spy(function (data, callback) {
            test.strictEqual(data, zone);
            callback(null, zone);
        });
        test.post('/zones', {Zone: zone}, function () {
            test.redirect('/zones');
            test.flash('info');
            test.done();
        });
    },

    'POST create fail': function (test) {
        var zone = new ValidAttributes;
        var create = Zone.create;
        Zone.create = sinon.spy(function (data, callback) {
            test.strictEqual(data, zone);
            callback(new Error, null);
        });
        test.post('/zones', {Zone: zone}, function () {
            test.success();
            test.render('new');
            test.flash('error');
            test.done();
        });
    },

    'PUT update': function (test) {
        Zone.find = sinon.spy(function (id, callback) {
            test.equal(id, 1);
            callback(null, {id: 1, updateAttributes: function (data, cb) { cb(null); }});
        });
        test.put('/zones/1', new ValidAttributes, function () {
            test.redirect('/zones/1');
            test.flash('info');
            test.done();
        });
    },

    'PUT update fail': function (test) {
        Zone.find = sinon.spy(function (id, callback) {
            test.equal(id, 1);
            callback(null, {id: 1, updateAttributes: function (data, cb) { cb(new Error); }});
        });
        test.put('/zones/1', new ValidAttributes, function () {
            test.success();
            test.render('edit');
            test.flash('error');
            test.done();
        });
    },

    'DELETE destroy': function (test) {
        test.done();
    },

    'DELETE destroy fail': function (test) {
        test.done();
    }
};

