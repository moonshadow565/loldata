NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Armsmaster_Empower.dds"
BuffName = "EmpowerCleave"
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
  }
}
