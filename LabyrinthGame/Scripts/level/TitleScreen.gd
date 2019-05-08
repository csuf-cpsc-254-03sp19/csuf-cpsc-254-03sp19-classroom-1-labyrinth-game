extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()


func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()


func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/testscene.tscn")
