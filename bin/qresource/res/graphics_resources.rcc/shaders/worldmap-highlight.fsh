#ifdef GL_ES
#define LOWP lowp
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#else
#define LOWP 
#endif

uniform sampler2D texture;
uniform lowp float qt_Opacity;
uniform lowp vec4 highlightColor;

varying highp vec2 vTexCoord;

void main() {
  vec4 regularColor = texture2D(texture, vTexCoord) * qt_Opacity;
  vec3 blended = mix(regularColor.rgb, highlightColor.rgb, highlightColor.a);
  vec4 blendedAndMasked = vec4(blended.rgb, 1.0) * regularColor.a;
  gl_FragColor = blendedAndMasked;
}
