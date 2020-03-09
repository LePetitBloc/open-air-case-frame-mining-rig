import FreeCAD
import Mesh
import Part
import importDWG

projects = [
  "open_air_case_frame",
  "foot",
]

objects = []
for project in projects:
  FreeCAD.openDocument("./projects/"+project+".fcstd")
  FreeCAD.setActiveDocument(project)

  objects.append(FreeCAD.getDocument(project).getObject("Group"))

  Mesh.export(objects, u"./exports/"+project+".obj")
  Mesh.export(objects, u"./exports/"+project+".amf")
  Part.export(objects, u"./exports/"+project+".iges")
  importDWG.export(objects, u"./exports/"+project+".dwg")

  del objects
