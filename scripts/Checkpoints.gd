extends TileMap

var scene = load("res://scenes/CheckpointLight.tscn")
const chekpoint_tile_id:int = 1
var TILE_SIZE: int = 16

# Called when the node enters the scene tree for the first time.
func _ready():
	var checkpoint_tiles:Array = self.get_used_cells_by_id(chekpoint_tile_id)
	for tile in checkpoint_tiles:
		var tilePosition:Vector2 = tile
		tilePosition = tilePosition * TILE_SIZE
		tilePosition += Vector2.ONE * TILE_SIZE/2
		var instance = scene.instance()
		instance.set_global_position(tilePosition)
		add_child(instance)
