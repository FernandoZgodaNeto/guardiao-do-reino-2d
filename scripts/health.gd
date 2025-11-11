extends Area2D

var lifes := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	$anim.play("collect")
	await $collision.call_deferred("queue_free")
	if (Globals.player_life < 3):
		Globals.player_life += 1


func _on_anim_animation_finished():
	if $anim.animation == "collect":
		queue_free()
