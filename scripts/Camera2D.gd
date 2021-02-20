extends Camera2D

onready var zoomfactor = 1 #насколько далеко отдаляетя камера
onready var zoomspeed = 20 #насколько быстро приближается камера
onready var zoomstep = 0.03 #чувствительность приближения
onready var factorstep = 0.01

func _ready():
	pass 
	
func _process(delta):
	zoom.x = lerp(zoom.x, zoomfactor * zoom.x, zoomspeed * delta)
	zoom.y = lerp(zoom.y, zoomfactor * zoom.y, zoomspeed * delta)
	
	zoom.x = clamp(zoom.x, 0.5, 2) #ограничиваем зум.х от 0.5 до 2
	zoom.y = clamp(zoom.y, 0.5, 2) #ограничиваем зум.у от 0.5 до 2
	
	if zoomfactor > 1:
		zoomfactor -= factorstep
	elif zoomfactor < 1:
		zoomfactor += factorstep
	
func _input(event):
	
	if event is InputEventMouseButton:
		
		if event.button_index == BUTTON_WHEEL_UP:
			zoomfactor -= zoomstep
		
		elif event.button_index == BUTTON_WHEEL_DOWN:
			zoomfactor += zoomstep


