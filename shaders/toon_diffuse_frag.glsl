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
uniform vec3 fragLightColor;
uniform int fragToonDiscretize;

void main()
{
    // Code taken from lambert_frag.glsl
    vec3 N = normalize(fragNormal);
    vec3 L = normalize(fragLightPosition - fragPos);
    float diffuseStrength = abs(dot(L, N));
    // For toon shading, we round the strength to the nearest interval
    diffuseStrength = round(diffuseStrength * fragToonDiscretize) / float(fragToonDiscretize);
    outColor = vec4(fragLightColor*fragK_d*diffuseStrength, 1);
    // outColor = vec4(fragLightPosition, 1);
    // outColor = vec4(1,1,1,1);
}
