NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Rumble_Flamespitter.dds"
BuffName = "RumbleFlameThrower"
AutoCooldownByLevel = {
  20,
  16,
  12,
  8,
  4
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleflamethrowerbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleflamethrowereffect"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleflamethrower"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleoverheat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbledangerzone"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleheatdelay"
    }
  }
}
