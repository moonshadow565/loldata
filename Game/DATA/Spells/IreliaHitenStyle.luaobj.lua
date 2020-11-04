NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Irelia_HitenStyleReady.dds"
BuffName = "IreliaHitenStyle"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = ""
AutoBuffActivateAttachBoneName4 = ""
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_hitenstyle_passive.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_hitenstlye_passive_glow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ireliahitenstylecharged"
    }
  }
}
