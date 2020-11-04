NotSingleTargetSpell = false
DoesntBreakShields = true
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "luluwbuff"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lulu_w_cast_ally-audio.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lulu_w_cast_enemy-audio.troy"
    }
  }
}
