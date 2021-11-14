# Godot Toasts
A plugin that allows you to make Android like toast on all platforms

## Enable the plugin
Add the addons folder in you project like your would with any other plugin. Go to `project settings -> plugins` and activate the plugin.

##### Using the plugin
Wherever you want to use just paste this:
```
var toast = Toast.new("Toast text", Toast.LENGTH_SHORT)
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
| Toast | new(text: String, length: ToastLenght, mstyle: ToastStyle = `preload( "style_resource/default.tres")` ) |
|-|-|
| void | show() |


Properties
----------

| Resource | style |
|----------|-------|

Enumerations
============

enum `ToastLenght`:\
    LENGTH_SHORT: the toast will last for 1.5 seconds, including the fading\
    LENGTH_LONG: the toast will last for 3 seconds, including the fading

Signals
=======

* `done()`\
    Emitted when the toast has terminated its job and is preparing for deleteing itself.

Property Descriptions
---------------------
* `Resource` style \
    Controls the toast aspect. The value is declared as a Resource, even if there is a custom resource because of a Godot limitation. Will be changed in Godot 4.0.[(see this)](https://github.com/godotengine/godot/issues/6763#issuecomment-629650708)

Methods Descriptions
--------------------

* `Toast new(text: String, length: ToastLenght)`\
    Returns a new Toast. The `text` is the text that will be shown inside of the toast. `length ` represents the duration length. `mstyle` represents the toast syle stored in style(see propriety descriptions).
* `void show()`\
    Starts the toast.

ToastStyle
=====
**Inherits:** Reference < Object

A resource that controls the toast aspect. You can create one in the inspector panel and save it as tres or res.
Recomandation: If you select Full Type make corner radius 0;