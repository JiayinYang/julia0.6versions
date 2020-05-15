#TODO: Add doc string
@with_kw struct ArrowCar{A<:AbstractArray{Float64}, C<:Colorant} <: Renderable
    pos::A         = SVector(0.0, 0.0)
    angle::Float64 = 0.0
    length::Float64 = 4.8
    width::Float64 = 1.8
    color::C       = COLOR_CAR_OTHER
    text::String   = "" # some debugging text to print by the car
    id::Int        = 0
end

ArrowCar(pos::AbstractArray, angle::Float64=0.0; length = 4.8, width = 1.8,  color=COLOR_CAR_OTHER, text="", id=0) = ArrowCar(pos, angle, length, width, color, text, id)
ArrowCar(x::Real, y::Real, angle::Float64=0.0; length = 4.8, width = 1.8,  color=COLOR_CAR_OTHER, text="", id=0) = ArrowCar(SVector(x, y), angle, length, width, color, text, id)

function render!(rm::RenderModel, c::ArrowCar)
    x = c.pos[1]
    y = c.pos[2]
    add_instruction!(rm, render_vehicle, (x, y, c.angle, c.length, c.width, c.color))
    add_instruction!(rm, render_text, (c.text, x, y-c.width/2 - 2.0, 10, colorant"white"))
    return rm
end

id(ac::ArrowCar) = ac.id
pos(ac::ArrowCar) = ac.pos
