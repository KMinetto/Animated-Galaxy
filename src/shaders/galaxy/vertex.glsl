uniform float uTime;
uniform float uSize;

attribute float aScale;

varying vec3 vColor;

void main() {
    /**
     * Position
     */
    vec4 modelPosition = modelMatrix * vec4(position, 1.);

    /**
     * Animate Particle
     */
    float particlesAngle = atan(modelPosition.x, modelPosition.z);
    float distanceToCenter = length(modelPosition.xz);
    float offsetAngle = (1.0 / distanceToCenter) * uTime * 0.2;
    particlesAngle += offsetAngle;

    modelPosition.x = cos(particlesAngle) * distanceToCenter;
    modelPosition.z = sin(particlesAngle) * distanceToCenter;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectionPosition = projectionMatrix * viewPosition;

    gl_Position = projectionPosition;

    /**
     * Size
     */
    gl_PointSize = uSize * aScale;
    gl_PointSize *= (1.0 / - viewPosition.z); // mvPosition = modelViewPosition

    /**
     * Color
     */
    vColor = color;
}
