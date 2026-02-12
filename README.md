# ParticleService

---

## Quick Usage Guide

### 1. Prepare the Attachment
* Create an **Attachment**.
* Place your **ParticleEmitters** inside it.
* **Optional:** Add a Number Attribute named `EmitCount` to each emitter to control burst size. Defaults to 1.

### 2. Registration (Run Once)
You must register your particles before using them to pre-allocate the memory pool.
The name must be unique as it is will be used across your scripts, I highly suggest you put them in a separate module if you are working with a bigger project.

```lua
local ParticleService = require(path.to.ParticleService)
local myEffect = path.to.attachment.with.particle.emitters

ParticleService:Register("Explosion", myEffect)
```

### 3. Usage
As of now there are only 2 methods, `SimulateAtCFrame` and `SimulateAtPart` which explains what they do. 
But why do this? Why cant we just have `SimulateAtCFrame` alone?
Well incase the server wants to simulate an effect at a moving BasePart, its much better to pass a reference to the BasePart so the client simulates it **exactly** at the current CFrame of the basepart on their copy.
Prevents the visual delay that happens when the server and clients does not have the same exact state of the game due to latency.

```lua
local ParticleService = require(path.to.ParticleService)
local myEffect = path.to.attachment.with.particle.emitters

ParticleService:SimulateAtCFrame("Explosion", myEffect)
ParticleService:SimulateAtPart("Explosion", myEffect)
```

---
 
### Relief
Now you don't have to spam this snippet on your entire module!
```lua
for _,v in x:GetChildren() do
    if v:IsA("ParticleEmitter") then
        v:Emit()
    end
end
```

---

Thats all! Thank you for checking my module out, let me know if it has bugs.