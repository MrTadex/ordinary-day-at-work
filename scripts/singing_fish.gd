extends StaticBody3D

@export var count:int = 3
@export var min_time:int = 5
@export var max_time:int = 10

@onready var _audio = $AudioStreamPlayer3D
@onready var _animation = $AnimatedSprite3D
@onready var _timer = $Timer

func timer_count():
	count -= 1
	print(count)
	if count <= 0:
		var timer = randi_range(min_time,max_time)
		_timer.start(timer)
		print("started ", timer)

func clicked():
	if _audio.playing:
		_audio.playing = false
		timer_count()
	else:
		_audio.playing = true
		
		
func _process(_delta):
	if _audio.playing:
		_animation.play("Talking")
	else:
		_animation.play("Idle")


func _on_timer_timeout():
	print("timer timeout")
	_audio.playing = true


func _on_audio_stream_player_3d_finished():
	timer_count()
