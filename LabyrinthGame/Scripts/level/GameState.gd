# This script serves as a singleton to keep track of what state the game is in

extends Node

var playing = false
var aiMove = false
var aiShift = false
var playerMove = false
var playerShift = false
var aiWin = false
var playerWin = false