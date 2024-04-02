precision highp float;
varying vec2 v_texcoord;
uniform sampler2D tex;

const vec3 desaturationFactors = vec3(0.5, 0.5, 0.05);
const float contrastAmount = 0.96;
const float brightness = 1.00;

void main() {
    vec4 pixColor = texture2D(tex, v_texcoord);
    vec3 color = vec3(pixColor[0]*0.972, pixColor[1]*0.99, pixColor[2]) * brightness;

    // Apply desaturation based on individual RGB channels
    vec3 desaturatedColor;
    desaturatedColor.r = mix(color.r, dot(color.rgb, vec3(.5, .5, .0)), desaturationFactors.r);
    desaturatedColor.g = mix(color.g, dot(color.rgb, vec3(.5, .5, .0)), desaturationFactors.g);
    desaturatedColor.b = mix(color.b, dot(color.rgb, vec3(.5, .5, .0)), desaturationFactors.b);

    // Apply contrast adjustment
    const float midPoint = 0.5;
    vec3 contrastAdjustedColor = (desaturatedColor - vec3(midPoint)) * contrastAmount + vec3(midPoint);

		// Final output
    vec4 outCol = vec4(contrastAdjustedColor, pixColor[3]);
    gl_FragColor = outCol;
}
