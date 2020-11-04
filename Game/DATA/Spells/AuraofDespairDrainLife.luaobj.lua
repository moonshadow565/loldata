BuffTextureName = "SadMummy_AuraofDespair.dds"
BuffName = "AuraofDespairDamage"
AutoBuffActivateEffect = "Despair_tar.troy"
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "LifeLossPercent",
      RequiredVarTable = "InstanceVars"
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
        Function = BBGetManaOrHealth,
        Params = {
          DestVar = "Temp1",
          OwnerVar = "Owner",
          Function = GetMaxHealth
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Temp1",
          Src2Var = "LifeLossPercent",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "PercentDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Owner",
          Damage = 0,
          DamageVar = "PercentDamage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0
        }
      }
    }
  }
}
