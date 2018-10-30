#version 330

// color division calculated per pixel with intensity

// LIGHT variables from library
uniform vec4 light_dir; 	// global space

// COLOR variables from library
uniform	vec4 diffuse;

// Data in from vertex shader
in Data {
	float intensity;
} DataIn;

// data output
out vec4 colorOut;

void main() {
	// get light dir in camera space
	vec3 ld = normalize(vec3(m_view * -light_dir));

	// compute the intensity using the dot operation
	DataOut.intensity = dot(nn, normalize(vec3(m_view * -light_dir)));

	// compute the color based on the intensity
	if (DataIn.intensity > 0.90)
		colorOut = diffuse;
	else if (DataIn.intensity > 0.75)
		colorOut = 0.75 * diffuse;
	else if (DataIn.intensity > 0.5)
		colorOut = 0.5 * diffuse;
	else if (DataIn.intensity > 0.25)
		colorOut = 0.25 * diffuse;
	else
		colorOut = 0.1 * diffuse;
}
