#version 330

// matrices
uniform mat4 m_pvm;
uniform	mat4 m_view;
uniform	mat3 m_normal;

uniform	vec4 diffuse;
uniform	vec4 ambient;

uniform	vec4 light_dir;		// global space

in vec4 position;			// local space
in vec3 normal;				// local space

// data to be sent to the fragment shader
out Data {
	vec4 color;
} DataOut;

void main () {
	// transform normal to camera space and normalize it
	vec3 n = normalize(m_normal * normal);

	// transform light to camera space and normalize it
	// compute has to be done with the inverse of the light direction
	vec3 ld = normalize(vec3(m_view * (-light_dir)));

	// compute the intensity as the dot product
	// the max prevents negative intensity values
	float intensity = max(dot(n, ld), 0.0);

	// compute the color as the maximum between the two components
	DataOut.color = intensity * diffuse + ambient; 			// By some reason ambient = 0 - to check

	// transform the vertex coordinates
	gl_Position = m_pvm * position;	
}