BuffTextureName = "BlindMonkPassive.dds"
BuffName = "BlindMonkFlurry"
AutoBuffActivateEffect = "blindMonk_passive_buf.troy"
AutoBuffActivateAttachBoneName = "L_hand"
AutoBuffActivateEffect2 = "blindMonk_passive_buf.troy"
AutoBuffActivateAttachBoneName2 = "R_hand"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = 0.5
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TotalHits",
      DestVarTable = "InstanceVars",
      SrcValue = 2
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = 0.5
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 10,
      PARType = PAR_ENERGY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalHits",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "TotalHits",
      DestVarTable = "InstanceVars",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TotalHits",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
