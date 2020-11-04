NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Sivir_Deadeye.dds"
BuffName = "On The Hunt"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "OntheHuntBase_buf.troy"
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = ""
AutoBuffActivateAttachBoneName4 = ""
AutoCooldownByLevel = {
  90,
  90,
  90
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "onthehuntaurabuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "onthehunt"}
  }
}
