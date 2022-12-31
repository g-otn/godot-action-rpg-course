extends Area2D

const HitEffect = preload("res://Effects/HitEffect.tscn")

var invincible = false setget set_invincible

func set_invincible(value):
	invincible = value

onready var timer = $Timer

#signal invincibility_started
#signal invincibility_ended

func start_invicibility(duration):
	self.invincible = true
	timer.start(duration)
	set_deferred("monitoring", false)
	#emit_signal("invincibility_started")

func end_invinicibility():
	# Using self calls setter
	self.invincible = false
	set_deferred("monitoring", true)
	#emit_signal("invincibility_ended")

func create_hit_effect():
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position

func _on_Timer_timeout():
	end_invinicibility()

#func _on_Hurtbox_invincibility_started():
#	print("started")

#func _on_Hurtbox_invincibility_ended():
#	print("ended")

