extends Area2D

var MAX_SPEED: int = 50

func _ready():
	pass


func _process(delta):
	if Input.is_action_pressed("move_up"):
		self.position.y -= MAX_SPEED * delta
	if Input.is_action_pressed("move_down"):
		self.position.y += MAX_SPEED * delta
	if Input.is_action_pressed("move_left"):
		self.position.x -= MAX_SPEED * delta
	if Input.is_action_pressed("move_right"):
		self.position.x += MAX_SPEED * delta
