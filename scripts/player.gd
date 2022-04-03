extends Area2D

var MAX_SPEED: int = 50
var TILE_SIZE: int = 16
export var MAX_PLAYER_MOVES: int  = 10
var moves_left: int = 10

func _ready():
	self.position = self.position.snapped(Vector2.ONE * TILE_SIZE)
	self.position += Vector2.ONE * TILE_SIZE/2


func _unhandled_input(event):
	if moves_left <= 0 :
		return
	if event.is_action_pressed("move_up"):
		self.position += Vector2.UP * TILE_SIZE
		moves_left -= 1
	elif event.is_action_pressed("move_down"):
		self.position += Vector2.DOWN * TILE_SIZE
		moves_left -= 1
	elif event.is_action_pressed("move_left"):
		self.position += Vector2.LEFT * TILE_SIZE
		moves_left -= 1
	elif event.is_action_pressed("move_right"):
		self.position += Vector2.RIGHT * TILE_SIZE
		moves_left -= 1
	self.position.x = clamp(self.position.x, TILE_SIZE/2.0, 1048)
	self.position.y = clamp(self.position.y, TILE_SIZE/2.0, 620)

func _process(_delta):
	pass
