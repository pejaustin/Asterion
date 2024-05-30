extends GridMap

class_name Room

func enter(player):
    if not self.is_a_parent_of(player):
        add_child(player)
    player.translation = $Start.translation

func move_forward(player):
    var forward = player.forward_translation()
    var pos = world_to_map(forward)
    var map_pos = map_to_world(pos.x, pos.y, pos.z)
    player.translation = map_pos
