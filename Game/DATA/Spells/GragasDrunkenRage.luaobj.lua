NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
ChannelDuration = 1
BuffTextureName = "GragasDrunkenRage.dds"
BuffName = "GragasDrunkenRage"
AutoBuffActivateEffect = "gragas_drunkenRage_attack_buf.troy"
AutoBuffActivateAttachBoneName = "L_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect2 = "gragas_drunkenRage_attack_buf.troy"
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
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasdrunkenrage"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbodyslamselfslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasdrunkenrageself"
    }
  }
}
