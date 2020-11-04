BuffTextureName = "3069_Sword_of_Light_and_Shadow.dds"
BuffName = "Mourning"
AutoBuffActivateEffect = "Global_Mortal_Strike.troy"
AutoBuffActivateAttachBoneName = "head"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentHPRegenMod,
      TargetVar = "Owner",
      Delta = -0.65
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentHPRegenMod,
      TargetVar = "Owner",
      Delta = 0.65
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Owner",
          Damage = 4,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_PERIODIC,
          PercentOfAttack = 1,
          SpellDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
BuffOnHealBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "Health",
      Src1Value = 0,
      Src2Value = 0.35,
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
