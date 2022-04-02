extends Area2D

var MAX_SPEED: int = 50
var TILE_SIZE: int = 16

func _ready():
	self.position = self.position.snapped(Vector2.ONE * TILE_SIZE)
	self.position += Vector2.ONE * TILE_SIZE/2


func _unhandled_input(event):
	if event.is_action_pressed("move_up"):
		self.position += Vector2.UP * TILE_SIZE
	elif event.is_action_pressed("move_down"):
		self.position += Vector2.DOWN * TILE_SIZE
	elif event.is_action_pressed("move_left"):
		self.position += Vector2.LEFT * TILE_SIZE
	elif event.is_action_pressed("move_right"):
		self.position += Vector2.RIGHT * TILE_SIZE

func _process(delta):
	pass
