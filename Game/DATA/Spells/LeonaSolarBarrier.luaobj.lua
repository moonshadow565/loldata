NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "LeonaSolarBarrier.dds"
BuffName = "LeonaSolarBarrier"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
SpellToggleSlot = 2
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MagicDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DefenseBonus",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Leona_SolarBarrier_buf.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars",
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
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle1",
      OverrideAnim = "Spell2_idle",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle2",
      OverrideAnim = "Spell2_idle",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle3",
      OverrideAnim = "Spell2_idle",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle4",
      OverrideAnim = "Spell2_idle",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack1",
      OverrideAnim = "Spell2_attack",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack2",
      OverrideAnim = "Spell2_attack",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack3",
      OverrideAnim = "Spell2_attack",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Crit",
      OverrideAnim = "Spell2_attack",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Run",
      OverrideAnim = "Spell2_run",
      OwnerVar = "Owner"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TargetStruck",
          SrcValue = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MagicDamage",
          SrcVar = "MagicDamage",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 450,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "TargetStruck",
              SrcValue = true
            }
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "LeonaSunlight",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatDehancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 3.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "MagicDamage",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.4,
              PhysicalDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Unit",
              EffectName = "Leona_SolarBarrier_tar.troy",
              Flags = 0,
              EffectIDVar = "TargetParticle",
              TargetObjectVar = "Unit",
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
          }
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Idle1", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Idle2", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Idle3", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Idle4", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Attack1", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Attack2", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Attack3", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Crit", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TargetStruck",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "Owner",
              EffectName = "Leona_SolarBarrier_nova.troy",
              Flags = 0,
              EffectIDVar = "Temp",
              TargetObjectVar = "Target",
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
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DefenseBonus",
              DestVarTable = "NextBuffVars",
              SrcVar = "DefenseBonus",
              SrcVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "LeonaSolarBarrier2",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 3,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
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
              BindObjectVar = "Nothing",
              PosVar = "Owner",
              EffectName = "Leona_SolarBarrier_nova_whiff.troy",
              Flags = 0,
              EffectIDVar = "Temp",
              TargetObjectVar = "Target",
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
          }
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DefenseBonus",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        30,
        40,
        50,
        60,
        70
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MagicDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        60,
        110,
        160,
        210,
        260
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "LeonaSolarBarrier",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leona_solarbarrier_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leonasolarbarrier3.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leonasolarbarrier2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leonasolarbarrier1.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leonasunlight"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leona_solarbarrier_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leonasolarbarrier"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leona_solarbarrier_nova.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leonasolarbarrier2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leonasolarbarriertracker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leona_solarbarrier_nova_whiff.troy"
    }
  }
}
