#version 330

// intensity calculated per vertex

// RENDERER variables from library
uniform	mat4 m_pvm;
uniform mat4 m_view;
uniform	mat3 m_normal;

// LIGHT variables from library
uniform vec4 light_dir; 	// global space

// data in
in vec4 position; 			// local space
in vec3 normal;				// local space

// Data to fragment shader
out Data{
	float intensity;
} DataOut;

void main() {
	// transform normal to camera space and normalize it
	vec3 nn = normalize(m_normal * normal);

	// compute the intensity using the dot operation
	DataOut.intensity = dot(nn, normalize(vec3(m_view * -light_dir)));

	gl_Position = m_pvm * position;
}