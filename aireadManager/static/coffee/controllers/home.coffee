define ['./base'], (indexCtlModule) ->
  moduleName = 'home'
  console.log('home init')
  indexCtlModule.controller 'homeCtl',
    [
      '$scope'
      ($scope, $http, notificationService) ->
        $scope.pageTitle = 'home'

    ]

  ret =
    group: 'hide'
    item: 'home'
    url: moduleName

  return ret