NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Target",
      DestVar = "IsStealthed",
      Status = GetStealthed
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "HitResult", SrcValue = HIT_Normal}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "percentOfAttack",
      SrcVar = "percentOfAttack",
      SrcVarTable = "CharVars"
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Owner", DestVar = "BaseDamage"}
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "BaseDamage",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "BaseDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsStealthed",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Target"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "caitlyn_peaceMaker_tar_02.troy",
          Flags = 0,
          EffectIDVar = "asdf",
          BoneName = "spine",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          DamageByLevel = {
            40,
            70,
            100,
            130,
            160
          },
          Damage = 0,
          DamageVar = "BaseDamage",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 0,
          PercentOfAttackVar = "percentOfAttack",
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = true
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "percentOfAttack",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0.94,
          DestVar = "percentOfAttack",
          DestVarTable = "CharVars",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "percentOfAttack",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0.7,
          DestVar = "percentOfAttack",
          DestVarTable = "CharVars",
          MathOp = MO_MAX
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Target"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "caitlyn_peaceMaker_tar_02.troy",
              Flags = 0,
              EffectIDVar = "asdf",
              BoneName = "spine",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Target",
              DamageByLevel = {
                40,
                70,
                100,
                130,
                160
              },
              Damage = 0,
              DamageVar = "BaseDamage",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 0,
              PercentOfAttackVar = "percentOfAttack",
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = true
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "percentOfAttack",
              Src1VarTable = "CharVars",
              Src1Value = 0,
              Src2Value = 0.94,
              DestVar = "percentOfAttack",
              DestVarTable = "CharVars",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "percentOfAttack",
              Src1VarTable = "CharVars",
              Src1Value = 0,
              Src2Value = 0.7,
              DestVar = "percentOfAttack",
              DestVarTable = "CharVars",
              MathOp = MO_MAX
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBCanSeeTarget,
            Params = {
              ViewerVar = "Owner",
              TargetVar = "Target",
              ResultVar = "CanSee"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CanSee",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Target"}
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Target",
                  EffectName = "caitlyn_peaceMaker_tar_02.troy",
                  Flags = 0,
                  EffectIDVar = "asdf",
                  BoneName = "spine",
                  TargetObjectVar = "Owner",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Target",
                  DamageByLevel = {
                    40,
                    70,
                    100,
                    130,
                    160
                  },
                  Damage = 0,
                  DamageVar = "BaseDamage",
                  DamageType = PHYSICAL_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 0,
                  PercentOfAttackVar = "percentOfAttack",
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = true
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "percentOfAttack",
                  Src1VarTable = "CharVars",
                  Src1Value = 0,
                  Src2Value = 0.94,
                  DestVar = "percentOfAttack",
                  DestVarTable = "CharVars",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "percentOfAttack",
                  Src1VarTable = "CharVars",
                  Src1Value = 0,
                  Src2Value = 0.7,
                  DestVar = "percentOfAttack",
                  DestVarTable = "CharVars",
                  MathOp = MO_MAX
                }
              }
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_peacemaker_tar_02.troy"
    }
  }
}
