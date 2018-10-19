#version 330

uniform mat4 m_pvm;

in vec4 position;	

void main () {
	// transform the vertex coordinates
	gl_Position = m_pvm * position;	
}