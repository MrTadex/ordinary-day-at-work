extends StaticBody3D

@onready var _audio = $AudioStreamPlayer3D
@onready var _animator = $AnimatedSprite3D
@onready var _timer = $Timer

var bad = false
var last = false

var audio = [
	preload("res://resources/sound_music/narrator/script_30_nina_youre_fired.ogg"),
	preload("res://resources/sound_music/narrator/script_32_nina_zero_expectations.ogg"),
	preload("res://resources/sound_music/narrator/script_31_nina_great_job.ogg")
]

func _process(_delta):
	if _audio.playing:
		if bad:
			_animator.play("Disapprove")
		else:
			_animator.play("Approve")
		pass

func _on_event(eventName):
	match eventName:
		"End":
			print("End")
			if Logger.items_on_shelfs < 200:
				bad = true
			_timer.start(2)

func _on_timer_timeout():
	if last:
		get_tree().quit()
	else:
		if !bad:
			_audio.stream = audio[2]
			_audio.play()
			last = true
		else:
			_audio.stream = audio[0]
			_audio.play()

func _on_audio_stream_player_3d_finished():
	if last:
		print("last")
		#get_tree().call_group("EventListeners", "_on_event", "Quit")
		#get_tree().quit()
		_timer.start(2)
	else:
		_audio.stream = audio[1]
		_audio.play()
		last = true
		

