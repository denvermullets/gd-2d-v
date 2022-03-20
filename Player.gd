extends KinematicBody2D

# Movement speed in pixels per second
export var movement_speed := 200.0

func _physics_process(_delta: float) -> void:
  # move the player at a constant speed based on input direction
  var direction := _get_direction()
  move_and_slide(direction * movement_speed)

func _get_direction() -> Vector2:
  # in this isometric view we have a 2:1 ratio so we have to double the horizontal input
  return Vector2(
    (Input.get_action_strength("right") - Input.get_action_strength("left")) * 2.0,
    Input.get_action_strength("down") - Input.get_action_strength("up")
  ).normalized()