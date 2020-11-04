NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Blitzcrank_StaticField.dds"
BuffName = "StaticField"
AutoBuffActivateEffect = "StaticField_ready.troy"
AutoBuffActivateAttachBoneName = "weapon"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "staticfield_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "staticfield"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "staticfield_nova.prt"
    }
  }
}
