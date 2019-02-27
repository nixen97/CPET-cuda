--
-- cuda_nvcc.lua
-- NVCC build tool.
-- Copyright (c) 2012-2015 Manu Evans and the Premake project
--

	-- local emscripten = premake.modules.emscripten

	-- emscripten.nvcc = {}

	-- premake.tools.nvcc = emscripten.nvcc

	premake.tools.nvcc = {}

	local nvcc = premake.tools.nvcc
	local clang = premake.tools.clang
	local config = premake.config


--
-- Build a list of flags for the C preprocessor corresponding to the
-- settings in a particular project configuration.
--
-- @param cfg
--    The project configuration.
-- @return
--    An array of C preprocessor flags.
--

	function nvcc.getcppflags(cfg)

		-- Just pass through to Clang for now
		local flags = clang.getcppflags(cfg)
		return flags

	end


--
-- Build a list of C compiler flags corresponding to the settings in
-- a particular project configuration. These flags are exclusive
-- of the C++ compiler flags, there is no overlap.
--
-- @param cfg
--    The project configuration.
-- @return
--    An array of C compiler flags.
--

	function nvcc.getcflags(cfg)

		-- Just pass through to Clang for now
		local flags = clang.getcflags(cfg)
		return flags

	end


--
-- Build a list of C++ compiler flags corresponding to the settings
-- in a particular project configuration. These flags are exclusive
-- of the C compiler flags, there is no overlap.
--
-- @param cfg
--    The project configuration.
-- @return
--    An array of C++ compiler flags.
--

	function nvcc.getcxxflags(cfg)

		-- Just pass through to Clang for now
		local flags = clang.getcxxflags(cfg)
		return flags

	end


--
-- Returns a list of defined preprocessor symbols, decorated for
-- the compiler command line.
--
-- @param defines
--    An array of preprocessor symbols to define; as an array of
--    string values.
-- @return
--    An array of symbols with the appropriate flag decorations.
--

	function nvcc.getdefines(defines)

		-- Just pass through to Clang for now
		local flags = clang.getdefines(defines)
		return flags

	end

	function nvcc.getundefines(undefines)

		-- Just pass through to Clang for now
		local flags = clang.getundefines(undefines)
		return flags

	end


--
-- Returns a list of forced include files, decorated for the compiler
-- command line.
--
-- @param cfg
--    The project configuration.
-- @return
--    An array of force include files with the appropriate flags.
--

	function nvcc.getforceincludes(cfg)

		-- Just pass through to Clang for now
		local flags = clang.getforceincludes(cfg)
		return flags

	end


--
-- Returns a list of include file search directories, decorated for
-- the compiler command line.
--
-- @param cfg
--    The project configuration.
-- @param dirs
--    An array of include file search directories; as an array of
--    string values.
-- @return
--    An array of symbols with the appropriate flag decorations.
--

	function nvcc.getincludedirs(cfg, dirs)

		-- Just pass through to Clang for now
		local flags = clang.getincludedirs(cfg, dirs)
		return flags

	end


--
-- Build a list of linker flags corresponding to the settings in
-- a particular project configuration.
--
-- @param cfg
--    The project configuration.
-- @return
--    An array of linker flags.
--

	nvcc.ldflags = {
		flags = {
			NoClosureCompiler = "",  -- TODO...
			NoMinifyJavaScript = "",
			IgnoreDynamicLinking = "",
		},
		kind = {
			HTMLPage = function(cfg)
				-- ???
			end,
			SharedLib = function(cfg)
				local r = { iif(cfg.system == premake.MACOSX, "-dynamiclib", "-shared") }
				if cfg.system == "windows" and not cfg.flags.NoImportLib then
					table.insert(r, '-Wl,--out-implib="' .. cfg.linktarget.relpath .. '"')
				end
				return r
			end,
			WindowedApp = function(cfg)
				if cfg.system == premake.WINDOWS then return "-mwindows" end
			end,
		},
		linkeroptimize = {  -- TODO...
			Off = "",
			Simple = "",
			On = "",
			Unsafe = ""
		},
		typedarrays = {
			None = "",
			Parallel = "",
			Shared = ""
		}
	}

	function nvcc.getldflags(cfg)
		local flags = config.mapFlags(cfg, nvcc.ldflags)
		return flags
	end



--
-- Build a list of additional library directories for a particular
-- project configuration, decorated for the tool command line.
--
-- @param cfg
--    The project configuration.
-- @return
--    An array of decorated additional library directories.
--

	function nvcc.getLibraryDirectories(cfg)

		-- Just pass through to Clang for now
		local flags = clang.getLibraryDirectories(cfg)
		return flags

	end


--
-- Build a list of libraries to be linked for a particular project
-- configuration, decorated for the linker command line.
--
-- @param cfg
--    The project configuration.
-- @param systemOnly
--    Boolean flag indicating whether to link only system libraries,
--    or system libraries and sibling projects as well.
-- @return
--    A list of libraries to link, decorated for the linker.
--

	function nvcc.getlinks(cfg, systemOnly)

		-- Just pass through to Clang for now
		local flags = clang.getlinks(cfg, systemOnly)
		return flags

	end


--
-- Return a list of makefile-specific configuration rules. This will
-- be going away when I get a chance to overhaul these adapters.
--
-- @param cfg
--    The project configuration.
-- @return
--    A list of additional makefile rules.
--

	function nvcc.getmakesettings(cfg)

		-- Just pass through to Clang for now
		local flags = clang.getmakesettings(cfg)
		return flags

	end


--
-- Retrieves the executable command name for a tool, based on the
-- provided configuration and the operating environment. I will
-- be moving these into global configuration blocks when I get
-- the chance.
--
-- @param cfg
--    The configuration to query.
-- @param tool
--    The tool to fetch, one of "cc" for the C compiler, "cxx" for
--    the C++ compiler, or "ar" for the static linker.
-- @return
--    The executable command name for a tool, or nil if the system's
--    default value should be used.
--

	nvcc.tools = {
		cc = "nvcc",
		cxx = "nvcc",
		ar = "ar"
	}

	function nvcc.gettoolname(cfg, tool)
		return nvcc.tools[tool]
	end
