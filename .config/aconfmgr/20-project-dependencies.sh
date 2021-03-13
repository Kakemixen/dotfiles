
# low level graphical projects
AddPackage glfw-x11 # A free, open source, portable framework for graphical application development (x11)
AddPackage glu # Mesa OpenGL Utility library
AddPackage spirv-tools # API and commands for processing SPIR-V modules
AddPackage vulkan-extra-layers # Extra layers for Vulkan development
AddPackage vulkan-extra-tools # Vulkan lunarg tools
AddPackage vulkan-headers # Vulkan header files
AddPackage vulkan-html-docs # Vulkan html documentation
AddPackage vulkan-tools # Vulkan Utilities and Tools
AddPackage vulkan-validation-layers # Vulkan Validation Layers

# might stop using SDL at some point. Remove then
AddPackage sdl # A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard
AddPackage sdl2_image # A simple library to load images of various formats as SDL surfaces (Version 2)

# magnum library for high-level graphics programming
AddPackage --foreign magnum-git # C++11/C++14 graphics middleware for games and data visualization (Git version)
AddPackage --foreign magnum-plugins-git # Plugins for the Magnum C++11/C++14 graphics engine (Git version)

# C++
AddPackage lld # Linker from the LLVM project

# configuring the keyboard
AddPackage qmk # CLI tool for customizing supported mechanical keyboards.

# Dunno why I need this, but feels necessary
AddPackage yasm # A rewrite of NASM to allow for multiple syntax supported (NASM, TASM, GAS, etc.)
AddPackage rust # Systems programming language focused on safety, speed and concurrency
AddPackage scons # Extensible Python-based build utility
AddPackage ctags # Generates an index file of language objects found in source files
