extends CharacterBody3D

signal hit

@export var speed = 12
@export var fall_acceleration = 75
@export var jump_impulse = 15
@export var bounce_impulse = 16

@onready var walk = $Footsteps

var collision
var mob
var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO
	$Pivot.rotation.x = PI / 6 * velocity.y / jump_impulse
	if Input.is_action_pressed("move_right"):
		direction.x += 1
		if !walk.playing:
			walk.play()
	if Input.is_action_just_released("move_right"):
		if walk.playing:
			walk.stop()
	
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		if !walk.playing:
			walk.play()
	if Input.is_action_just_released("move_left"):
		if walk.playing:
			walk.stop()			

	if Input.is_action_pressed("move_back"):
		direction.z += 1
		if !walk.playing:
			walk.play()
	if Input.is_action_just_released("move_back"):
		if walk.playing:
			walk.stop()	
							
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
		if !walk.playing:
			walk.play()
	if Input.is_action_just_released("move_back"):
		if walk.playing:
			walk.stop()	
						
	if Input.is_action_just_pressed("Attack"):
		$Pivot/Knight/AnimationPlayer.play("1H_Melee_Attack_Slice_Diagonal")
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)
		
		
	
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
		
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
		velocity = target_velocity
		move_and_slide()
		
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		target_velocity.y = jump_impulse	
		$Jump.play()
		for index in range(get_slide_collision_count()):
			collision = get_slide_collision(index)
			if collision.get_collider() == null:
				continue
			if collision.get_collider().is_in_group("mob"):
				mob = collision.get_collider()
				if Vector3.UP.dot(collision.get_normal()) > 0.1:
					mob.squash()
					$Death.play()
					target_velocity.y = bounce_impulse
					
	# Moving the Character
	velocity = target_velocity
	
	$Pivot/Knight/AnimationTree.set("parameters/conditions/Idle", direction == Vector3.ZERO)
	$Pivot/Knight/AnimationTree.set("parameters/conditions/Run", direction != Vector3.ZERO)
	move_and_slide()
	
	if GameEngine.speedup == true:
		speed = 20
	else:
		speed = 12
	
func die():
	hit.emit()
	queue_free()


func _on_mob_detector_body_entered(body):
	die()
