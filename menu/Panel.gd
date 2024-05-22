extends Panel

func _ready():
	var video_stream_player = VideoStreamPlayer.new()
	video_stream_player.rect_min_size = Vector2(320, 320)  # Larghezza e altezza desiderate
	add_child(video_stream_player)
	video_stream_player.play()
