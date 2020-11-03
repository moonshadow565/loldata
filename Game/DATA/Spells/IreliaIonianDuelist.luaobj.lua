BuffTextureName = "Irelia_IonianFervor.dds"
BuffName = "IreliaIonianDuelist"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Attacker",
      BuffName = "IreliaIonianDuelist"
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "IreliaIonianDuelist"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Value = 0,
              Src2Value = 10,
              DestVar = "TotalBonus",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "irelia_new_passive_01.troy",
              Flags = 0,
              EffectIDVar = "Particle1",
              EffectIDVarTable = "InstanceVars",
              BoneName = "BUFFBONE_CSTM_BACK_2",
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
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 2,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Value = 0,
              Src2Value = 25,
              DestVar = "TotalBonus",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "irelia_new_passive_02.troy",
              Flags = 0,
              EffectIDVar = "Particle1",
              EffectIDVarTable = "InstanceVars",
              BoneName = "BUFFBONE_CSTM_BACK_2",
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
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 3,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "LastCount",
              Src1VarTable = "InstanceVars",
              Value2 = 3,
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Value = 0,
                  Src2Value = 40,
                  DestVar = "TotalBonus",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "irelia_new_passive_03.troy",
                  Flags = 0,
                  EffectIDVar = "Particle1",
                  EffectIDVarTable = "InstanceVars",
                  BoneName = "BUFFBONE_CSTM_BACK_2",
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
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LastCount",
          DestVarTable = "InstanceVars",
          SrcVar = "Count"
        }
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TotalBonus",
      Index = 1
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ireliaionianduelist"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_new_passive_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_new_passive_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_new_passive_03.troy"
    }
  }
}
