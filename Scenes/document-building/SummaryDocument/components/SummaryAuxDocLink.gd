extends LinkButton


# Declare member variables here. Examples:
export var link_text = "link text here"
var aux_doc_node


# Called when the node enters the scene tree for the first time.
func _ready():
	text = link_text


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
