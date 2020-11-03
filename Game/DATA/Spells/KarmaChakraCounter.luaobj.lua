NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "CardMaster_FatesGambit.dds"
BuffName = "Pick A Card"
AutoBuffActivateEffect = ""
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaonemantraparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmatwomantraparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmachakra"
    }
  }
}
