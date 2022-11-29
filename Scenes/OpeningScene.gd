extends Node2D

const GameUI = preload("document-building/GameUI.tscn")

func _ready():
	get_node("AnimationPlayer").play("fade")
