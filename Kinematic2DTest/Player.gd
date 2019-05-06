extends KinematicBody2D

export var speed : int
var velocity

func _physics_process(delta: float) -> void:
	get_input()
	self.move_and_slide(velocity)


func get_input() -> void:
	# Detect up/down/left/right keystate and only move when pressed.
	velocity = Vector2()
	
	
	if Input.is_action_pressed('ui_right'):
		velocity.x += speed
		$sprite.flip_h = false
	if Input.is_action_pressed('ui_left'):
		velocity.x -= speed
		$sprite.flip_h = true
	if Input.is_action_pressed('ui_down'):
		velocity.y += speed
	if Input.is_action_pressed('ui_up'):
		velocity.y -= speed
	
	velocity = velocity.normalized() * speed
	if velocity == Vector2(0,0):
		$sprite.play("wait")
		$label.text = "Waiting"
	else:
		$sprite.play("run")
		$label.text = "Running"
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_fast"):
		speed = speed*2
	elif event.is_action_released("ui_fast"):
		speed = speed/2