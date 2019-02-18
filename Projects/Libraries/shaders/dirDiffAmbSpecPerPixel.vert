#version 330

// matrices

// RENDERER variables from library
uniform	mat4 m_pvm;
uniform	mat4 m_viewModel;	// from local space to camera space
uniform	mat4 m_view;		// from global space to camera space
uniform	mat3 m_normal;

// LIGHT variables from library
uniform	vec4 light_dir; 	// global space

in vec4 position;			// local space
in vec3 normal;				// local space

// the data to be sent to the fragment shader
out Data {
	vec4 eye;
	vec3 normal;
	vec3 l_dir;
} DataOut;

void main () {
	// transform normal to camera space and normalize it
	DataOut.normal = normalize(m_normal * normal);

	// transform eye vector to camera space
	DataOut.eye = -(m_viewModel * position);

	// transform light to camera space and normalize it
	DataOut.l_dir = normalize(vec3(m_view * -light_dir));

	// transform the vertex coordinates
	gl_Position = m_pvm * position;	
}
