NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Blitzcrank_StaticField.dds"
BuffName = "StaticField"
AutoBuffActivateEffect = "StaticField_ready.troy"
AutoBuffActivateAttachBoneName = "c_buffbone_glb_Center_loc"
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
    Function = BBPreloadParticle,
    Params = {
      Name = "staticfield_nova.troy"
    }
  }
}
