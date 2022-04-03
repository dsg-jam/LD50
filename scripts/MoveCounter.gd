extends Label

onready var player = get_node("/root/Node2D/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	var err = player.connect("update_moves_left_counter", self, "_on_update_counter")
	assert(err == OK)

func _on_update_counter(count:int):
	set_text(str(count))
