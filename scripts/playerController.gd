extends CharacterBody3D

@export var mouse_sensitivity := 0.05 

var held_object: RigidBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var _camera:Camera3D = $Camera3D
@onready var _raycast:RayCast3D = _camera.get_node("./RayCast3D")
@onready var _holdPoint:Node3D = _camera.get_node("./HoldPoint")

@onready var _audio = $AudioStreamPlayer3DWalk
@onready var _audioPlayer = $AudioStreamPlayer3DStartUp
@onready var _audioReact = $AudioStreamPlayer3DReact

@onready var _timer = $Timer

var array = [
				#preload("res://resources/sound_music/player_sound/script_16_fish_5_laugh1.ogg"),
				preload("res://resources/sound_music/player_sound/script_36_luka_minecraft.ogg"),
				preload("res://resources/sound_music/player_sound/script_29_vroom.ogg"),
				preload("res://resources/sound_music/player_sound/script_36_luka_minecraft.ogg"),
				preload("res://resources/sound_music/player_sound/script_16_fish_5_laugh1.ogg")
			]

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		_audio.stop()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		if !_audio.playing and is_on_floor() and velocity.y == 0:
			_audio.play()

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		_audio.stop()

	move_and_slide()
	
	if Input.is_action_just_pressed("left_click"):
		if held_object:
			held_object.freeze = false
			var forceDir = to_global(_raycast.target_position) - _raycast.global_position
			print(forceDir + Vector3(0,2,0))
			held_object.apply_central_impulse((forceDir + Vector3(0,2,0)) * 5)
			held_object = null
		else:
			if _raycast.get_collider():
				if(_raycast.get_collider().get_class() == "RigidBody3D"):
					held_object = _raycast.get_collider()
					held_object.freeze = true
					print(held_object)
				elif(_raycast.get_collider().is_in_group("Interactable")):
					_raycast.get_collider().clicked()
	
	if held_object:
		held_object.position = _holdPoint.global_transform.origin
	
func _process(_delta):
	_camera.position = Vector3(position.x, position.y + 0.6, position.z)

	if _raycast.get_collider():
		if _raycast.get_collider().name.contains("panties") and _audioReact.playing == false:
			#sproži event laugh panties
			_audioReact.stream = array[3]
			_audioReact.volume_db = 10
			_audioReact.playing = true
			_timer.start(2)
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		
		_camera.rotation_degrees.x -= event.relative.y * mouse_sensitivity
		_camera.rotation_degrees.x = clampf(_camera.rotation_degrees.x, -90.0, 90.0)
		#print_debug(_camera.rotation_degrees.x)
		
		_camera.rotation_degrees.y -= event.relative.x * mouse_sensitivity
		_camera.rotation_degrees.y = wrapf(rotation_degrees.y, 0.0, 360.0)
		
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		rotation_degrees.y = wrapf(rotation_degrees.y, 0.0, 360.0)
	pass

func _on_event(eventName):
	match eventName:
		"Car React":
			_audioPlayer.stream = array[1]
			#_audioPlayer.volume_db = 10
			_audioPlayer.playing = true
		"Tree React":
			_audioPlayer.stream = array[2]
			#_audioPlayer.volume_db = 10
			_audioPlayer.playing = true
