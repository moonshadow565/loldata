BuffTextureName = "3017_Egitai_Twinsoul.dds"
BuffName = "AhriSoulCrusher"
AutoBuffActivateEffect = "PotionofElusiveness_itm.troy"
AutoBuffActivateEffect2 = "PotionofBrilliance_itm.troy"
AutoBuffActivateEffect3 = "PotionofGiantStrength_itm.troy"
PersistsThroughDeath = true
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "FoxFireIsActive",
      DestVarTable = "CharVars",
      SrcValue = 0
    }
  }
}
