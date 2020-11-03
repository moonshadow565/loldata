NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
SpellDamageRatio = 0.5
SpellOnMissileEndBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "Level", Info = GetCastSpellLevelPlusOne}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "baseDamageBlock",
      SrcValueByLevel = {
        80,
        105,
        130,
        155,
        180
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Attacker",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.35,
      DestVar = "BonusHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "baseDamageBlock",
      Src2Var = "BonusHealth",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageBlock",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageBlock",
      DestVarTable = "NextBuffVars",
      SrcVar = "DamageBlock"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "LuxPrismaticWaveShieldSelf",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
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
TargetExecuteBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Attacker",
      Src2Var = "Target",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "baseDamageBlock",
          SrcValueByLevel = {
            80,
            105,
            130,
            155,
            180
          }
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "AbilityPower"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AbilityPower",
          Src1Value = 0,
          Src2Value = 0.35,
          DestVar = "BonusHealth",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "baseDamageBlock",
          Src2Var = "BonusHealth",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageBlock",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageBlock",
          DestVarTable = "NextBuffVars",
          SrcVar = "DamageBlock"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "LuxPrismaticWaveShield",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
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
    Function = BBPreloadSpell,
    Params = {
      Name = "luxprismaticwaveshieldself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "luxprismaticwaveshield"
    }
  }
}
