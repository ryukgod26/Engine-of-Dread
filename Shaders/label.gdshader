shader_type canvas_item;

uniform float drip_speed: hint_range(0.0, 5.0, 0.1) = 1.;
uniform float drip_intensity: hint_range(0.0, 1.0, 0.1) = .2;
uniform float noise_scale: hint_range(0.0, 20.0, 0.1) = 10.;

uniform sampler2D noise_texture : repeat_enable;

void fragment() {
	vec2 noise_uv = UV * noise_scale;
	noise_uv.y -= TIME * drip_speed;
	
	float noise_val = texture(noise_texture, noise_uv).x;
	vec2 distorted_uv = UV;
	distorted_uv.y -= noise_val * drip_intensity * UV.y;
	vec4 text_color = texture(TEXTURE, distorted_uv);
	COLOR = text_color * vec4(0.8,0.,0.,text_color.a);
}
