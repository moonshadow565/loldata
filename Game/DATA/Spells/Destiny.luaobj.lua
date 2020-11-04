NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Destiny_temp.dds"
BuffName = "Destiny"
AutoBuffActivateEffect = "DestinyEye.troy"
AutoBuffActivateAttachBoneName = "c_buffbone_glb_layout_loc"
SpellDamageRatio = 0.75
AutoCooldownByLevel = {
  150,
  135,
  120
}
SpellFXOverrideSkins = {
  "UnderworldTwistedFate"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "destiny_marker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "gate"}
  }
}
