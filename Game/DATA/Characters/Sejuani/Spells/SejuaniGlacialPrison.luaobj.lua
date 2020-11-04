NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Sejuani_R.dds"
BuffName = "SejuaniGlacialPrison"
AutoBuffActivateEffect = "LOC_Stun.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = "Global_Freeze.troy"
PopupMessage1 = "game_floatingtext_Stunned"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_r_freeze.troy"
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
      Name = "sejuaniglacialprisoncheck"
    }
  }
}
