NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 0.5
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellWillStun",
      DestVarTable = "CharVars",
      SrcValue = false
    }
  },
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Owner",
      BuffName = "Pyromania_particle"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 1,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "SpellWillStun",
          DestVarTable = "CharVars",
          SrcValue = true
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Pyromania_particle"
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Pyromania",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 5,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        85,
        145,
        205,
        265,
        325
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.6
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellWillStun",
      Src1VarTable = "CharVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBApplyStun,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Duration = 0,
          DurationVar = "StunDuration",
          DurationVarTable = "CharVars"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pyromania_particle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "pyromania"}
  }
}
