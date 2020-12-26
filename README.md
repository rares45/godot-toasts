# Godot Toasts
A plugin that allows you to make Android like toast on all platforms

## Enable the plugin
Add the addons folder in you project like your would with any other plugin. Go to `project settings -> plugins` and activate the plugin.

##### Using the plugin
Wherever you want to use just paste this:
```
var toast = Toast.new("Toast text", Toast.LENGHT_SHORT)
get_node("/root").add_child(toast)
toast.show()
```

It is best to make the TOAST a child of the root node so that there are no overlapping problems.\
The toast will delete itself after it finished.\
There is no purpose to add the Toast from the editor.

Toast
=====
**Inherits:** Control < CanvasItem < Node < Object

Methods
-------
| Toast | new(text: String, lenght: ToastLenght) |
|-------|----------------------------------------|
| void  | show()                                 |

Enumerations
============

enum `ToastLenght`:\
    LENGHT_SHORT: the toast will last for 1.5 seconds, including the fading\
    LENGHT_LONG: the toast will last for 3 seconds, including the fading

Signals
=======

* `done()`\
    Emitted when the toast has terminated its job and is preparing for deleteing itself.

Methods Descriptions
--------------------

* `Toast new(text: String, lenght: ToastLengh)`\
    Returns a new Toast. The `text` is the text that will be shown inside of the toast. `lenght ` represents the duration lenght.
* `void show()`\
    Starts the toast.
