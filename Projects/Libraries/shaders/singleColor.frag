#version 330

uniform vec4 diffuse;		// receive the diffuse info from project/model

out vec4 colorOut;

void main() {
	// set the color to be the color received
	colorOut = diffuse;
}