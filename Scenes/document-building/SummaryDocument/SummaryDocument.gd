extends VBoxContainer


const SummaryOverview = preload("components/SummaryOverview.tscn")
const SummaryPhoto = preload("components/SummaryPhoto.tscn")
const SummarySection = preload("components/SummarySection.tscn")

var photo_instance
var overview_instance
var sections_list

func _init(p_photo, p_overview, p_section_list):
	photo_instance = p_photo
	overview_instance = p_overview
	sections_list = p_section_list


# Called when the node enters the scene tree for the first time.
func _ready():
	add_photo(photo_instance)
	add_overview(overview_instance)
	
	for section in sections_list:
		add_child(section)

func add_photo(photo_instance_param):
	$HeaderContainer.add_child(photo_instance_param)


func add_overview(overview_instance_param):
	$HeaderContainer.add_child(overview_instance_param)


func add_section(section_instance_param):
	add_child(section_instance_param)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
