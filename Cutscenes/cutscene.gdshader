shader_type canvas_item;

uniform float speck_amount : hint_range(0.0, 1.0) = 0.05;
uniform float speck_speed : hint_range(0.0, 30.0) = 15.0;
uniform vec4 paper_color : source_color = vec4(0.96, 0.93, 0.88, 0.15);

float rand(vec2 uv) {
	return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453123);
}

void fragment() {
	
}
