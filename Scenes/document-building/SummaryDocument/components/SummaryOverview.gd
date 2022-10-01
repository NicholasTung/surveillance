extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var fullname
var age

const info_format_str = "[b]{key}:[/b] {value}\n"

func _init(p_fullname = "dummy name", p_age = 0):
	fullname = p_fullname
	age = p_age
	
	bbcode_enabled = true

func add_suspect_info(k, v):
	append_bbcode(info_format_str.format({"key": k, "value": v}))

# Called when the node enters the scene tree for the first time.
func _ready():
	add_suspect_info("Name", fullname)
	add_suspect_info("Age", age)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
