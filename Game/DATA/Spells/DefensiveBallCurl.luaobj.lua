NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffName = "DefensiveBallCurl"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorAmount",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageReturn",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBPushCharacterData,
    Params = {
      SkinName = "Armordillo_DBC",
      TargetVar = "Owner",
      IDVar = "CasterID",
      IDVarTable = "InstanceVars",
      OverrideSpells = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "DefensiveBallCurl_buf",
      Flags = 0,
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 0,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBPopCharacterData,
    Params = {
      TargetVar = "Owner",
      IDVar = "CasterID",
      IDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "DBC_out.troy",
      Flags = 0,
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 0,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorAmount",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorAmount",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnBeingHitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_TURRET}
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          TargetVar = "Attacker",
          Damage = 0,
          DamageVar = "DamageReturn",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_REACTIVE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.25,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "Thornmail_tar.troy",
          Flags = 0,
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "DefensiveBallCurl"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "DefensiveBallCurl"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ArmorAmount",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            50,
            75,
            100,
            125,
            150
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageReturn",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            26,
            32,
            38,
            44,
            50
          }
        }
      },
      {
        Function = BBGetTeamID,
        Params = {
          TargetVar = "Owner",
          DestVar = "CasterID",
          DestVarTable = "NextBuffVars"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "DefensiveBallCurl",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 6,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "armordillo_dbc"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "dbc_out.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "thornmail_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "defensiveballcurl"
    }
  }
}
