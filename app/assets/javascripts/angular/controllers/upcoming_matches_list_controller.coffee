predikt.controller 'upcomingMatchesListCtrl', ($scope, $http, User, Bet, Message) ->
  $http.get(
    './api/matches/future?sort=starts_at&recent=10'
  ).success (data) ->
    
    $scope.matches = data.matches
    
    $scope.profile = null
    User.getCurrentUser().then (result) ->
      $scope.profile = result.data.users[0]
      
      $scope.wagerData = [{id: 1, text: "1 coin"}]
      for i in [2..50]
        $scope.wagerData.push {id: i, text: "#{i} coins"}

      $('.wager-select').select2(
        data: $scope.wagerData
      ).select2('val', '1')

    $scope.clickToBet = (matchId, betType, odds, wager) ->
      if $scope.profile
        console.log 'need to place', wager, ' on ', betType, '(odds: ', odds, ') for user ', $scope.profile.id, 'on match id: ', matchId

        Bet.create($scope.profile.id, matchId, betType, odds, wager)
      else
        Message.noty('Please log in to place a bet.', 'error', 700)