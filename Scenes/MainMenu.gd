extends Node2D

export var mainGameScene: PackedScene

func _on_Start_Game_Button_button_up():
	get_tree().change_scene("res://Scenes/Intro/intro1.tscn")

func _on_Controls_Button_button_up():
	get_tree().change_scene("res://Scenes/Controls Page.tscn")

func _on_Credits_Button_button_up():
	get_tree().change_scene("res://Scenes/Credits Page.tscn")
