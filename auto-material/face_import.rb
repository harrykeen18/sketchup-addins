model = Sketchup.active_model
entities = model.active_entities

pt1 = [0, 0, 0]
pt2 = [1, 0, 0]
pt3 = [0, 1, 0]
pt4 = [0, 0, 1]
pt5 = [1, 1, 0]
pt6 = [1, 0, 1]
pt7 = [0, 1, 1]
pt8 = [1, 1, 1]

face1 = [pt1, pt3, pt5, pt2]
face2 = [pt6, pt8, pt5, pt2]
face3 = [pt6, pt4, pt7, pt8]
face4 = [pt4, pt7, pt3, pt1]
face5 = [pt4, pt6, pt2, pt1]
face6 = [pt3, pt5, pt8, pt7]

faces = [face1, face2, face3, face4, face5, face6]

for f in faces

  # Add the face to the entities in the model
  face = entities.add_face f
  
end