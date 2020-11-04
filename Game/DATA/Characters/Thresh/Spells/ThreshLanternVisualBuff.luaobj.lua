NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Minotaur_FerociousHowl.dds"
BuffName = "Ferocious Howl"
AutoBuffActivateAttachBoneName2 = "pelvis"
AutoCooldownByLevel = {
  120,
  100,
  80,
  10,
  10
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "thresh_lanterntimer.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinminiontaunt"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odinneutralguardian_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odinneutralguardian_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odinneutralguardian_stone.troy"
    }
  }
}
