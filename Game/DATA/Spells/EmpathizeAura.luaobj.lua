BuffTextureName = "FallenAngel_Empathize.dds"
BuffName = "Empathize"
AutoBuffActivateEffect = "Empathize_buf.troy"
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentSpellVampMod,
      TargetVar = "Owner",
      DeltaVar = "VampPercent",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "VampPercent",
      DestVarTable = "InstanceVars",
      SrcValue = 0.15
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "VampPercent",
      Src2VarTable = "InstanceVars",
      Src1Value = 100,
      Src2Value = 0,
      DestVar = "TooltipAmount",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TooltipAmount",
      Index = 1
    }
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
      DestVar = "newVampPercent",
      SrcValueByLevel = {
        0.15,
        0.15,
        0.15,
        0.15,
        0.15,
        0.15,
        0.25,
        0.25,
        0.25,
        0.25,
        0.25,
        0.25,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "newVampPercent",
      Src2Var = "VampPercent",
      Src2VarTable = "InstanceVars",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "VampPercent",
          DestVarTable = "InstanceVars",
          SrcVar = "newVampPercent"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "VampPercent",
          Src2VarTable = "InstanceVars",
          Src1Value = 100,
          Src2Value = 0,
          DestVar = "TooltipAmount",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "TooltipAmount",
          Index = 1
        }
      }
    }
  }
}
