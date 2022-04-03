extends Area2D

signal update_moves_left_counter(moves_left)

var MAX_SPEED: int = 50
var TILE_SIZE: int = 16
var last_checkpoint: Vector2
export var startposition: Vector2 = Vector2(2,2)

var DIRECTIONS: Dictionary = {
	"move_up": Vector2.UP,
	"move_down": Vector2.DOWN,
	"move_left": Vector2.LEFT,
	"move_right": Vector2.RIGHT
}

onready var ray: RayCast2D = $RayCast2D
export var MAX_PLAYER_MOVES: int  = 10
var moves_left: int


func _ready():
	last_checkpoint = startposition * TILE_SIZE
	set_player_position(last_checkpoint)
	moves_left = MAX_PLAYER_MOVES;
	emit_signal("update_moves_left_counter", moves_left)


func set_player_position(pos:Vector2):
	self.position = pos
	print (self.position)
	self.position = self.position.snapped(Vector2.ONE * TILE_SIZE)
	print (self.position)
	self.position += Vector2.ONE * TILE_SIZE/2
	print (self.position)

func _unhandled_input(event):
	for dir in DIRECTIONS:
		if event.is_action_pressed(dir):
			move(dir)

func _process(_delta):
	pass

func move(dir: String) -> void:
	if hasNoMovesLeft():
		return
	ray.cast_to = DIRECTIONS[dir] * TILE_SIZE
	ray.force_raycast_update()
	if !ray.is_colliding():
		self.position += DIRECTIONS[dir] * TILE_SIZE
		decreas_moves_left()


func _on_Player_body_entered(body: Node) -> void:
	if body.name == "Checkpoints":
		moves_left = MAX_PLAYER_MOVES
		emit_signal("update_moves_left_counter", moves_left)
		print("Charging up, please stand by (this might take a wile...)")
	elif body.name == "Target":
		print("You completed this level successfully!")

func decreas_moves_left():
	moves_left -= 1
	emit_signal("update_moves_left_counter", moves_left)
	if (hasNoMovesLeft()) :
		set_player_position(last_checkpoint)

func hasNoMovesLeft() -> bool:
	return moves_left < 0
