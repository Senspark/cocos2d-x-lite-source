cmake_minimum_required(VERSION 3.6)

project(cc_ext_tremolo)
add_library(${PROJECT_NAME} "")
target_compile_definitions(${PROJECT_NAME} PRIVATE ONLY_C)
target_sources(${PROJECT_NAME} PRIVATE
    ./Tremolo/bitwise.c
    ./Tremolo/codebook.c
    ./Tremolo/dsp.c
    ./Tremolo/floor0.c
    ./Tremolo/floor1.c
    ./Tremolo/floor_lookup.c
    ./Tremolo/framing.c
    ./Tremolo/mapping0.c
    ./Tremolo/mdct.c
    ./Tremolo/misc.c
    ./Tremolo/res012.c
    ./Tremolo/treminfo.c
    ./Tremolo/vorbisfile.c
)
target_include_directories(${PROJECT_NAME} PUBLIC .)
set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE C)

