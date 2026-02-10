-- CONFIGURATION

local ParticleClass = require(script.ParticleClass)

local ParticleService = {}

function ParticleService:Register(name: string, properties: any, container: BasePart)
	-- some code
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
