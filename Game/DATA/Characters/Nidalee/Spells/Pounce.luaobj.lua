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
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_cougarpounce_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_cougarpounce_land.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_cougar_pounce_tar.troy"
    }
  }
}
