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
uniform vec3 fragLightColor;
uniform float fragShininess;

void main()
{
    /*
    Real-time shadows page 326
    \kappa_s \max(0, \mathbf{h} \cdot \mathbf{n})^\alpha
    where \mathbf{h} := (\boldsymbol{\omega} + \mathbf{l}) / \Vert \boldsymbol{\omega} + \mathbf{l} \Vert
    which is equal to normalizing \omega + \mathbf{l}
    */

    vec3 N = normalize(fragNormal);
    vec3 L = normalize(fragLightPos - fragPos);
    vec3 V = normalize(fragCameraPos - fragPos);
    vec3 H = normalize(L + V);
    outColor = vec4(fragLightColor * fragK_s*pow(max(0.0, dot(H, N)), fragShininess), 1.0);
}