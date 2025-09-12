#version 410

// Global variables for lighting calculations
//uniform vec3 viewPos;

// Output for on-screen color
out vec4 outColor;

// Interpolated output data from vertex shader
in vec3 fragPos; // World-space position
in vec3 fragNormal; // World-space normal

uniform vec3 fragK_s;
uniform vec3 fragCameraPos;
uniform vec3 fragLightPos;

void main()
{
    // we wanted the incident light, so we have to revert the factor
    vec3 reflectionVector = reflect(-fragLightPos, normalize(fragNormal));
    outColor = vec4(fragK_s * dot(reflectionVector, fragCameraPos-fragPos), 1.0);
}