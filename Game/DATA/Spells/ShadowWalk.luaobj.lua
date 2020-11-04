NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
BuffTextureName = "Evelynn_ReadyToBetray.dds"
BuffName = "ShadowWalk"
AutoBuffActivateEffect = ""
SpellToggleSlot = 2
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wasstealthed"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "shadowwalk"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shadowwalk_internal"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "evelyn_invis_cas.troy"
    }
  }
}
