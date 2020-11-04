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
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardiansuppression"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardianbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "crashboom.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
