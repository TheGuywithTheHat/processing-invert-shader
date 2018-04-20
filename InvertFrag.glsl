#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

uniform vec2 texOffset;

varying vec4 vertColor;
varying vec4 vertTexCoord;

uniform vec3 circle;

void main() {
    vec4 origColor = texture2D(texture, vertTexCoord.st) * vertColor;
    if(length(gl_FragCoord.xy - circle.xy) <= circle.z) {
        gl_FragColor = vec4(1.0 - origColor.rgb, 1.0);
    } else {
        gl_FragColor = origColor;
    }
}