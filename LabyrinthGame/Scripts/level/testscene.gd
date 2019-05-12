extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#We disable first the visibility of the buttons, because otherwise they would overlay the welcome screen
	set_visible(false)
	$player/HUD/Shift_27_35.visible = false
	$player/HUD/Shift_45_53.visible = false
	$player/HUD/Shift_63_71.visible = false
	$player/HUD/Shift_9_17.visible = false
	$player/HUD/Shift_17_9.visible = false
	$player/HUD/Shift_71_63.visible = false
	$player/HUD/Shift_53_45.visible = false
	$player/HUD/Shift_35_27.visible = false
	$player/HUD/ShiftDown1.visible = false
	$player/HUD/ShiftDown3.visible = false
	$player/HUD/ShiftDown5.visible = false
	$player/HUD/ShiftDown7.visible = false
	$player/HUD/ShiftDownN1.visible = false
	$player/HUD/ShiftDownN3.visible = false
	$player/HUD/ShiftDownN5.visible = false
	$player/HUD/ShiftDownN7.visible = false



func _on_HUD_start_game():
	#After starting the game, we set the visibility of the shitft buttons to true.
	set_visible(true)
	$player/HUD/Shift_27_35.visible = true
	$player/HUD/Shift_45_53.visible = true
	$player/HUD/Shift_63_71.visible = true
	$player/HUD/Shift_9_17.visible = true
	$player/HUD/Shift_17_9.visible = true
	$player/HUD/Shift_71_63.visible = true
	$player/HUD/Shift_53_45.visible = true
	$player/HUD/Shift_35_27.visible = true
	$player/HUD/ShiftDown1.visible = true
	$player/HUD/ShiftDown3.visible = true
	$player/HUD/ShiftDown5.visible = true
	$player/HUD/ShiftDown7.visible = true
	$player/HUD/ShiftDownN1.visible = true
	$player/HUD/ShiftDownN3.visible = true
	$player/HUD/ShiftDownN5.visible = true
	$player/HUD/ShiftDownN7.visible = true

