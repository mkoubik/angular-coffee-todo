todoApp = angular.module 'todoApp', ['ngResource']

todoApp.controller 'AppCtrl', ($scope) ->
	$scope.items = []

	$scope.add = (newItem) ->
		item =
			text: newItem.text
			done: false
		$scope.items.push item
		newItem.text = ''

	$scope.remaining = ->
		$scope.items.reduce (count, item) ->
			if item.done then count else count + 1
		, 0

	$scope.archive = ->
		$scope.items = $scope.items.filter (item) -> !item.done
