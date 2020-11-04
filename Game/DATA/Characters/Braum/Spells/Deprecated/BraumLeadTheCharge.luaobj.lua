NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Sivir_R.dds"
BuffName = "On The Hunt"
AutoBuffActivateEffect = "Temp_Braum_RBuffShout.troy"
AutoBuffActivateAttachBoneName = "C_Buffbone_Glb_Layout_Loc"
AutoCooldownByLevel = {
  90,
  90,
  90
}
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_Braum_rbuffshout.troy"
    }
  }
}
