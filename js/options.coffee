@appModule = angular.module "appModule", ['ui', 'ngResource'], ($routeProvider, $locationProvider) ->
    # routing
    $routeProvider.when "/",
      templateUrl: 'templates/options.html'
      controller: 'AppCntl'

    .otherwise
      redirectTo: "/"


@appModule.controller 'AppCntl', 
  ($scope, $log, $location, $resource,
    userPrefs
  ) ->
    $scope.options = 
      env:
        data: [ 'dev', 'production' ]
        selection: userPrefs.env
      localStorage: 
          data:
            k1: 'v1'
            k2: 'v2'
            toString: ->
              k1 + ": " + k2

          actions:
            [
              name: 'reset all'
              func: -> console.log 'todo'
            ]

    $scope.chooseKeyVal = (key, val) ->
      $log.info 'todo'
      switch key
        when 'env'
          userPrefs.set 'env', val

        # other handling logic here.

      # update the selection.
      $scope.options[key].selection = val

    # show userPrefs data

    # show localstorage
    # actions: clear
    # item actions: clear
