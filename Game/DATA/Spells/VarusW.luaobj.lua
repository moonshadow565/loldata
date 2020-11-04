NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "VarusW.dds"
BuffName = "VarusW"
AutoBuffActivateEffect = ""
SpellToggleSlot = 2
IsDeathRecapSource = true
PersistsThroughDeath = true
SpellFXOverrideSkins = {""}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuswdebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varuswhit.troy"
    }
  }
}
