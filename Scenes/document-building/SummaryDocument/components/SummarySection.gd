extends RichTextLabel


# Declare member variables here. Examples:
var title
var body

const title_format_str = "[color=black][b]%s[/b][/color]\n\n"
const body_format_str = "[color=black]%s[/color]\n"

func _init(p_title = "Title of section\n\n", p_body = "This is the body of a section of the summary document"):
	title = p_title
	body = p_body
	
	bbcode_enabled = true


# Called when the node enters the scene tree for the first time.
func _ready():
	append_bbcode(title_format_str % title)
	append_bbcode(body_format_str % body)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
