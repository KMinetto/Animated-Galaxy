varying vec3 vColor;

#define PI 3.1415926535897932384626433832795

void main()
{
    // Circles
    float circle = distance(gl_PointCoord, vec2(0.5));

    // Diffuse points
    circle *= 2.0;

    float strength = 1.0 - circle;

    // Light point pattern
    strength = pow(strength, 10.0);

    // Final Color
    vec3 finalColor = mix(vec3(0.0), vColor, strength);

    gl_FragColor = vec4(finalColor, 1.0);

    #include <colorspace_fragment>
}