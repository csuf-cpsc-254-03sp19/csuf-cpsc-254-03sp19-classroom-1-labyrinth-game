extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HUD_start_game():
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

