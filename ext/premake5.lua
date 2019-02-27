require "premake-cuda/cuda"

workspace "Extension"
   configurations { "Debug", "Release" }
   startproject "Test"
   
   -- A project defines one build target
   project "Lib"
      location "src"
      kind "SharedLib"
      language "C"
      staticruntime "off"
      files { "src/**.h", "src/**.c", "src/**.cu" }
      defines { "STRIP_PYTHON", "EXT_SO" }

      includedirs {"/usr/local/cuda/include/"}
      libdirs {"/usr/local/cuda/lib64/"}

      targetdir ("../build/test/bin/")
      objdir ("../build/test/bin-int/")

	  filter "system:windows"
		systemversion "latest"

      configuration "Debug"
         defines "DEBUG"
         symbols "On"

      configuration "Release"
         defines "NDEBUG"
         optimize "On"

   project "Test"
      location "test"
      kind "ConsoleApp"
      language "C"
      defines { "STRIP_PYTHON" }
      
      includedirs {"src"}
      -- includedirs {"src", "/usr/local/cuda/include/"}
      -- libdirs {"/usr/local/cuda/lib64/"}

      targetdir ("../build/test/bin/")
      objdir ("../build/test/bin-int/")

      links {"Lib"}
      files { "test/**.h", "test/**.c" }
      

	  filter "system:windows"
		 systemversion "latest"
		
      configuration "Debug"
         defines "DEBUG"
         symbols "On"

      configuration "Release"
         defines "NDEBUG"
         optimize "On"