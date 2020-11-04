BuffTextureName = "Tristana_ExplosiveShot.dds"
BuffName = "Explosive Shot Debuff"
AutoBuffActivateEffect = "ExplosiveShot_buf.troy"
AutoBuffActivateAttachBoneName = "head"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Owner",
      Damage = 0,
      DamageVar = "DamageAmount",
      DamageVarTable = "InstanceVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentHPRegenMod,
      TargetVar = "Owner",
      Delta = -0.5
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageAmount",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentHPRegenMod,
      TargetVar = "Owner",
      Delta = 0.5
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Owner",
      Damage = 0,
      DamageVar = "DamageAmount",
      DamageVarTable = "InstanceVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_PERIODIC,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnHealBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "Health",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "EffectiveHeal",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetReturnValue,
    Params = {
      SrcVar = "EffectiveHeal"
    }
  }
}
