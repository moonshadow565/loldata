BuffTextureName = "Summoner_rally.dds"
BuffName = "Rally Aura"
AutoBuffActivateEffect = "Divineblessing_buf.troy"
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBSetReturnValue,
    Params = {SrcValue = false}
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusHealth",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "WillPumpAP",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "FinalHPRegen",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "summoner_flash.troy",
      Flags = 0,
      EffectIDVar = "ar",
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
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Owner",
      Damage = 5000,
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "BonusHealth",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetStunned
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetMagicImmune
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
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillPumpAP",
          DestVarTable = "NextBuffVars",
          SrcVar = "WillPumpAP",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "FinalHPRegen",
          DestVarTable = "NextBuffVars",
          SrcVar = "FinalHPRegen",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBForEachUnitInTargetAreaAddBuff,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 850,
          Flags = "AffectFriends AffectMinions AffectHeroes NotAffectSelf ",
          BuffAttackerVar = "Attacker",
          BuffName = "BeaconAuraNoParticle",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_Aura,
          BuffMaxStack = 1,
          BuffNumberOfStacks = 1,
          BuffDuration = 1.1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_flash.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "beaconauranoparticle"
    }
  }
}
