project "ImGui-Terminal"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cc",
		"src/**.cpp",
	}

	includedirs
	{
	   "../imgui",
		"include"
		-- "src"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "off"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "off"
    
    filter "system:macosx"
		cppdialect "c++20"
		staticruntime "off"
    
        links{
			"ImGui"
            -- "pthread",
            -- "dl"
        }


	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
