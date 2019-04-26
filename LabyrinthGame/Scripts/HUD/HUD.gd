extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal start_game
signal Shift_63_71
signal Shift_45_53
signal Shift_27_35
signal Shift_9_17

func _on_StartButton_pressed():
    $StartButton.hide()
    emit_signal("start_game")

func _on_Shift_63_71_pressed():
	emit_signal("Shift_63_71")

func show_message(text):
    $MessageLabel.text = text
    $MessageLabel.show()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Shift_45_53_pressed():
	emit_signal("Shift_45_53")


func _on_Shift_27_35_pressed():
	emit_signal("Shift_27_35")


func _on_Shift_9_17_pressed():
	emit_signal("Shift_9_17")
