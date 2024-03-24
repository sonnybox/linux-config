precision highp float;

varying vec2 v_texcoord;
uniform sampler2D tex;



void main() {
    const float brightness = 1.0;
    const float desaturationAmount = 0.0;

    vec4 pixColor = texture2D(tex, v_texcoord);
    const vec3 whiteBalanceFactors = vec3(0.5, 1.0, 1.0);
    vec3 color = pixColor.rgb * whiteBalanceFactors * brightness;
    float luminance = dot(color, vec3(0.2126, 0.7152, 0.0722));
    color = mix(color, vec3(luminance), desaturationAmount);
    vec4 outCol = vec4(color, pixColor[3]);
    gl_FragColor = outCol;
}
