#version 410

// Global variables for lighting calculations
//uniform vec3 viewPos;

// Output for on-screen color
out vec4 outColor;

// Interpolated output data from vertex shader
in vec3 fragPos; // World-space position
in vec3 fragNormal; // World-space normal

uniform sampler2D texToon;

// uniform vec3 fragK_d;
uniform vec3 fragLightPosition;

// uniform vec3 fragK_s;
uniform vec3 fragCameraPos;
uniform float fragShininess;


void main()
{
    vec3 N = normalize(fragNormal);
    vec3 L = normalize(fragLightPosition - fragPos);
    float diffuseStrength = abs(dot(L, N));
    // outColor = vec4(fragK_d*diffuseStrength, 1);

    vec3 V = normalize(fragCameraPos - fragPos);
    vec3 H = normalize(L + V);
    float blinnPhongStrength = pow(max(0.0, dot(H, N)), fragShininess);
    // outColor = vec4(fragK_s*blinnPhongStrength, 1.0);

    float totalStrength = diffuseStrength + blinnPhongStrength;
    float distanceViewerFragment = distance(fragCameraPos, fragPos);
    float normalizedStrength = clamp(totalStrength, 0.0, 1.0);

    // if (distanceViewerFragment < 2.6) {
    //     outColor = vec4(vec3(0.0), 1.0);
    // } else {
    //     outColor = vec4(vec3(1.0), 1.0);
    // }

    // distanceViewerFragment is value between 2.5-3 (trial & error)
    // we try to make the normalized distance a value between 0 and 1
    float normalizedDistance = (distanceViewerFragment - 2.5) * 2;

    outColor = texture(texToon, vec2(normalizedStrength, normalizedDistance));
    // outColor = vec4(vec3(normalizedDistance), 1.0);
}