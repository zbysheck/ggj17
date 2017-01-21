extends AnimatedSprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	play("default")
	set_frame (0)
	#yield( self, "finished" )
	play("Loop")
