NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "UrgotPositionReverser.dds"
BuffName = "UrgotSwapExecute"
AutoBuffActivateEffect = ""
AutoCooldownByLevel = {
  100,
  85,
  70,
  55,
  40
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotswapdrip.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "suppression"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswaptarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapexecute"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "urgotswap2"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotswaptarget.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapdef"
    }
  }
}
