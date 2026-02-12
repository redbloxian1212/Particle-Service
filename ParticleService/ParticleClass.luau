-- Particle.lua | SRC | redbloxian1212
-- Created 02-10-26 23:15
-- Format: MM-DD-YY HH:MM

local ParticleClass = {}
ParticleClass.__index = ParticleClass

function ParticleClass.new(container: Attachment, maxActive: number)
	local self = setmetatable({}, ParticleClass)

	self._maxActive = maxActive or 100
	self._cursor = 1
	self._instances = table.create(self._maxActive)

	-- PRE-CACHE EVERYTHING UPFRONT
	for i = 1, self._maxActive do
		local clone = container:Clone()
		local emitters = {}

		-- Cache emitters for this specific clone
		for _, obj in ipairs(clone:GetDescendants()) do
			if obj:IsA("ParticleEmitter") then
				table.insert(emitters, obj)
				obj.Enabled = false
			end
		end

		-- Store the instance and its emitters together
		self._instances[i] = {
			Root = clone,
			Emitters = emitters,
		}

		clone.Parent = workspace.Terrain
	end

	return self
end

function ParticleClass:Simulate(target: CFrame | BasePart)
	-- Get the next instance in the circle
	local entry = self._instances[self._cursor]
	local root = entry.Root
	local emitters = entry.Emitters

	-- Convert target to CFrame
	local targetCFrame = (typeof(target) == "Instance" and target:IsA("BasePart")) and target.CFrame or target

	root.WorldCFrame = targetCFrame
	for _, emitter in ipairs(emitters) do
		emitter:Emit(emitter:GetAttribute("EmitCount") or 1)
	end

	-- Advance the cursor (Wrap around to 1 if we hit maxActive)
	self._cursor = (self._cursor % self._maxActive) + 1
end

return ParticleClass
