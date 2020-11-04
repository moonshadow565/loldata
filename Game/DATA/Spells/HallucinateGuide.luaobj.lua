NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "ViktorChaosStorm.dds"
BuffName = "InfernalGuardianGuide"
SpellDamageRatio = 0.5
IsPetDurationBuff = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "petcommandparticle"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cursor_moveto.troy"
    }
  }
}
