tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("Toast", "Control", preload("toast_script.gd"), preload("icon.png"))
	add_custom_type("Toast Style", "Resource", preload("style_resource/toast_style.gd"), preload("style_resource/icon.svg"))


func _exit_tree():
	remove_custom_type("Toast")
	remove_custom_type("Toast Style")

