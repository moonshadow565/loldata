NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Minotaur_FerociousHowl.dds"
BuffName = "Ferocious Howl"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
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
    Params = {Name = "blank.troy"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odinneutralguardian_stone.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinsuperminion"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinminiontaunt"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "odinminion"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "goldaquisition_glb.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardiansuppression"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinminionspellattack"
    }
  }
}
