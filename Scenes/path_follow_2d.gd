extends PathFollow2D

@onready var path2d = get_parent()
@onready var line2d = $Line2D # Ensure Line2D is a child of PathFollow2D

func _process(delta):
	# 1. Move the Follower
	# progress += 100 * delta # Example speed
	
	# 2. Update Line2D to show path from start to current progress
	update_line()

func update_line():

	print("progress: " + str(progress), "ratio: " + str(progress_ratio))
	# Get all points from the path
	var all_points = path2d.curve.get_baked_points()
	var new_points = []
	
	# Loop through baked points and only take points up to current progress
	for i in range(all_points.size()):
		var point_pos = all_points[i]
		# Calculate distance of this point from start
		var point_dist = path2d.curve.get_closest_offset(point_pos)
		
		if point_dist <= progress:
			# Convert point to local space of the Line2D
			new_points.append(to_local(point_pos))
		else:
			break
			
	line2d.points = PackedVector2Array(new_points)