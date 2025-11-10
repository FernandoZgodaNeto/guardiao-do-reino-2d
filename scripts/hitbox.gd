extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		owner.can_move = false 
		body.velocity.y = body.JUMP_FORCE
		owner.get_node("anim").play("death")
