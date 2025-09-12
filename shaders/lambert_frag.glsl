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
    outColor = vec4(fragK_d*(dot(normalize(fragLightPosition), normalize(fragNormal))), 0.5);
}