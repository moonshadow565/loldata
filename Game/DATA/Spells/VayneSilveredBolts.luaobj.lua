NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Vayne_SilveredBolts.dds"
BuffName = "VayneSilverBolts"
SpellToggleSlot = 2
IsDeathRecapSource = true
PersistsThroughDeath = true
SpellFXOverrideSkins = {""}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vayne_w_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vaynesilvereddebuff"
    }
  }
}
