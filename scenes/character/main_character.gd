extends CharacterBody2D
class_name main_character

@export var SPEED = 400.0
@export var JUMP_VELOCITY = -900.0
@export var attacking = false

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var dust = preload("res://scenes/character/dust.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var lastDirection = Vector2.ZERO
var isGrounded = true
var isJumping = true
var isRunning = false
var frame_counter = 0

func _ready():
	GameManager.player = self

@warning_ignore("unused_parameter")
func _process(delta):
	if Input.is_action_just_pressed("attack1"):
		attack("attack1")
	if Input.is_action_just_pressed("attack2"):
		attack("attack2")

func _physics_process(delta):
	
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if(Input.is_action_just_pressed("down") && is_on_floor()):
		position.y += 1
	
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		lastDirection = Vector2(direction, 0)
	else:
		velocity.x = move_toward(velocity.x, 0, 150)
	
	update_animation()
	move_and_slide()
	
	var isLeft = lastDirection.x < 0
	animated_sprite_2d.flip_h = isLeft

@warning_ignore("shadowed_variable")
func attack(attack):
	attacking = true
	animated_sprite_2d.play(attack)


func update_animation():
	if !attacking:
		if abs(velocity.x) > 1:
			animated_sprite_2d.play("running")
			isRunning = true
		else:
			animated_sprite_2d.play("default")
			isRunning = false
		
		if velocity.y < 0:
			animated_sprite_2d.play("jumping")
		if velocity.y > 0:
			animated_sprite_2d.play("fall")
	
	if isRunning == true && is_on_floor() == true:
		frame_counter += 1
		if frame_counter == 20:
			var instance = dust.instantiate()
			instance.global_position = $Marker2D.global_position
			get_parent().add_child(instance)
			instance.play_animation("running_effect")
			frame_counter = 0
	
	if isGrounded == false && is_on_floor() == true:
		var instance = dust.instantiate()
		instance.global_position = $Marker2D.global_position
		get_parent().add_child(instance)
		instance.play_animation("ground_effect")
	
	if isJumping == false && velocity.y < 0:
		var instance = dust.instantiate()
		instance.global_position = $Marker2D.global_position
		get_parent().add_child(instance)
		instance.play_animation("jumping_effect")
	
	isGrounded = is_on_floor()
	isJumping = !is_on_floor()

func die():
	GameManager.respawn_player()

func _on_animated_sprite_2d_animation_finished():
	if animated_sprite_2d.animation == "attack1":
		attacking = false
	if animated_sprite_2d.animation == "attack2":
		attacking = false
