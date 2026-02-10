-- SERVICES
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- MODULE
local ParticleService = require(ReplicatedStorage.ParticleService)

-- PARTICLE CONTAINERS
local Explosion = ReplicatedStorage.Explosion

ParticleService:Register("Test", "any", Explosion)
