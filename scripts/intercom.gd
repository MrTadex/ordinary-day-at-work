extends StaticBody3D

@onready var _audio = $AudioStreamPlayer3D
@onready var _animator = $AnimatedSprite3D
@onready var _light = $SpotLight3D
@onready var _timer = $Timer

# Audio files of narrator
var Audio_1 = preload("res://resources/sound_music/narrator/script_33_nina_bloody_hell.ogg")
var Audio_2 = preload("res://resources/sound_music/narrator/intro.wav")
var Audio_3 = preload("res://resources/sound_music/narrator/script_12_fish_1.ogg")
#

var play = null
var start = false

func _process(_delta):
	if _audio.playing:
		_animator.play("On")
		_light.visible = true
	else:
		_animator.play("Off")
		_light.visible = false
		
	if start:
		match play:
			"Audio_1":
				_audio.volume_db = 15
				_audio.stream = Audio_1
			"Audio_2":
				_audio.volume_db = 10
				_audio.stream = Audio_2
			"Audio_3":
				_audio.volume_db = 10
				_audio.stream = Audio_3
				
		_audio.play()
		start = false

func _on_event(eventName):
	match(eventName):
		"Start":
			play = "Audio_1"
			_timer.start(2)
		"Stop Alarm":
			play = "Audio_2" #plays intro
			_timer.start(2)
		"NarratorFishReact":
			play = "Audio_3"
	pass

func _on_timer_timeout():
	start = true

func _on_audio_stream_player_3d_finished():
	match play:
		"Audio_1":
			get_tree().call_group("EventListeners", "_on_event", "Can Stop Alarm")
		"Audio_2":
			get_tree().call_group("EventListeners", "_on_event", "Player intro react")
		"Audio_3":
			get_tree().call_group("EventListeners", "_on_event", "Player intro fish react")
