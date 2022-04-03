extends Area2D

var MAX_SPEED: int = 50
var TILE_SIZE: int = 16
var DIRECTIONS: Dictionary = {
	"move_up": Vector2.UP,
	"move_down": Vector2.DOWN,
	"move_left": Vector2.LEFT,
	"move_right": Vector2.RIGHT
}

onready var ray: RayCast2D = $RayCast2D

func _ready():
	self.position = self.position.snapped(Vector2.ONE * TILE_SIZE)
	self.position += Vector2.ONE * TILE_SIZE/2


func _unhandled_input(event):
	for dir in DIRECTIONS:
		if event.is_action_pressed(dir):
			move(dir)

func _process(_delta):
	pass

func move(dir: String) -> void:
	ray.cast_to = DIRECTIONS[dir] * TILE_SIZE
	ray.force_raycast_update()
	if !ray.is_colliding():
		self.position += DIRECTIONS[dir] * TILE_SIZE
		self.position.x = clamp(self.position.x, TILE_SIZE/2.0, 1048)
		self.position.y = clamp(self.position.y, TILE_SIZE/2.0, 620)


func _on_Player_body_entered(body: Node) -> void:
	if body.name == "Checkpoints":
		print("Charging up, please stand by (this might take a wile...)")
	elif body.name == "Target":
		print("You completed this level successfully!")
