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

# Add extra compiler flags on Linux systems
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    target_compile_options(cefcapi-gtk3 PRIVATE
        -Wall 
        -Werror
    )
endif()

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

# Add rpath for the executable
set_target_properties(cefcapi-gtk3 PROPERTIES
	BUILD_WITH_INSTALL_RPATH TRUE
	INSTALL_RPATH "."
)

add_custom_target(run
	COMMAND ${CMAKE_COMMAND} -E env "LD_LIBRARY_PATH=${CMAKE_CURRENT_SOURCE_DIR}/Release" ${CMAKE_CURRENT_SOURCE_DIR}/Release/cefcapi-gtk3
	DEPENDS cefcapi-gtk3
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/Release
	COMMENT "Running cefcapi-gtk3 with LD_LIBRARY_PATH set"
)
