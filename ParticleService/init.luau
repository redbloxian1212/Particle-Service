-- CONFIGURATION

local ParticleClass = require(script.ParticleClass)
local Constants = require(script.Constants)

local ParticleService = {
	_registry = {} :: { [BasePart]: boolean },
}

function ParticleService:Register(name: string, properties: any, container: BasePart)
	if self._registeredContainers[container] then
		return
	end
end

function ParticleService:SimulateAtCFrame(name: string, cframe: CFrame)
	-- some code
end

function ParticleService:SimulateAtPart(name: string, part: BasePart)
	-- some code
end

function ParticleService:Insert(name: string, props)
	-- some code
end

return ParticleService
