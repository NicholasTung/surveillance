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
	
	$PanelContainer/VBoxContainer/DecisionCluster/AIPrediction/HBoxContainer/TextureProgress.value = current_case_summary.guilt_pred
	
	# create links to auxillary documents
	add_aux_docs_section()
	
	doc_viewer.add_child(current_case_summary)


func add_aux_docs_section():
	var aux_docs_links = current_case_summary.get_node("VBoxContainer/AuxDocs/LinkContainer")
	var link
	for aux_doc_ref in current_case.get_children():
		link = SummaryAuxDocLink.instance()
		link.link_text = aux_doc_ref.aux_doc_filename
		link.aux_doc_node = aux_doc_ref
		link.connect("pressed", self, "_on_AuxDocLink_pressed", [aux_doc_ref])
		aux_docs_links.add_child(link)
		current_case.remove_child(aux_doc_ref)
	
	current_case_summary.add_child(aux_docs_links)



func process_case_decision(arrested):
	eval_verdict(arrested)
	load_next_case()

func load_next_case():
	if current_case_summary.next_case_scene_path != "":
		current_case = load(current_case_summary.next_case_scene_path).instance()
		set_case()


func eval_verdict(arrested):
	var verdict_alert_node = $PanelContainer/VBoxContainer/VerdictAlert
	if current_case_summary.should_arrest == arrested:
		verdict_alert_node.visible = false
	else:
		# animate this to slide in or something maybe
		verdict_alert_node.text = "MSG: Your decision has been reviewed and has been determined to go against KCPD guidelines."
		verdict_alert_node.visible = true

func _on_AuxDocLink_pressed(aux_doc_ref):
	doc_viewer.add_child(aux_doc_ref)
	doc_viewer.set_tab_title(doc_viewer.get_tab_count(), aux_doc_ref.aux_doc_filename)

func _on_IgnoreButton_button_up():
	process_case_decision(false)
	#get_tree().change_scene("res://Scenes/Intro/intro1.tscn")


func _on_ArrestButton_button_up():
	process_case_decision(true)
