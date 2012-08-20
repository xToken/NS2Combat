//________________________________
//
//   	NS2 Combat Mod     
//	Made by JimWest and MCMLXXXIV, 2012
//
//________________________________

// combat_CommandStation.lua

local HotReload = CombatCommandStation
if(not HotReload) then
  CombatCommandStation = {}
end

ClassHooker:Mixin("CombatCommandStation")
    
function CombatCommandStation:OnLoad()

    ClassHooker:SetClassCreatedIn("CommandStructure", "lua/CommandStructure.lua") 
    self:ReplaceClassFunction("CommandStructure", "UpdateCommanderLogin", "UpdateCommanderLogin_Hook")
	
end

function CombatCommandStation:UpdateCommanderLogin_Hook(self, force)

	self.occupied = true
    self.commanderId = Entity.invalidId
            
end

CombatCommandStation:OnLoad()
