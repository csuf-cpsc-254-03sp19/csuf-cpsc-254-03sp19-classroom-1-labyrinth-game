extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal start_game

func _on_StartButton_pressed():
    $StartButton.hide()
    emit_signal("start_game")

func show_message(text):
    $MessageLabel.text = text
    $MessageLabel.show()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
