OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageToDeal",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Attacker",
      Damage = 0,
      DamageVar = "DamageToDeal",
      DamageVarTable = "InstanceVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnDealDamageBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "DamageAmount",
      Src1Value = 0.25,
      Src2Value = 0,
      DestVar = "ShieldAmount",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      PARType = PAR_SHIELD,
      DeltaVar = "ShieldAmount"
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "DamageAmount",
      HealerVar = "Owner"
    }
  }
}
