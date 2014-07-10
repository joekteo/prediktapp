predikt.controller 'UpcomingMatchesCtrl', ($scope, $http, User) ->
  $http.get('./api/matches?game_started=false&sort=starts_at&recent=10').success (data) ->
    $scope.matches = data.matches
    $scope.profile = null
  # console.log User

  $scope.bet = (id, betType) ->
    User.getUser().then (result) ->
      $scope.profile = result.data.users[0]
      console.log id
      console.log betType
      console.log result
      console.log $scope.profile


  # $scope.bet = (id, betType) ->
  #   User.clickButton().then (placeBet) ->
  #     console.log placeBet
    #   $scope.bet = placeBet.bet_type[0] 
    # if $scope.profile

    #   alert "Placing the bet on #{betType} for #{id}!"
    # else
    #   alert "Please log in to place a bet!"
