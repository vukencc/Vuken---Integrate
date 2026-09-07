#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <minecraft:sample_lightmap.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

void main() {
    vec3 Position_1 = Position;
    vec4 Color_1 = Color; 

    float r = round(Color_1.r * 255.0);
    float g = round(Color_1.g * 255.0);
    float b = round(Color_1.b * 255.0);

    if((r == 168.0 && g == 255.0 && b == 251.0) || (r == 70.0 && g == 79.0 && b == 196.0)) {
		Position_1.y -= 130;
    }

    gl_Position = ProjMat * ModelViewMat * vec4(Position_1, 1.0);

    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);
    vertexColor = Color * sample_lightmap(Sampler2, UV2);
    texCoord0 = UV0;
}
