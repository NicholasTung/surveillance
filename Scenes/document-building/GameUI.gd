extends Node2D

const SummaryAuxDocLink = preload("SummaryDocument/components/SummaryAuxDocLink.tscn")
onready var doc_viewer = get_node("PanelContainer/VBoxContainer/DocumentViewer")

var current_case = null
var current_case_summary

# Called when the node enters the scene tree for the first time.
func _ready():
	# testing
	current_case = preload("res://Scenes/Cases/day-1/1-1-john-smith.tscn").instance()
	set_case()


func set_case():
	for child in doc_viewer.get_children():
		doc_viewer.remove_child(child)

	current_case_summary = current_case.get_node("SummaryDocument")
	current_case.remove_child(current_case_summary)
	
	# create links to auxillary documents
	var aux_docs_links = current_case_summary.get_node("VBoxContainer/AuxDocs/LinkContainer")
	var link
	for aux_doc_ref in current_case.get_children():
		link = SummaryAuxDocLink.instance()
		link.link_text = aux_doc_ref.name
		link.aux_doc_node = aux_doc_ref
		link.connect("pressed", self, "_on_AuxDocLink_pressed", [aux_doc_ref])
		aux_docs_links.add_child(link)
		current_case.remove_child(aux_doc_ref)
	
	current_case_summary.add_child(aux_docs_links)
	
	doc_viewer.add_child(current_case_summary)


func process_case_decision(arrested):
	if current_case_summary.next_case_scene_path != "":
		current_case = load(current_case_summary.next_case_scene_path).instance()
		set_case()


func _on_AuxDocLink_pressed(aux_doc_ref):
	doc_viewer.add_child(aux_doc_ref)

func _on_IgnoreButton_button_up():
	process_case_decision(false)
	$TextureProgress.value-=10
	#get_tree().change_scene("res://Scenes/Intro/intro1.tscn")


func _on_ArrestButton_button_up():
	process_case_decision(true)
	$TextureProgress.value+=10