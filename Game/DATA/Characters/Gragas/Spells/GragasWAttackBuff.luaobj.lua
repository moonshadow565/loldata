NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "GragasDrunkenRageAttack.dds"
BuffName = "GragasDrunkenRageAttackBuff"
AutoBuffActivateEffect = "Gragas_Base_W_Buf_Hands.troy"
AutoBuffActivateAttachBoneName = "L_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect2 = "Gragas_Base_W_Buf_Hands.troy"
AutoBuffActivateAttachBoneName2 = "R_BUFFBONE_GLB_HAND_LOC"
AutoCooldownByLevel = {
  50,
  50,
  50,
  50,
  50
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Gragas_Base_W_Tar.troy"
    }
  }
}
