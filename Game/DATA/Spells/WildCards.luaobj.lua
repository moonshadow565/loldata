NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Cardmaster_PowerCard.dds"
BuffName = "Wild Cards"
AutoBuffActivateEffect = "SealFate_tar.prt"
AutoBuffActivateEffect2 = "GLOBAL_SILENCE.TROY"
AutoBuffActivateAttachBoneName2 = "head"
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sealfatemissile"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  }
}
