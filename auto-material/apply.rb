t1 = Time.now

mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
defs = mod.definitions # All definitions

components = []

# find components
defs.each { |definition|
  if definition.is_a? Sketchup::ComponentDefinition

    components.push(definition.entities)
  end
}

# puts(components)

components.each { |component|

  faces = {}
  top_faces = []

  # cycle all entities in component
  component.each { |entity|
    if entity.is_a? Sketchup::Face

      if entity.area > 0.01

        faces[entity] = entity.area
      end
    end
  }

  if faces.any?

    sorted_faces = faces.sort_by{|_key, value| -value}
    top_faces.push(sorted_faces[0][0], sorted_faces[1][0])

    sorted_faces = Hash[sorted_faces]

    puts(sorted_faces)
    puts("———")
    puts(top_faces)

    faces.each { |entity, area|
      if top_faces.include?(entity)
        puts('top/bottom')
        entity.material = "birch"
      else
        puts('side')
        entity.material = "ply endgrain"
      end
    }

  end
}

t2 = Time.now
puts(t2 - t1)