extends Node2D

const GameUI = preload("document-building/GameUI.tscn")

func _ready():
	pass # Replace with function body.

func _on_AnimationPlayer_animation_finished(anim_name):
	pass
	$MarginContainer/Task.visible = false
	$TextureRect.visible = false
	add_child(GameUI.instance())