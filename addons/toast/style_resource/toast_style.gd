@tool
extends Resource

class_name ToastStyle

enum Position{
	Top,
	Bottom
};

enum Type{
	Float,
	Full
};

@export var position: Position = Position.Bottom;
@export var toastType: Type = Type.Float;

@export var backgroundColor: Color = Color( 1, 1, 1, 0.8);
@export var fontColor: Color = Color( 0.01, 0.01, 0.01, 1);

@export var cornerRadius: int = 20;
@export var contentMarginLeft: float = 20.0;
@export var contentMarginRight: float = 20.0;
@export var contentMarginTop: float = 10.0;
@export var contentMarginBottom: float = 10.0;

@export_enum("Left", "Center", "Right", "Fill") var textAlign: int = 1;
