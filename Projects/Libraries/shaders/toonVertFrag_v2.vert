#version 330

// normal calculated per vertex

// RENDERER variables from library
uniform	mat4 m_pvm;
uniform	mat3 m_normal;

// data in
in vec4 position; 			// local space
in vec3 normal;				// local space

// Data to fragment shader
out Data{
	vec3 normalV;
} DataOut;

void main() {
	// transform normal to camera space and normalize it
	DataOut.normalV = normalize(m_normal * normal);

	gl_Position = m_pvm * position;
}