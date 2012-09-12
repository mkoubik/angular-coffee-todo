expect = require('chai').expect
AppCtrl = require '../../../assets/js/controllers/AppCtrl'

testItems = [
	{text: 'Foo', done: true}
	{text: 'Bar', done: false}
	{text: 'Baz', done: false}
]

describe 'AppCtrl', ->
	$scope = {}

	beforeEach ->
		$scope = {}
		AppCtrl($scope)

	describe '$scope.items', ->
		it 'should be empty', ->
			expect($scope.items).to.be.an('array')
			expect($scope.items).to.have.length(0)

	describe 'add()', ->
		it 'should add an item', ->
			newItem =
				text: 'Lorem Ipsum'
			$scope.add newItem
			expect($scope.items).to.have.length(1)
			expect($scope.items[0].text).to.equal('Lorem Ipsum')
			expect($scope.items[0].done).to.be.false

		it 'should clear newItem.text', ->
			newItem =
				text: 'Lorem Ipsum'
			$scope.add newItem
			expect(newItem.text).to.equal('')

	describe 'remaining()', ->
		it 'should return number of items with done: false', ->
			$scope.items = testItems
			expect($scope.remaining()).to.equal(2)

	describe 'archive()', ->
		it 'should remove items with done: true', ->
			$scope.items = testItems
			$scope.archive()
			expect($scope.items).to.have.length(2)
			expect($scope.items[0].text).to.equal('Bar')