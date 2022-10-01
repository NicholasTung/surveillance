extends Node2D

const GameUI = preload("document-building/GameUI.tscn")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):s


func _on_AnimationPlayer_animation_finished(anim_name):
	pass
	$MarginContainer/Task.visible = false
	$TextureRect.visible = false
	add_child(GameUI.instance())
