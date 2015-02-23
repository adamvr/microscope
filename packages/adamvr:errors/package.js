Package.describe({
  name: 'adamvr:errors',
  version: '0.0.1',
  // Brief, one-line summary of the package.
  summary: 'A pattern to display application errors to the user',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function (api, where) {
  api.versionsFrom('0.9.0');
  api.use(['minimongo', 'mongo-livedata', 'templating', 'coffeescript'], 'client');
  api.addFiles(['errors.coffee', 'errors_list.html', 'errors_list.coffee'], 'client');
  if (api.export) {
    api.export('Errors');
  }
});

Package.onTest(function (api) {
  api.use('adamvr:errors', 'client');
  api.use(['tinytest', 'coffeescript', 'test-helpers'], 'client');
  api.addFiles('errors-tests.coffee', 'client');
});
