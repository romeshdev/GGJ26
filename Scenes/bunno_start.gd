extends Area2D
signal doorHit

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	doorHit.emit()
	$CollisionShape2D.call_deferred("disabled", true)
