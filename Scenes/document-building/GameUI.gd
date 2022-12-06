extends Node2D

const SummaryAuxDocLink = preload("SummaryDocument/components/SummaryAuxDocLink.tscn")
onready var doc_viewer = get_node("PanelContainer/VBoxContainer/DocumentViewer")

var current_case = null
var current_case_summary
var score = MoralityScore
var seconds: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	# testing
	current_case = preload("res://Scenes/Cases/extras/doctor.tscn").instance()
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
	else:
		if score.get_score() >= 0:
			get_tree().change_scene("res://End_Scense/Ending_1.tscn")
		else:
			get_tree().change_scene("res://End_Scense/Ending_2.tscn")


func eval_verdict(arrested):
	var verdict_alert_node = $PanelContainer/VBoxContainer/VerdictAlert
	if current_case_summary.should_arrest == arrested:
		score.set_score(score.get_score() + 2)
	else:
		# animate this to slide in or something maybe
		score.set_score(score.get_score() - 3)
	
	if (current_case_summary.guilt_pred >= 50) == arrested:
		verdict_alert_node.visible = false
	else:
		verdict_alert_node.text = "MSG: Your decision has been reviewed and has been determined to go against KCPD guidelines."
		verdict_alert_node.visible = true

func _on_AuxDocLink_pressed(aux_doc_ref):
	doc_viewer.add_child(aux_doc_ref)
	doc_viewer.set_tab_title(doc_viewer.get_tab_count(), aux_doc_ref.aux_doc_filename)

func _on_IgnoreButton_button_up():
	process_case_decision(false)


func _on_ArrestButton_button_up():
	process_case_decision(true)


func _on_Timer_timeout():
	seconds += .25
	if seconds == 2:
		$Label.set_text(str("Time: 9:15 AM"))
	elif seconds == 4:
		$Label.set_text(str("Time: 9:30 AM"))
	elif seconds == 6:
		$Label.set_text(str("Time: 9:45 AM"))
	elif seconds == 8:
		$Label.set_text(str("Time: 10:00 AM"))
	elif seconds == 10:
		$Label.set_text(str("Time: 10:15 AM"))
	elif seconds == 12:
		$Label.set_text(str("Time: 10:30 AM"))
	elif seconds == 14:
		$Label.set_text(str("Time: 10:45 AM"))
	elif seconds == 16:
		$Label.set_text(str("Time: 11:00 AM"))
	elif seconds == 18:
		$Label.set_text(str("Time: 11:15 AM"))
	elif seconds == 20:
		$Label.set_text(str("Time: 11:30 AM"))
	elif seconds == 22:
		$Label.set_text(str("Time: 11:45 AM"))
	elif seconds == 24:
		$Label.set_text(str("Time: 12:00 PM"))
	elif seconds == 26:
		$Label.set_text(str("Time: 12:15 PM"))
	elif seconds == 28:
		$Label.set_text(str("Time: 12:30 PM"))
	elif seconds == 30:
		$Label.set_text(str("Time: 12:45 PM"))
	elif seconds == 32:
		$Label.set_text(str("Time: 1:00 PM"))
	elif seconds == 34:
		$Label.set_text(str("Time: 1:00 PM"))
	elif seconds == 36:
		$Label.set_text(str("Time: 1:15 PM"))
	elif seconds == 38:
		$Label.set_text(str("Time: 1:30 PM"))
	elif seconds == 40:
		$Label.set_text(str("Time: 1:45 PM"))
	elif seconds == 42:
		$Label.set_text(str("Time: 2:00 PM"))
	elif seconds == 44:
		$Label.set_text(str("Time: 2:15 PM"))
	elif seconds == 46:
		$Label.set_text(str("Time: 2:30 PM"))
	elif seconds == 48:
		$Label.set_text(str("Time: 2:45 PM"))
	elif seconds == 50:
		$Label.set_text(str("Time: 3:00 PM"))
	elif seconds == 52:
		$Label.set_text(str("Time: 3:15 PM"))
	elif seconds == 54:
		$Label.set_text(str("Time: 3:30 PM"))
	elif seconds == 56:
		$Label.set_text(str("Time: 3:45 PM"))
	elif seconds == 58:
		$Label.set_text(str("Time: 4:00 PM"))
	elif seconds == 60:
		$Label.set_text(str("Time: 4:15 PM"))
	elif seconds == 62:
		$Label.set_text(str("Time: 4:30 PM"))
	elif seconds == 64:
		$Label.set_text(str("Time: 4:45 PM"))
	elif seconds == 66:
		$Label.set_text(str("Time: 5:00 PM"))
	elif seconds == 68:
		$Label.set_text(str("Time to Leave"))
	elif seconds == 75:
		if score.get_score() >= 0:
			get_tree().change_scene("res://End_Scense/Ending_1.tscn")
		else:
			get_tree().change_scene("res://End_Scense/Ending_2.tscn")
