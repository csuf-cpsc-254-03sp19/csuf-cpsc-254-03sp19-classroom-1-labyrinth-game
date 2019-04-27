extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal start_game
signal Shift_63_71
signal Shift_45_53
signal Shift_27_35
signal Shift_9_17
signal Shift_17_9
signal Shift_35_27
signal Shift_53_45
signal Shift_71_63
signal ShiftDown1
signal ShiftDown3
signal ShiftDown5
signal ShiftDown7
signal ShiftDownN1
signal ShiftDownN3
signal ShiftDownN5
signal ShiftDownN7


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

func _on_Shift_17_9_pressed():
	emit_signal("Shift_17_9")

func _on_Shift_35_27_pressed():
	emit_signal("Shift_35_27")

func _on_Shift_53_45_pressed():
	emit_signal("Shift_53_45")

func _on_Shift_71_63_pressed():
	emit_signal("Shift_71_63")


func _on_ShiftDown1_pressed():
	emit_signal("ShiftDown1")


func _on_ShiftDown3_pressed():
	emit_signal("ShiftDown3")


func _on_ShiftDown5_pressed():
	emit_signal("ShiftDown5")


func _on_ShiftDown7_pressed():
	emit_signal("ShiftDown7")

#Notice: Unfortunate name choosen: Here a ShiftDownN(egative)1 means, that a shift down with a shift spread of negative 1 is performed, which results in an shift up.
func _on_ShiftDownN1_pressed():
	emit_signal("ShiftDownN1")


func _on_ShiftDownN3_pressed():
	emit_signal("ShiftDownN3")


func _on_ShiftDownN5_pressed():
	emit_signal("ShiftDownN5")


func _on_ShiftDownN7_pressed():
	emit_signal("ShiftDownN7")
