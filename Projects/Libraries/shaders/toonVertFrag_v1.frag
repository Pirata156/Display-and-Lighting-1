#version 330

// color division calculated per pixel with intensity

// COLOR variables from library
uniform	vec4 diffuse;

// Data in from vertex shader
in Data {
	float intensity;
} DataIn;

// data output
out vec4 colorOut;

void main() {
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
