BuffTextureName = "SwainDecrepify.dds"
BuffName = "SwainBeamDamage"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamagePerHalfSecond",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "SwainMetamorphism"
    },
    SubBlocks = {
      {
        Function = BBPushCharacterData,
        Params = {
          SkinName = "SwainNoBird",
          TargetVar = "Owner",
          IDVar = "CasterID",
          IDVarTable = "InstanceVars",
          OverrideSpells = false
        }
      }
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Owner",
      TargetVar = "Attacker",
      Damage = 0,
      DamageVar = "DamagePerHalfSecond",
      DamageVarTable = "InstanceVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLPERSIST,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.3,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "SwainMetamorphism"
    },
    SubBlocks = {
      {
        Function = BBPopAllCharacterData,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SwainBeamTransition"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "SwainBeamTransition",
          ResetDuration = 0
        }
      }
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SwainBeamSelf",
      ResetDuration = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          CallForHelpAttackerVar = "Owner",
          TargetVar = "Attacker",
          Damage = 0,
          DamageVar = "DamagePerHalfSecond",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLPERSIST,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.3,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "swainmetamorphism"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "swainnobird"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "swainbeamtransition"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "swainbeamself"
    }
  }
}
