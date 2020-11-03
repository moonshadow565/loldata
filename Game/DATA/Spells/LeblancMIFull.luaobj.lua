OnBuffActivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "LeblancPassive"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "LeblancPassive",
          ResetDuration = 0
        }
      }
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
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
          BindObjectVar = "Owner",
          EffectName = "LeblancImage.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          BoneName = "root",
          TargetObjectVar = "Target",
          TargetBoneName = "root",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
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
          BindObjectVar = "Owner",
          EffectName = "LeblancImage.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          BoneName = "root",
          TargetObjectVar = "Target",
          TargetBoneName = "root",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanCast
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      PosVar = "Owner",
      EffectName = "leblanc_mirrorimage_death.troy",
      Flags = 0,
      EffectIDVar = "hi",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetInvulnerable
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Owner",
      TargetVar = "Owner",
      Damage = 10000,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageAmount",
      MathOp = MO_MULTIPLY
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancpassive"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblancimage.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_mirrorimage_death.troy"
    }
  }
}
