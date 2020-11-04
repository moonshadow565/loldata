BuffTextureName = "Galio_RunicSkin.dds"
BuffName = "GalioRunicSkin"
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSpellBlock,
    Params = {
      TargetVar = "Owner",
      DestVar = "TotalMR",
      DestVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalMR",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.6,
      DestVar = "APMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "APMod",
      Delta = 0
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "APMod",
      Index = 1
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetSpellBlock,
    Params = {
      TargetVar = "Owner",
      DestVar = "TotalMR",
      DestVarTable = "InstanceVars"
    }
  }
}
