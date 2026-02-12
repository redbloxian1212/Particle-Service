-- ParticleService.luau | SRC | redbloxian1212
-- Created 02-10-26 23:15
-- Format: MM-DD-YY HH:MM

local ParticleClass = require(script.ParticleClass)
local Constants = require(script.Constants)

local Prefix = "[Particle Service]"
local ERRORS = {
	DUPLICATED_REGISTER = `{Prefix} Duplicate registration: `,
	NOT_REGISTERED = `{Prefix} No particle registered with name: `,
	NEED_STRING = `{Prefix} Expected string, got: `,
	NEED_PART = `{Prefix} Expected BasePart, got: `,
	NEED_CFRAME = `{Prefix} Expected CFrame, got: `,
}

local ParticleService = {
	_lastCleanup = 0,
	_cache = {} :: typeof(ParticleClass),
}

function ParticleService:Register(name: string, container: Attachment)
	if self._cache[name] then
		warn(ERRORS.DUPLICATED_REGISTER .. container:GetFullName())
		return
	end
	if typeof(name) ~= "string" then
		warn(ERRORS.NEED_STRING .. typeof(name))
		return
	end
	if not (typeof(container) == "Instance" and container:IsA("Attachment")) then
		warn(ERRORS.NEED_PART .. typeof(container))
		return
	end

	self._cache[name] = ParticleClass.new(container, Constants.TARGET_POOL_SIZE)
end

function ParticleService:SimulateAtCFrame(name: string, cframe: CFrame)
	if typeof(name) ~= "string" then
		warn(ERRORS.NEED_STRING .. typeof(name))
		return
	end
	if typeof(cframe) ~= "CFrame" then
		warn(ERRORS.NEED_CFRAME .. typeof(cframe))
		return
	end

	local obj = self._cache[name]
	if obj then
		obj:Simulate(cframe)
	end
end

function ParticleService:SimulateAtPart(name: string, part: BasePart)
	local obj = self._cache[name]
	if obj then
		obj:Simulate(part)
	end
end

return ParticleService
