using Base.Test
using AutomotiveDrivingModels
using AutoViz
using NBInclude
using Colors

nbinclude(Pkg.dir("AutoViz", "doc", "AutoViz.ipynb"))
nbinclude(Pkg.dir("AutoViz", "notebooks", "tutorial.ipynb"))

rw = gen_straight_roadway(3, 100.0)
car = ArrowCar(0.0, 0.0, 0.0, id=1)
car2 = ArrowCar(1.0, 1.0, 1.0, color=colorant"green", text="text")

render([rw, car, "some text"])

render([rw, car, car2, "some text"], cam=CarFollowCamera(0))

render([rw, car, car2], overlays=[TextOverlay(text=["overlay"], color=colorant"blue")])
