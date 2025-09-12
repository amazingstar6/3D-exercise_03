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
uniform float fragShininess;

uniform float fragToonSpecularThreshold;

void main()
{
    // Taken from blinn_phong_frag.glsl
    vec3 N = normalize(fragNormal);
    vec3 L = normalize(fragLightPos - fragPos);
    vec3 V = normalize(fragCameraPos - fragPos);
    vec3 H = normalize(L + V);
    float blinn_phong = pow(max(0.0, dot(H, N)), fragShininess);
    if (blinn_phong >= fragToonSpecularThreshold) {
        outColor = vec4(1, 1, 1, 1); // we make the highlight white
    } else {
        outColor = vec4(0, 0, 0, 0); // we return invisible black
    }
    // fragK_s is not used!
}