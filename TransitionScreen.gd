extends CanvasLayer

func ready() -> void:
	$AnimationPlayer.play("fade_to_black")
	$AnimationPlayer.play("fade_to_normal")


func change_scene(target: String) -> void:
	$AnimationPlayer.play("fade_to_black")
	yield($AnimationPlayer, "animation_changed")
	get_tree().change_scene(target)
	$AnimationPlayer.play("fade_to_normal")
