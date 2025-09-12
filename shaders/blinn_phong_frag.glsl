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
uniform vec3 fragShininess;

void main()
{
    outColor = vec4(abs(fragNormal), 1.0);

    // vec3 N = normalize(fragNormal);
    // vec3 L = normalize(fragLightPos - fragPos);
    // vec3 V = normalize(fragCameraPos - fragPos);
    // vec3 H = (L + V)/(distance(L, V));
    // outColor = vec4(pow(dot(H, N), fragShininess), 1.0);
}