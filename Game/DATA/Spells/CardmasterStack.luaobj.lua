NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Cardmaster_RapidToss.dds"
BuffName = "CardMasterStack"
IsDeathRecapSource = true
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "underworldcardmasterstackattack_tar.troy"
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
