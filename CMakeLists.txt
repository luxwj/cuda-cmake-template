# How to use
# 1. mkdir build
# 2. cd build
# 3. cmake ..
# 4. make
# 5. <run your program>

cmake_minimum_required(VERSION 3.9)

set(PROJECT_NAME hello_w)

project(${PROJECT_NAME} LANGUAGES CXX CUDA)

find_package(CUDA REQUIRED)
include_directories("${CUDA_INCLUDE_DIRS}")

if(NOT DEFINED CMAKE_CUDA_ARCHITECTURES)
  set(CMAKE_CUDA_ARCHITECTURES 86)    # RTX 3070
endif()

add_executable(${PROJECT_NAME} helloworld.cu)

target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_11)

set_target_properties(${PROJECT_NAME}
    PROPERTIES CUDA_SEPARABLE_COMPILATION ON
)


# install (TARGETS ${PROJECT_NAME} DESTINATION bin)
