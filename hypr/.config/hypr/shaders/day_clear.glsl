//  Color Setting to see easier in Daytime Arc Raiders (or any game)

precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 pixColor = texture2D(tex, v_texcoord);
    vec3 color = pixColor.rgb;

    float vibrance = 1.6;
    float contrast = 1.1;
    float lum = dot(color, vec3(0.299, 0.587, 0.114));

    vec3 grayscale = vec3(lum);

    color = mix(grayscale, color, vibrance);
    color = (color - vec3(0.5)) * contrast + vec3(0.5);
    gl_FragColor = vec4(color, pixColor.a);
}
