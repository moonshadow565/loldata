NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffName = "BladeRogue_AOE_Knives"
SpellDamageRatio = 0.5
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "talon_ult_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonshadowassaultmisbuff"
    }
  }
}
