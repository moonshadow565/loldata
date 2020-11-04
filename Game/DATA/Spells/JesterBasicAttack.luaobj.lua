TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
  },
  {
    Function = BBGetChampionBySkinName,
    Params = {
      Skin = "Jester",
      Team = TEAM_UNKNOWN,
      TeamVar = "teamID",
      DestVar = "Attacker"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Attacker",
      Src2Var = "Owner",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTotalAttackDamage,
        Params = {
          TargetVar = "Attacker",
          DestVar = "TotalDamage"
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "TotalDamage",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_ATTACK,
          PercentOfAttack = 0.75,
          SpellDamageRatio = 0,
          IgnoreDamageIncreaseMods = true,
          IgnoreDamageCrit = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBGetStat,
        Params = {
          Stat = GetBaseAttackDamage,
          TargetVar = "Attacker",
          DestVar = "BaseDamage"
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "BaseDamage",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_ATTACK,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "jester"}
  }
}
