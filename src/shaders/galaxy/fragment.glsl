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

    gl_FragColor = vec4(vec3(strength), 1.0);

    #include <colorspace_fragment>
}