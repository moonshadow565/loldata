NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Annie_GhastlyShield.dds"
BuffName = "Molten Shield"
AutoBuffActivateEffect = "GhastlyShield_buf.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageReturn",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorAmount",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorAmount",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorAmount",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnTakeDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_MELEE},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Value1 = DAMAGESOURCE_ATTACK, CompareOp = CO_DAMAGE_SOURCETYPE_IS},
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Attacker",
                  EffectName = "AnnieSparks.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Owner",
                  TargetVar = "Attacker",
                  Damage = 0,
                  DamageVar = "DamageReturn",
                  DamageVarTable = "InstanceVars",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.2,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageReturn",
      DestVarTable = "NextBuffVars",
      SrcValue = 1,
      SrcValueByLevel = {
        20,
        30,
        40,
        50,
        60
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorAmount",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        10,
        20,
        30,
        40,
        50
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 15,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "Pyromania_particle"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Pyromania",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 5,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "anniesparks.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pyromania_particle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "pyromania"}
  }
}
