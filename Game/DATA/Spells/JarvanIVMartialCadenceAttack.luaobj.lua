TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthPerc",
      SrcValueByLevel = {
        0.06,
        0.06,
        0.06,
        0.06,
        0.06,
        0.06,
        0.08,
        0.08,
        0.08,
        0.08,
        0.08,
        0.08,
        0.1,
        0.1,
        0.1,
        0.1,
        0.1,
        0.1
      }
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "TargetHealth",
      OwnerVar = "Target",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TargetHealth",
      Src2Var = "HealthPerc",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealthDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "HealthDamage",
      Src1Value = 400,
      Src2Value = 0,
      DestVar = "HealthDamage",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "HealthDamage",
      Src1Value = 2,
      Src2Value = 0,
      DestVar = "HealthDamage",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "HealthDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_PROC,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseDamage"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BaseDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "JarvanIVMartialCadenceCheck",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 6,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "jarvincritattack_tar.troy",
      Flags = 0,
      EffectIDVar = "c",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = false}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivmartialcadencecheck"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvincritattack_tar.troy"
    }
  }
}
