NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Karma_E1.dds"
BuffName = "KarmaQ"
AutoBuffActivateEffect = "Highlander_buf.troy"
AutoCooldownByLevel = {
  20,
  16,
  12,
  8,
  4
}
SpellVOOverrideSkins = {
  "KarmaClassic"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_e_speed_buf.troy"
    }
  }
}
