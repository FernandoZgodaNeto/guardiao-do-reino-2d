extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0

var can_move = true 

@onready var wall_detector := $wall_detector as RayCast2D
@onready var texture := $texture as Sprite2D
@onready var anim := $anim

var direction := -1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if can_move:
		if wall_detector.is_colliding():
			direction *= -1;
			wall_detector.scale.x *= -1
	
		if direction == 1:
			texture.flip_h = true
		else:
			texture.flip_h = false
			
		velocity.x = direction * SPEED 

	else:
		velocity.x = 0
		
	move_and_slide()


func _on_anim_animation_finished(anim_name):
	if anim_name == "death":
		queue_free()
