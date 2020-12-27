extends Node

var toast;

func _ready():
	toast = Toast.new("This is a toast", Toast.LENGTH_SHORT)
	call_deferred("showToast")

func showToast():
	get_node("/root").add_child(toast)
	toast.show()
