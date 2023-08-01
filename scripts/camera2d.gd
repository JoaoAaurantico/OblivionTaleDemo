extends Camera2D

const Dead_Zone = 500
var cameraOrigin: Vector2

func _ready() -> void:
	cameraOrigin = self.position

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var _target = event.position - get_viewport().size * 0.5
#		print(_target)
		if _target.length() < Dead_Zone:
			self.position = cameraOrigin
		else:
			self.position = cameraOrigin + _target.normalized() * 50
