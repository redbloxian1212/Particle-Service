task.wait(3)

-- SERVICES
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- MODULE
local ParticleService = require(ReplicatedStorage.ParticleService)

-- PARTICLE CONTAINERS
local Explosion = ReplicatedStorage.Explosion

ParticleService:Register("Test", Explosion)

local testParts = workspace.Test:GetChildren()

local start = tick()
while task.wait() do
	if tick() - start > 10 then
		break
	end

	for _, part in testParts do
		ParticleService:SimulateAtPart("Test", part)
	end
end
