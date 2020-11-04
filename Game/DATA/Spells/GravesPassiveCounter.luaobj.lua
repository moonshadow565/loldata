NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "GravesTrueGrit.dds"
BuffName = "GravesPassiveCounter"
AutoBuffActivateEffect = ""
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "GravesPassiveGrit"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorAmount",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorAmount",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  }
}
