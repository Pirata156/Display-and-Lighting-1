#version 330

// no modifications pixels wise on this shader

// Data in from vertex shader
in Data {
	vec4 color;
} DataIn;

// data output - "color" is reserved word so can't be used
out vec4 colorOut;

void main() {

	colorOut = DataIn.color;
}