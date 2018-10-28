#version 330

// all modifications are vertex wise on this shader

// RENDERER variables from library
uniform mat4 m_pvm;
uniform	mat4 m_view;
uniform	mat3 m_normal;

// COLOR variables from library
uniform	vec4 diffuse;

// LIGHT variables from library
uniform	vec4 light_dir;		// global space

// data in
in vec4 position;			// local space
in vec3 normal;				// local space

// Data to fragment shader
out Data {
	vec4 color;
} DataOut;

void main() {
	// transform normal to camera space and normalize it
	vec3 nn = normalize(m_normal * normal);				// local space to camera space
	vec3 ldn = normalize(vec3(m_view * -light_dir));	// global space to camera space

	// compute the intensity as the dot product
	// the max prevents negative intensity values
	float intensity = max(0.0, dot(nn, ldn));

	// compute the color 
	if (intensity > 0.9)
		DataOut.color = diffuse;
	else if (intensity > 0.75)
		DataOut.color = 0.75 * diffuse;
	else if (intensity > 0.5)
		DataOut.color = 0.5 * diffuse;
	else if (intensity > 0.25)
		DataOut.color = 0.25 * diffuse;
	else
		DataOut.color = 0.1 * diffuse;

	// transform the vertex coordinates
	gl_Position = m_pvm * position;				// local space to clip space	
}