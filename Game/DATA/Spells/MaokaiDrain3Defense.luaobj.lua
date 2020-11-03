BuffTextureName = "Maokai_VengefulMaelstromBuff.dds"
BuffName = "MaokaiDrainDefense"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TargetPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DefenseBonus",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CCReduction",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageType",
      Value2 = TRUE_DAMAGE,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Attacker",
          Value2 = true,
          CompareOp = CO_IS_NOT_TURRET
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DrainAmount",
              SrcVar = "DamageAmount"
            }
          },
          {
            Function = BBSetBuffCasterUnit,
            Params = {CasterVar = "Caster"}
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src2Var = "DefenseBonus",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "DefenseBonus",
              Src2VarTable = "InstanceVars",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "DamageAbsorbed",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DrainAmount",
              Src2Var = "DamageAbsorbed",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DrainAmount",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DrainAmount",
              DestVarTable = "NextBuffVars",
              SrcVar = "DrainAmount"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Caster",
              AttackerVar = "Attacker",
              BuffName = "MaokaiDrain3Tally",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 25000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Caster",
              CasterVar = "Caster",
              BuffName = "MaokaiDrain3Toggle"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "TargetPos",
                  SrcVar = "TargetPos",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Caster",
                  AttackerVar = "Caster",
                  BuffName = "MaokaiDrain3Toggle",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "TargetPos",
                  EffectName = "maoki_torrent_damage_pulse.troy",
                  Flags = 0,
                  EffectIDVar = "Particle4",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Nothing",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_NEUTRAL,
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false
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
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaidrain3tally"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaidrain3toggle"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maoki_torrent_damage_pulse.troy"
    }
  }
}
