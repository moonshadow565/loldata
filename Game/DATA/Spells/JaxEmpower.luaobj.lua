NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Armsmaster_Empower.dds"
BuffName = "EmpowerCleave"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "empower_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tiamatmelee_itm.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "empowercleave"
    }
  }
}
