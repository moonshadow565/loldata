NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Cryophoenix_FrigidOrb.dds"
BuffName = "GragasBarrelRollMissile"
SpellToggleSlot = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbarrelrollboom"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbarrelrollrender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbarrelrollmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbarrelroll"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbarrelrolltoggle"
    }
  }
}
