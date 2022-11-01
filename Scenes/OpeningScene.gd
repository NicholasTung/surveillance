extends Node2D

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):s
<<<<<<< Updated upstream
=======


func _on_AnimationPlayer_animation_finished(anim_name):
	pass
	$MarginContainer/Task.visible = false
	$TextureRect.visible = false
	add_child(GameUI.instance())


func _on_Button_button_up():
	get_tree().change_scene("res://Scenes/document-building/GameUI.tscn")
>>>>>>> Stashed changes
