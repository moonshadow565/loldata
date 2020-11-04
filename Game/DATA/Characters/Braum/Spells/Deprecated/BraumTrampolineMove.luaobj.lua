NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
AutoBuffActivateEffect = "Interventionspeed_buf.troy"
SpellFXOverrideSkins = {
  "HeadhunterNidalee"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Braumspringboardmsboostmaster"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braum_trampoline_move_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braum_trampoline_move_land.troy"
    }
  }
}
