#version 410

// Global variables for lighting calculations
//uniform vec3 viewPos;

// Output for on-screen color
out vec4 outColor;

// Interpolated output data from vertex shader
in vec3 fragPos; // World-space position
in vec3 fragNormal; // World-space normal

uniform vec3 fragK_d;
uniform vec3 fragLightPosition;

void main()
{    
    /*
    Real-time shadows book page 324
    L_o^d(\mathbf{p}, \omega) = \kappa_d \max(0, \mathbf{n} \cdot \mathbf{l})
    */
    vec3 N = normalize(fragNormal);
    vec3 L = normalize(fragLightPosition - fragPos);
    float diffuseStrength = abs(dot(L, N));
    outColor = vec4(fragK_d*diffuseStrength, 1);
}