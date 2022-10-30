extends Node2D


const SummaryDocument = preload("SummaryDocument/SummaryDocument.tscn")
onready var doc_viewer = get_node("PanelContainer/VBoxContainer/DocumentViewer")

var current_case = null
var current_case_summary

# Called when the node enters the scene tree for the first time.
func _ready():
	# testing
	current_case = preload("res://Scenes/Cases/day-1/1-1-john-smith.tscn").instance()
	set_case(current_case)
#	print(current_case.get_node("SummaryDocument"))
#	doc_viewer.add_child(current_case.get_node("SummaryDocument"))
#	print("ready finished")



func set_case(case_instance):
	for child in doc_viewer.get_children():
		doc_viewer.remove_child(child)
	
#	if current_case:
#		current_case.queue_free()

#	current_case = case_instance
	current_case_summary = current_case.get_node("SummaryDocument")
	current_case.remove_child(current_case_summary)
	doc_viewer.add_child(current_case_summary)
#	doc_viewer.add_child(current_case)
	print("doiaspghdsap")


func process_case_decision(arrested):
	print(current_case_summary.next_case_scene_path)
	current_case = load(current_case_summary.next_case_scene_path).instance()
	set_case(current_case)
#	pass

func _on_IgnoreButton_button_up():
	process_case_decision(false)
	$TextureProgress.value-=10
	#get_tree().change_scene("res://Scenes/Intro/intro1.tscn")


func _on_ArrestButton_button_up():
	process_case_decision(true)
	$TextureProgress.value+=10
