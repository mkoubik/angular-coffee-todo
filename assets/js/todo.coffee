#= require_tree controllers

todoApp = angular.module 'todoApp', ['ngResource']
todoApp.controller 'AppCtrl', window.todoApp.AppCtrl