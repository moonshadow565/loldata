NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Vayne_SilveredBolts.dds"
BuffName = "VayneSilverBolts"
AutoBuffActivateEffect = ""
SpellToggleSlot = 2
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
