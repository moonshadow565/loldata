NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Shen_StandUnited.dds"
BuffName = "Shen Stand United Shield"
AutoBuffActivateEffect = "Shen_StandUnited_shield_v2.troy"
AutoBuffActivateEvent = "DeathsCaress_buf.prt"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "shieldHealth",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "shieldHealth",
      ValueVarTable = "InstanceVars",
      Index = 1
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "shieldHealth",
      Src1VarTable = "InstanceVars",
      Src2Var = "DamageAmount",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "shieldHealth",
          Src1VarTable = "InstanceVars",
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "shieldHealth",
          DestVarTable = "InstanceVars",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageAmount",
          SrcValue = 0
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "shieldHealth",
          ValueVarTable = "InstanceVars",
          Index = 1
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "shieldHealth",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "shieldHealth",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      },
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
