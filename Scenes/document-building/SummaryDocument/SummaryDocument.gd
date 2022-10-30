extends ScrollContainer


const SummaryOverview = preload("components/SummaryOverview.tscn")
const SummaryPhoto = preload("components/SummaryPhoto.tscn")
const SummarySection = preload("components/SummarySection.tscn")

var photo_instance
var overview_instance
var sections_list = []
export var next_case_scene_path = "default value"

#func _init(p_photo, p_overview, p_section_list, p_next_case_path):
#	photo_instance = p_photo
#	overview_instance = p_overview
#	sections_list = p_section_list
#	next_case_scene_path = p_next_case_path


# Called when the node enters the scene tree for the first time.
func _ready():
#	add_photo(photo_instance)
#	add_overview(overview_instance)

	for section in sections_list:
		add_section(section)

func add_photo(photo_instance_param):
	$VBoxContainer/HeaderContainer.add_child(photo_instance_param)


func add_overview(overview_instance_param):
	$VBoxContainer/HeaderContainer.add_child(overview_instance_param)


func add_section(section_instance_param):
	$VBoxContainer.add_child(section_instance_param)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
