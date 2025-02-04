cmake_minimum_required(VERSION 3.10)
project(cefcapi C)

# Set C standard
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Find required packages
find_package(X11 REQUIRED)
find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK3 REQUIRED gtk+-3.0)

# Create executable
add_executable(cefcapi-gtk3 examples/main_linux.c)

# Set include directories
target_include_directories(cefcapi-gtk3 PRIVATE
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_CURRENT_SOURCE_DIR}/..
	${GTK3_INCLUDE_DIRS}
)

# Add CEF link directory
target_link_directories(cefcapi-gtk3 PRIVATE
	${CMAKE_CURRENT_SOURCE_DIR}/Release
)

# Link libraries
target_link_libraries(cefcapi-gtk3 PRIVATE
	X11
	cef
	${GTK3_LIBRARIES}
)

# Set output directory
set_target_properties(cefcapi-gtk3 PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Release"
)