extends Node2D


const SummaryDocument = preload("SummaryDocument/SummaryDocument.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	# testing
	$PanelContainer/VBoxContainer/DocumentViewer.add_child(SummaryDocument.instance())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ArrestButton_button_up():
	get_tree().change_scene("res://Scenes/OpeningScene.tscn")


func _on_IgnoreButton_button_up():
	get_tree().change_scene("res://Scenes/OpeningScene.tscn")
