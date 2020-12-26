tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("Toast", "Control", preload("toast_script.gd"), preload("icon.png"))


func _exit_tree():
	remove_custom_type("Toast")