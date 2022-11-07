extends ScrollContainer

export var next_case_scene_path = ""
export var guilt_pred = 50
export var should_arrest = false


# Called when the node enters the scene tree for the first time.
func _ready():
#	add_photo(photo_instance)
#	add_overview(overview_instance)
	pass


func add_photo(photo_instance_param):
	$VBoxContainer/HeaderContainer.add_child(photo_instance_param)


func add_overview(overview_instance_param):
	$VBoxContainer/HeaderContainer.add_child(overview_instance_param)


func add_section(section_instance_param):
	$VBoxContainer.add_child(section_instance_param)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
