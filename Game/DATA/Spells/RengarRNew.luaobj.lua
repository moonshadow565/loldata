NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "RengarUlt.dds"
BuffName = "RengarR"
AutoBuffActivateEffect = "RengarPassiveMax.troy"
AutoBuffActivateEffect2 = "vayne_ult_primary_buf_02.troy"
AutoBuffActivateAttachBoneName2 = "C_BUFFBONE_GLB_CENTER_LOC"
AutoBuffActivateEffect3 = "vayne_ult_primary_buf_03.troy"
AutoBuffActivateEffect4 = "Global_haste.troy"
AutoCooldownByLevel = {
  12,
  11,
  10,
  9,
  8
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "Rengarrnew"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Rengarrnew2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Rengarrtrack"
    }
  }
}
