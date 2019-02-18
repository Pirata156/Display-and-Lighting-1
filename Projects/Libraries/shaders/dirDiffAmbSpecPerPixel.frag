#version 330

// COLOR variables from library
uniform	vec4 diffuse;
uniform	vec4 specular;
//uniform vec4 ambient;
uniform	float shininess;

// Data in from vertex shader
in Data {
	vec4 eye;
	vec3 normal;
	vec3 l_dir;
} DataIn;

// Data output
out vec4 colorOut;

void main() {

	// set the specular term to black
	vec4 spec = vec4(0.0);

	// normalize both input vectors
	vec3 nn = normalize(DataIn.normal);
	vec3 eyen = normalize(vec3(DataIn.eye));
	vec3 ldn = DataIn.l_dir;
	
	float intensity = max(dot(nn,ldn), 0.0);

	// if the vertex is lit compute the specular color
	if (intensity > 0.0) {
		// compute the half vector
		vec3 hv = normalize(ldn + eyen);	
		// compute the specular intensity
		float intSpec = max(dot(hv,nn), 0.0);
		// compute the specular term into spec
		spec = specular * pow(intSpec,shininess);
	}
	// colorOut = max(intensity * diffuse + spec, ambient);
	colorOut = max(intensity * diffuse + spec, diffuse * 0.25);
}
