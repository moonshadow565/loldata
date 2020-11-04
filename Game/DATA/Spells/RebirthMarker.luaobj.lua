BuffTextureName = "Cryophoenix_Rebirth.dds"
BuffName = "Rebirth Marker"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetBuffToolTipVar,
    Params = {Value = -40, Index = 1}
  }
}
BuffOnLevelUpBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RebirthArmorMod",
      SrcValueByLevel = {
        -40,
        -40,
        -40,
        -40,
        -25,
        -25,
        -25,
        -10,
        -10,
        -10,
        -10,
        5,
        5,
        5,
        20,
        20,
        20,
        20
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "RebirthArmorMod",
      Index = 1
    }
  }
}
