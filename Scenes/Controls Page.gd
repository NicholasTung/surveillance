extends Node2D

func _ready():
	pass # Replace with function body.


func _on_Return_Button_button_up():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
