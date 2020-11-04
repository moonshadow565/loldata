NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
SpellDamageRatio = 1
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseHealAmount",
      SrcValueByLevel = {
        100,
        150,
        200,
        250,
        300
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "AP",
      Src1Value = 0.9,
      Src2Value = 0,
      DestVar = "APMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseHealAmount",
      Src2Var = "APMod",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealAmount",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Target",
      Src2Var = "Owner",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "HealAmount",
          Src1Value = 0,
          Src2Value = 1.4,
          DestVar = "HealAmount",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "HealAmount",
          HealerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "HealAmount",
          HealerVar = "Owner"
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "Temp1",
          OwnerVar = "Target",
          Function = GetHealthPercent,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Temp1",
          Value2 = 1,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Target",
              Delta = 0,
              DeltaVar = "HealAmount",
              HealerVar = "Owner"
            }
          },
          {
            Function = BBApplyAssistMarker,
            Params = {
              Duration = 10,
              TargetVar = "Target",
              SourceVar = "Attacker"
            }
          }
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Global_Heal.troy",
          Flags = 0,
          EffectIDVar = "self",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_heal.troy"
    }
  }
}
