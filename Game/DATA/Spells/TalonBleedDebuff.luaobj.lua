DoesntTriggerSpellCasts = true
BuffTextureName = "TalonNoxianDiplomacy.dds"
BuffName = "Bleed"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "talon_q_bleed_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "talon_q_bleed.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  }
}
