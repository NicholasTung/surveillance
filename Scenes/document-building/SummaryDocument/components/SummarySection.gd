extends RichTextLabel


# Declare member variables here. Examples:
export var title: String
export var body: String

const title_format_str = "[color=black][b]%s[/b][/color]\n\n"
const body_format_str = "[color=black]%s[/color]\n"

# Called when the node enters the scene tree for the first time.
func _ready():
	bbcode_enabled = true
	append_bbcode(title_format_str % title)
	append_bbcode(body_format_str % body)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
