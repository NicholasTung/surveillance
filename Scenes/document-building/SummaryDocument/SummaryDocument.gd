extends VBoxContainer


const SummaryOverview = preload("components/SummaryOverview.tscn")
const SummaryPhoto = preload("components/SummaryPhoto.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	# testing
	add_child(SummaryOverview.instance())
	add_child(SummaryPhoto.instance())
	queue_sort()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
