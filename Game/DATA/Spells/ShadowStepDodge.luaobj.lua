BuffTextureName = "Katarina_Shunpo.dds"
BuffName = "ShadowStepDodge"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Level",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Owner",
      FadeAmount = 0.5,
      fadeTime = 0.1,
      IDVar = "ID",
      IDVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Owner",
      FadeAmount = 1,
      fadeTime = 0.5,
      IDVar = "ID",
      IDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "Level",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatDodgeMod,
      TargetVar = "Owner",
      Delta = 0,
      DeltaByLevel = {
        0.3,
        0.4,
        0.5,
        0.6,
        0.7
      }
    }
  }
}
