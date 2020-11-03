OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Udyr_Tiger_buf.troy",
      Flags = 0,
      EffectIDVar = "lhand",
      EffectIDVarTable = "InstanceVars",
      BoneName = "L_Finger",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Udyr_Tiger_buf_R.troy",
      Flags = 0,
      EffectIDVar = "rhand",
      EffectIDVarTable = "InstanceVars",
      BoneName = "R_Finger",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "lhand",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "rhand",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "TeamID"}
          },
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "baseDamage",
              SrcValueByLevel = {
                30,
                80,
                130,
                180,
                230
              }
            }
          },
          {
            Function = BBGetTotalAttackDamage,
            Params = {TargetVar = "Owner", DestVar = "TAD"}
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "TAD",
              Src1Value = 0,
              Src2Value = 1.5,
              DestVar = "DotDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DotDamage",
              Src2Var = "baseDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DotDamage",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DotDamage",
              Src1Value = 0,
              Src2Value = 0.25,
              DestVar = "DotDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DotDamage",
              DestVarTable = "NextBuffVars",
              SrcVar = "DotDamage"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "UdyrTigerPunchBleed",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Damage,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 2,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "UdyrTigerShred",
              ResetDuration = 0
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
      Name = "udyr_tiger_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyr_tiger_buf_r.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrtigerpunchbleed"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrtigershred"
    }
  }
}
