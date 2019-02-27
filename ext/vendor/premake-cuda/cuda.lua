
	local p = premake

--
--	Set default CUDA version if "cuda_version" is not set before including this module 
--
	if cuda_version == nil then
		cuda_version = "8.0"
	end

--
-- always include _preload so that the module works even when not embedded.
--
	if premake.extensions == nil or premake.extensions.cuda == nil then
		include ( "_preload.lua" )
	end


--
-- Create an emscripten namespace to isolate the additions
--
	p.modules.cuda = {}

	local m = p.modules.cuda
	m._VERSION = "0.0.1"


	include("cuda_nvcc.lua")
	-- include("cuda_vstudio.lua")

	return m
