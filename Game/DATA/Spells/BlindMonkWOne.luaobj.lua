NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
BuffName = "BlindMonkSafeguard"
AutoCooldownByLevel = {
  22,
  18,
  14,
  10,
  6
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ShieldAbsorb",
      SrcValueByLevel = {
        40,
        80,
        120,
        160,
        200
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "BonusAP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusAP",
      Src1Value = 0,
      Src2Value = 0.8,
      DestVar = "BonusAP80",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ShieldAbsorb",
      Src2Var = "BonusAP80",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ShieldAbsorb",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ShieldAbsorb",
      DestVarTable = "NextBuffVars",
      SrcVar = "ShieldAbsorb"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Target",
      Src2Var = "Attacker",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "OwnerPos",
          EffectName = "blindMonk_W_cas_01.troy",
          Flags = 0,
          EffectIDVar = "p3",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_NEUTRAL,
          FOWVisibilityRadius = 900,
          SendIfOnScreenOrDiscard = true,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Target", PositionVar = "TargetPos"}
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetMovementSpeed,
          TargetVar = "Owner",
          DestVar = "MoveSpeed"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MoveSpeed",
          Src1Value = 0,
          Src2Value = 1350,
          DestVar = "dashSpeed",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Owner",
          ObjectVar2 = "Target"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TargetPos",
          DestVarTable = "NextBuffVars",
          SrcVar = "TargetPos"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Distance",
          DestVarTable = "NextBuffVars",
          SrcVar = "Distance"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "dashSpeed",
          DestVarTable = "NextBuffVars",
          SrcVar = "dashSpeed"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Target",
          BuffName = "BlindMonkWOneDash",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0.25,
          CanMitigateDuration = false,
          IsHiddenOnClient = true
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "BlindMonkWManager",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Target",
          AttackerVar = "Nothing",
          BuffName = "SharedWardBuff"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "Destealth",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 2,
              BuffVarsTable = "NextBuffVars",
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
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "BlindMonkWOneShield",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "BlindMonkWManager",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_w_cas_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkwonedash"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkwmanager"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sharedwardbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkwoneshield"
    }
  }
}
