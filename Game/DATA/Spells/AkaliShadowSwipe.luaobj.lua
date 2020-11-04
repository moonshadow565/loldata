NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 0.5
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "katarinaqmarkspellshieldcheck"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "akali_mark_impact_tar.troy"
    }
  }
}
