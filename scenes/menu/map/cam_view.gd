extends Camera2D

var ZoomSpd: float = 0.05
var MinZoom: float = 0.35
var MaxZoom: float = 2.0
var DragSen: float = 1.0

func _input(event):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position -= event.relative * DragSen / zoom
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom += Vector2(ZoomSpd, ZoomSpd)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom -= Vector2(ZoomSpd, ZoomSpd)
		zoom = clamp(zoom, Vector2(MinZoom, MinZoom), Vector2(MaxZoom, MaxZoom))
