#version 330

// color division calculated per pixel with intensity

// RENDERER variables from library
uniform mat4 m_view;

// LIGHT variables from library
uniform vec4 light_dir; 		// global space

// COLOR variables from library
uniform	vec4 diffuse;

// Data in from vertex shader
in Data {
	vec3 normalV;
} DataIn;

// data output
out vec4 colorOut;

void main() {
	// get light dir in camera space
	vec3 ldn = normalize(vec3(m_view * -light_dir));

	// compute the intensity using the dot operation
	// normal is normalized before using it
	vec3 normaln = normalize(DataIn.normalV);
	float intensity = max(0, dot(normaln, ldn));

	// compute the color based on the intensity
	if (intensity > 0.90)
		colorOut = diffuse;
	else if (intensity > 0.75)
		colorOut = 0.75 * diffuse;
	else if (intensity > 0.5)
		colorOut = 0.5 * diffuse;
	else if (intensity > 0.25)
		colorOut = 0.25 * diffuse;
	else
		colorOut = 0.1 * diffuse;
}
