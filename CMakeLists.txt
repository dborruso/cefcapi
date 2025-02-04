cmake_minimum_required(VERSION 3.10)
project(cefcapi C)

# Set C standard
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Create executable
add_executable(cefcapi-gtk3 examples/main_linux.c)

# Add CEF link directory
target_link_directories(cefcapi-gtk3 PRIVATE
	${CMAKE_CURRENT_SOURCE_DIR}/Release
)

# Link libraries
target_link_libraries(cefcapi-gtk3 PRIVATE
	cef
)
