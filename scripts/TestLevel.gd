extends Node2D
@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func game_over():
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_start_timer_timeout():
	$MobTimer.start()

func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()
	# Choose a random location on Path2D.
	var mob_spawn_location = $MobSpawnLocation.position
	# Set the mob's position to a random location.
	mob.position = mob_spawn_location

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
