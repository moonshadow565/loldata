NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
CastTime = 0.5
BuffTextureName = "Evelynn_ReadyToBetray.dds"
BuffName = "ShadowWalk"
SpellToggleSlot = 2
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "evelynnwarning"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "evelynnstealthmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "evelynnstealthring"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shadowwalkrevealedwarning"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "evelynnstealth"
    }
  }
}
