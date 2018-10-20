#version 330

// data received from vertex shader
in Data {
	vec4 color;
} DataIn;

// data to be sent to the pixel
out vec4 colorOut;

void main() {

	colorOut = DataIn.color;
}