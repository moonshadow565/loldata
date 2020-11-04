OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackCounter",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "AttackCounter",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "AttackCounter",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "AttackCounter",
      Src1VarTable = "InstanceVars",
      Value2 = 4,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 100,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_PROC,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "AttackCounter",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "SpiralBlade_tar.troy",
          Flags = 0,
          EffectIDVar = "part",
          BoneName = "spine",
          TargetObjectVar = "Target",
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "spiralblade_tar.troy"
    }
  }
}
