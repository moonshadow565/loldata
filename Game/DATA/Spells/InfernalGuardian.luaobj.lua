NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 0.5
IsPetDurationBuff = true
function UpdateBuffs(A0_0, A1_1, A2_2, A3_3)
  if A2_2 < 1 then
    SetScaleSkinCoef(A2_2, A1_1)
  end
end
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "TargetPos",
          EffectName = "InfernalGuardian_tar.troy",
          Flags = 0,
          EffectIDVar = "a",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 100,
          SendIfOnScreenOrDiscard = true
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "TargetPos",
          EffectName = "InfernalGuardian_tar.troy",
          Flags = 0,
          EffectIDVar = "a",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 100,
          SendIfOnScreenOrDiscard = true
        }
      }
    }
  },
  {
    Function = BBSpawnPet,
    Params = {
      Name = "Tibbers",
      Skin = "bear",
      Buff = "InfernalGuardian",
      Duration = 60,
      PosVar = "TargetPos",
      HealthBonus = 0,
      DamageBonus = 0,
      HealthBonusByLevel = {
        0,
        400,
        800,
        600,
        800
      },
      DamageBonusByLevel = {
        0,
        25,
        50
      },
      DestVar = "Other1"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageAmount",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        40,
        60,
        80
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Owner",
      BuffName = "InfernalGuardianBurning",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 60,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
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
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        200,
        325,
        450
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.7,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "infernalguardian_tar.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "bear"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infernalguardian"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infernalguardianburning"
    }
  },
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
