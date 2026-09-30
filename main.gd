extends Node2D

# some variables and stuff :3
var speed = 150
var target_position: Vector2
var moving = false
var window_size = Vector2(100,100)
var screensize = DisplayServer.screen_get_size();

# wait when start
func _ready():
	wait()

# mr wait himself, just creates a timer with a random time to move the thing
func wait():
	var wait_time = randf_range(5.0, 25.0)
	await get_tree().create_timer(wait_time).timeout

	move_bro()
	moving = true

# mr move , sets a random possition then moved the big guy
func move_bro():
	target_position = Vector2(
		randf_range(0, screensize.x),
		randf_range(0, screensize.y)
	)

# runs 60 times a sec i think, just the moving thing 
func _process(delta: float) -> void:
	if not moving:
		return
	var window = get_window()
	var direction = Vector2(window.position).direction_to(target_position)
	window.position += Vector2i(direction * speed * delta)
	var current_position = Vector2(window.position)
	# don't tp :/
	if current_position.distance_to(target_position) < 10:
		window.position = Vector2i(target_position)
		moving = false
		wait()
# Thats it <3
