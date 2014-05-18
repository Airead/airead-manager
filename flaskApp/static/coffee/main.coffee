require.config
  # urlArgs: "v=" +  (new Date()).getTime()
  paths:
    'jQuery': '../bower_components/jquery/dist/jquery'
    'angular': '../bower_components/angular/angular'
    'angular-route': '../bower_components/angular-route/angular-route'
    'angular-ui': '../bower_components/angular-ui/build/angular-ui'
    'angular-bootstrap': '../bower_components/angular-bootstrap/ui-bootstrap'
    'angular-bootstrap-tpls': '../bower_components/angular-bootstrap/ui-bootstrap-tpls'
    'smart-table': '../bower_components/smart-table/Smart-Table.min'
  shim:
    'jQuery': {'exports': 'jQuery'}
    'angular': {'exports': 'angular'}
    'angular-route': {deps: ['angular']}
    'angular-ui': {deps: ['angular']}
    'angular-bootstrap': {deps: ['angular']}
    'angular-bootstrap-tpls': {deps: ['angular']}
    'smart-table': {deps: ['angular']}

require ['jQuery', 'angular', './routes'], ($, angular) ->
  $ ->
    angular.bootstrap document, ['app']