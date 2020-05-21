cmake_minimum_required(VERSION 3.6)

project(cc_spine)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    Animation.c
    AnimationState.c
    AnimationStateData.c
    Array.c
    Atlas.c
    AtlasAttachmentLoader.c
    Attachment.c
    AttachmentLoader.c
    AttachmentVertices.cpp
    Bone.c
    BoneData.c
    BoundingBoxAttachment.c
    ClippingAttachment.c
    Cocos2dAttachmentLoader.cpp
    Color.c
    Event.c
    EventData.c
    IkConstraint.c
    IkConstraintData.c
    Json.c
    MeshAttachment.c
    PathAttachment.c
    PathConstraint.c
    PathConstraintData.c
    PointAttachment.c
    RegionAttachment.c
    Skeleton.c
    SkeletonAnimation.cpp
    SkeletonBatch.cpp
    SkeletonBinary.c
    SkeletonBounds.c
    SkeletonClipping.c
    SkeletonData.c
    SkeletonJson.c
    SkeletonRenderer.cpp
    SkeletonTwoColorBatch.cpp
    Skin.c
    Slot.c
    SlotData.c
    TransformConstraint.c
    TransformConstraintData.c
    Triangulator.c
    VertexAttachment.c
    VertexEffect.c
    extension.c
    spine-cocos2dx.cpp
)
target_include_directories(${PROJECT_NAME} PRIVATE ..)
target_link_libraries(${PROJECT_NAME} cc_core)