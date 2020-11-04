NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Cardmaster_RapidToss.dds"
BuffName = "CardMasterStack"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
PersistsThroughDeath = true
NonDispellable = true
SpellFXOverrideSkins = {
  "UnderworldTwistedFate"
}
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cardmasterstackparticle"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cardmasterstackattack_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cardmasterstackholder"
    }
  }
}
