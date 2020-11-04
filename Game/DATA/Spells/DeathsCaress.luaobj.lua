NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "Sion_DeathsCaress.dds"
BuffName = "Death's Caress"
AutoBuffActivateEffect = "DeathsCaress_buf.troy"
OnPreDamagePriority = 3
DoOnPreDamageInExpirationOrder = true
AutoBuffActivateEvent = "DeathsCaress_buf.prt"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deathscaress"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "deathscaress_nova.prt"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deathscaressfull"
    }
  }
}
