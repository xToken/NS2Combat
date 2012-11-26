//________________________________
//
//   	NS2 Combat Mod     
//	Made by JimWest and MCMLXXXIV, 2012
//
//________________________________

// combat_CommandStructure_Hooks.lua

local HotReload = CombatCommandStructure
if(not HotReload) then
  CombatCommandStructure = {}
  ClassHooker:Mixin("CombatCommandStructure")
end
    
function CombatCommandStructure:OnLoad()

    ClassHooker:SetClassCreatedIn("CommandStructure", "lua/CommandStructure.lua") 
    self:ReplaceClassFunction("CommandStructure", "UpdateCommanderLogin", "UpdateCommanderLogin_Hook")
    self:PostHookClassFunction("CommandStructure", "OnKill", "OnKill_Hook")
	
end

function CombatCommandStructure:UpdateCommanderLogin_Hook(self, force)

	self.occupied = true
    self.commanderId = Entity.invalidId
            
end

function CombatCommandStructure:OnKill_Hook(self, attacker, doer, point, direction)

    if not Shared.GetCheatsEnabled() and GetGamerules():GetGameStarted() then
		local team = self:GetTeam()
		local losingTeam = attacker:GetTeam()
		if team == GetGamerules().team1 then
			losingTeam = GetGamerules().team2 
		else
			losingTeam = GetGamerules().team1
		end
		
		GetGamerules():EndGame(losingTeam)
    end

end

if (not HotReload) then
	CombatCommandStructure:OnLoad()
end