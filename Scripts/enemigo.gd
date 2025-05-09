extends Node2D

@onready var area2d : Area2D = $Area2D
@onready var animation : AnimationPlayer = $AnimationPlayer

var vida := 3
var muerto := false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if muerto:
		return

	if area.is_in_group("P_Punch"):
		vida -= 1
		print("Ahh me pegó!!! Vida restante:", vida)
		animation.play("Golpeado")

		if vida <= 0:
			morir()

func morir():
	muerto = true
	print("¡He muerto!")
	animation.play("Muerte")
	await animation.animation_finished
	queue_free()
	print("Ya se murio en serio")
