extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var fullname = "dummy name"
export var age = 0

export var info_dict = {}

const info_format_str = "[color=black][b]{key}:[/b] {value}[/color]\n"

func add_suspect_info(k, v):
	append_bbcode(info_format_str.format({"key": k, "value": v}))

# Called when the node enters the scene tree for the first time.
func _ready():
	bbcode_enabled = true
	add_suspect_info("Name", fullname)
	add_suspect_info("Age", age)
	
	for key in info_dict.keys():
		print(key)
		add_suspect_info(key, info_dict[key])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
