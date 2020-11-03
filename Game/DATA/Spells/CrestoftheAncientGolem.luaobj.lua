BuffTextureName = "48thSlave_Tattoo.dds"
BuffName = "CrestoftheAncientGolem"
AutoBuffActivateEffect = ""
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "NeutralMonster_buf_blue_defense.troy",
      Flags = 0,
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CooldownVar",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {Value = 20, Index = 1}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncPercentCooldownMod,
          TargetVar = "Owner",
          Delta = -0.2
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "MaxMana",
          OwnerVar = "Target",
          Function = GetMaxPAR,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MaxMana",
          Src1Value = 0,
          Src2Value = 0.01,
          DestVar = "ManaRegen",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncFlatPARRegenMod,
        Params = {
          PARType = PAR_MANA,
          TargetVar = "Owner",
          DeltaVar = "ManaRegen",
          Delta = 5
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "MaxEnergy",
          OwnerVar = "Target",
          Function = GetMaxPAR,
          PARType = PAR_ENERGY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MaxEnergy",
          Src1Value = 0,
          Src2Value = 0.01,
          DestVar = "EnergyRegen",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncFlatPARRegenMod,
        Params = {
          PARType = PAR_ENERGY,
          TargetVar = "Owner",
          DeltaVar = "EnergyRegen",
          Delta = 5
        }
      }
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Attacker",
      BuffName = "APBonusDamageToTowers"
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_DEAD},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "NewDuration",
              SrcValue = 150
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "MonsterBuffs"
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src2Var = "NewDuration",
                  Src1Value = 1.2,
                  Src2Value = 0,
                  DestVar = "NewDuration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "NewDuration",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPetOwner,
        Params = {PetVar = "Attacker", DestVar = "Caster"}
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Caster", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Caster", CompareOp = CO_IS_NOT_DEAD},
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "NewDuration",
                  SrcValue = 150
                }
              },
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Caster",
                  AttackerVar = "Caster",
                  BuffName = "MonsterBuffs"
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src2Var = "NewDuration",
                      Src1Value = 1.2,
                      Src2Value = 0,
                      DestVar = "NewDuration",
                      MathOp = MO_MULTIPLY
                    }
                  }
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Caster",
                  AttackerVar = "Caster",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0,
                  BuffVarsTable = "NextBuffVars",
                  DurationVar = "NewDuration",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
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
      Name = "neutralmonster_buf_blue_defense.troy"
    }
  }
}
