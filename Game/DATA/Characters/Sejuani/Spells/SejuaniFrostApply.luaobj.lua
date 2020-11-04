NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Gemknight_Dazzle.dds"
BuffName = "SejuaniGlacialPrison"
AutoBuffActivateEffect = "LOC_Stun.troy"
AutoBuffActivateAttachBoneName = "head"
AutoCooldownByLevel = {
  12,
  11,
  10,
  9,
  8
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuanifrosttracker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuanifrost"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuanifrostchaos"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuanifrostresist"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuanifrostresistchaos"
    }
  }
}
