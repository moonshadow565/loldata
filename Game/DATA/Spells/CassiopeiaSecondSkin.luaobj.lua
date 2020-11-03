NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Cassiopeia_DeadlyCadence.dds"
BuffName = "CassiopeiaSecondSkin"
AutoBuffActivateEffect = "Judicator_buf.troy"
AutoBuffActivateAttachBoneName = "root"
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TestAmount",
      DestVarTable = "InstanceVars",
      SrcVar = "SecondSkin",
      SrcVarTable = "CharVars"
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "SecondSkin",
      ValueVarTable = "CharVars",
      Index = 1
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "SecondSkin",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "SecondSkin",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "HealthPercent",
      OwnerVar = "Owner",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "HealthPercent",
      Value2 = 0.5,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "TestAmount",
          Src1VarTable = "InstanceVars",
          Src2Var = "SecondSkinMR",
          Src2VarTable = "CharVars",
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "TestAmount",
              DestVarTable = "InstanceVars",
              SrcVar = "SecondSkin",
              SrcVarTable = "CharVars"
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "SecondSkin",
              ValueVarTable = "CharVars",
              Index = 1
            }
          }
        }
      }
    }
  }
}
