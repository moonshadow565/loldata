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
      OwnerVar = "Attacker",
      CasterVar = "Attacker",
      BuffName = "SwainMetamorphism"
    },
    SubBlocks = {
      {
        Function = BBPushCharacterData,
        Params = {
          SkinName = "Swain_noBird",
          TargetVar = "Attacker",
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
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Owner",
      Damage = 0,
      DamageVar = "DamagePerHalfSecond",
      DamageVarTable = "InstanceVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLPERSIST,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.25,
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
      OwnerVar = "Attacker",
      CasterVar = "Attacker",
      BuffName = "SwainMetamorphism"
    },
    SubBlocks = {
      {
        Function = BBPopAllCharacterData,
        Params = {TargetVar = "Attacker"}
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "SwainBeamTransition"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "SwainBeamTransition"
        }
      }
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "SwainBeamSelf"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
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
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Owner",
          Damage = 0,
          DamageVar = "DamagePerHalfSecond",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLPERSIST,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.25,
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
      Name = "swain_nobird"
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
