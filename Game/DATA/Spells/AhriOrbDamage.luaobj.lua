OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "OrbofDeceptionIsActive",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "OrbofDeceptionIsActive",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "Ahri_PassiveHeal.troy",
          Flags = 0,
          EffectIDVar = "ar",
          TargetObjectVar = "Attacker",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DrainPercent",
          DestVarTable = "NextBuffVars",
          SrcValue = 0.1166
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DrainedBool",
          DestVarTable = "NextBuffVars",
          SrcValue = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "GlobalDrain",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.01,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          PosVar = "TargetPos",
          EffectName = "Ahri_Orb_tar.troy",
          Flags = 0,
          EffectIDVar = "PH",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          PosVar = "TargetPos",
          EffectName = "Ahri_passive_tar.troy",
          Flags = 0,
          EffectIDVar = "PH",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Attacker",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Owner",
          DamageByLevel = {
            40,
            65,
            90,
            115,
            140
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.325,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "AhriSoulCrusher",
          NumStacks = 1
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "AhriSoulCrusher"
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "AhriSoulCrusher5",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 4,
              NumberOfStacks = 1,
              Duration = 2,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "Count",
              TargetVar = "Attacker",
              BuffName = "AhriSoulCrusher5"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Count",
              Value2 = 3,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Attacker",
                  AttackerVar = "Attacker",
                  BuffName = "AhriSoulCrusherCounter",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_Aura,
                  MaxStack = 9,
                  NumberOfStacks = 1,
                  Duration = 25000,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              }
            }
          }
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          PosVar = "TargetPos",
          EffectName = "Ahri_Orb_tar.troy",
          Flags = 0,
          EffectIDVar = "PH",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Attacker",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Owner",
          DamageByLevel = {
            40,
            65,
            90,
            115,
            140
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.325,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ahri_passiveheal.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globaldrain"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ahri_orb_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ahri_passive_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ahrisoulcrusher5"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ahrisoulcrushercounter"
    }
  }
}
