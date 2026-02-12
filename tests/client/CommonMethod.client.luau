task.wait(3)

-- SERVICES
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ExplosionTemplate = ReplicatedStorage:WaitForChild("Explosion")

local testParts = workspace.Test:GetChildren()

local start = tick()

while task.wait() do
	if tick() - start > 10 then
		break
	end

	for _, part in testParts do
		-- RAW CLONE: This simulates the overhead of not having a pool
		local clone = ExplosionTemplate:Clone()
		clone.Parent = workspace.Terrain

		if clone:IsA("Attachment") then
			clone.WorldCFrame = part.CFrame
		else
			clone.CFrame = part.CFrame
		end

		-- RAW EMIT
		for _, child in ipairs(clone:GetDescendants()) do
			if child:IsA("ParticleEmitter") then
				child:Emit(child:GetAttribute("EmitCount") or 1)
			end
		end

		task.delay(2, function()
			clone:Destroy()
		end)
	end
end
