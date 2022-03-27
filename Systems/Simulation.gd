extends Node

# barrier_id is purp, index in TileMap
const BARRIER_ID := 1
# invisible_barrier_id is invis, index in TileMap
const INVISIBLE_BARRIER_ID := 2

# load variable once gamestate is active
onready var _ground := $GameWorld/GroundTiles

func _ready() -> void:
  # get array of all tile coordinates that use purple block
  var barriers: Array = _ground.get_used_cells_by_id(BARRIER_ID)

  # iterate over the purps and make them invisible barriers
  for cellv in barriers:
    _ground.set_cellv(cellv, INVISIBLE_BARRIER_ID)