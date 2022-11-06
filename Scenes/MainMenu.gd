extends Node2D

export var mainGameScene: PackedScene

func _on_Start_Game_Button_button_up():
	get_tree().change_scene("res://Scenes/Intro/intro1.tscn")

func _on_Controls_Button_button_up():
	get_tree().change_scene("res://Scenes/Controls Page.tscn")

func _on_Credits_Button_button_up():
	get_tree().change_scene("res://Scenes/Credits Page.tscn")

#https://godotengine.org/qa/554/is-there-a-way-to-close-a-game-using-gdscript
func _on_Quit_button_up():
	get_tree().quit()
func _on_TextureButton_button_up():
	get_node("AnimationPlayer").play("fade")
func _on_Quit_mouse_entered():
	pass
