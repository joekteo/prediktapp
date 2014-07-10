predikt.controller 'PrivateProfileCtrl', ($scope, $http, $routeParams) ->
  
  $http.get('./api/profile/' ).success (userData) ->
    $scope.profile = userData.users[0]

    betIds = try
      $scope.user.links.bets
    catch
      []

    allBetIds = ''
    if betIds.length > 0
      for bet in betIds
        allBetIds = "#{allBetIds},#{bet}"

      $http.get('./api/bets/#{allBetIds}' ).success (betData) ->
        # console.log betData.bets
        $scope.allBets = betData.bets
        console.log $scope.allBets





  # $http.get('./api/uuids' ).success (uuidData) ->
  #   console.log uuidData

    # $http.put('./api/' ).success ()     




