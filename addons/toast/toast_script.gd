tool
extends Control

class_name Toast

signal done;

enum {
	LENGTH_SHORT,
	LENGTH_LONG
};

var labelText;
var toastDuration;

#Nodes
var label;
var timer;
var animation;

func _init(text: String = "", duration:= LENGTH_SHORT):
	labelText = text;
	toastDuration = duration;

func _ready():
	#Setting itself
	visible = false;
	set_anchors_and_margins_preset(Control.PRESET_WIDE);

	#Setting the label
	label = Label.new();
	label.add_stylebox_override("normal", load("res://addons/toast/toast_style.tres"));
	label.set("custom_colors/font_color", Color( 0, 0, 0, 1 ));
	label.text = labelText;
	label.anchor_bottom = 1.0;
	label.anchor_top = 1.0;
	label.anchor_left = 0.5;
	label.anchor_right = 0.5;
	label.margin_bottom = -60;
	label.grow_horizontal = 2;
	label.grow_vertical = 0;
	label.align = 1;
	add_child(label);

	#Setting the timer
	timer = Timer.new();
	timer.one_shot = true;
	match toastDuration:
		LENGTH_SHORT:
			timer.wait_time = 0.5;
		LENGTH_LONG:
			timer.wait_time = 2;
	add_child(timer)

	#Setting the animation
	animation = AnimationPlayer.new();
	animation.add_animation("start", load("res://addons/toast/animations/start.anim"));
	animation.add_animation("end", load("res://addons/toast/animations/end.anim"));
	add_child(animation);


func show():
	animation.play("start");
# warning-ignore:return_value_discarded
	animation.connect("animation_finished", self, "_animationEnded", ["startAnimation"]);
	visible = true;

func _animationEnded(_a, whichAnimation): #_a ignores the argument passed from the animation player
	if whichAnimation == "startAnimation":
		timer.start();
# warning-ignore:return_value_discarded
		timer.connect("timeout", self, "_animationEnded", [null, "endAnimation"]);
	elif whichAnimation == "endAnimation":
		animation.play("end");
# warning-ignore:return_value_discarded
		animation.disconnect("animation_finished", self, "_animationEnded");
		animation.connect("animation_finished", self, "_done");

func _done(_a):
	animation.remove_animation("start")
	queue_free();
	emit_signal("done");

