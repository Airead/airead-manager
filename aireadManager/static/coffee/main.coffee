require.config
#  urlArgs: "v=" +  (new Date()).getTime()
  paths:
    'jQuery': '../bower_components/jquery/dist/jquery'
    'angular': '../lib/angular'
    'angular-route': '../bower_components/angular-route/angular-route'
    'angular-ui': '../bower_components/angular-ui/build/angular-ui'
    'angular-bootstrap': '../bower_components/angular-bootstrap/ui-bootstrap'
    'angular-bootstrap-tpls': '../bower_components/angular-bootstrap/ui-bootstrap-tpls'
    'angular-sanitize': '../lib/angular-sanitize.min'
    'angular-translate': '../lib/angular-translate.min'
    'smart-table': '../lib/Smart-Table.debug'
    'dialogs': '../lib/dialogs'
  shim:
    'jQuery': {'exports': 'jQuery'}
    'angular': {'exports': 'angular'}
    'angular-route': {deps: ['angular']}
    'angular-ui': {deps: ['angular']}
    'angular-bootstrap': {deps: ['angular']}
    'angular-bootstrap-tpls': {deps: ['angular']}
    'angular-sanitize': {deps: ['angular']}
    'angular-translate': {deps: ['angular']}
    'smart-table': {deps: ['angular']}
    'dialogs': {deps: ['angular', 'angular-ui', 'angular-sanitize', 'angular-translate']}

require ['jQuery', 'angular', './routes'], ($, angular) ->
  $ ->
    angular.bootstrap document, ['app']