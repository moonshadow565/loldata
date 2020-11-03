NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Armsmaster_Empower.dds"
BuffName = "EmpowerCleave"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "relentlessassaultmarker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "empower_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "empowercleave"
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
    Params = {Name = "empower"}
  }
}
