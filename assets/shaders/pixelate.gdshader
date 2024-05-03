// currently unused shader

shader_type spatial;
render_mode unshaded;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;

const int pixel_size = 640; //resolution must be divisible by pixel_size

void fragment() {
	float x = float(int(FRAGCOORD.x) % pixel_size);
	float y = float(int(FRAGCOORD.y) % pixel_size);

	x = FRAGCOORD.x + floor(float(pixel_size) / 2.0) - x;
	y = FRAGCOORD.y + floor(float(pixel_size) / 2.0) - y;


	vec2 pixelated_uv = round(SCREEN_UV * float(pixel_size)) / float(pixel_size);
	ALBEDO = texture(SCREEN_TEXTURE, pixelated_uv).rgb;
	//ALBEDO = texture(SCREEN_TEXTURE, vec2(x, y) / VIEWPORT_SIZE).xyz;
}