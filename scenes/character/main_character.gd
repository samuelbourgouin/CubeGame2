extends CharacterBody2D
class_name main_character

@export var SPEED = 400.0
@export var JUMP_VELOCITY = -900.0
@onready var animated_sprite_2d = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var lastDirection = Vector2.ZERO
var was_in_air = false

func _ready():
	GameManager.player = self

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


func update_animation():
	if abs(velocity.x) > 1:
		animated_sprite_2d.play("running")
	else:
		animated_sprite_2d.play("default")
	
	if velocity.y < 0:
		animated_sprite_2d.play("jumping")
	if velocity.y > 0:
		animated_sprite_2d.play("fall")
	

func die():
	GameManager.respawn_player()
