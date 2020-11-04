NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
ChannelDuration = 1.25
BuffTextureName = "Caitlyn_AceintheHole.dds"
BuffName = "CaitlynAceintheHole"
AutoBuffActivateEffect = "caitlyn_ace_target_indicator.troy"
AutoBuffActivateEffect2 = "caitlyn_ace_target_indicator_02.troy"
AutoBuffActivateAttachBoneName2 = ""
ChannelingStartBuildingBlocks = {
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "Target"}
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Target",
      BuffName = "CaitlynAceintheHole",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.5,
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
      EffectName = "caitlyn_laser_beam_01.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_CSTM_WEAPON_5",
      TargetObjectVar = "Target",
      TargetBoneName = "spine",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Attacker", Value = true}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "Team"}
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "Team",
      Radius = 150,
      TargetVar = "Target",
      Duration = 2.5,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = false
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Target",
      DestVar = "IsStealthed",
      Status = GetStealthed
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "Target"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "Team"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsStealthed",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Target",
          PosVar = "Target",
          EndPosVar = "Target",
          OverrideCastPosition = false,
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "ParticleID",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetDodgePiercing,
        Params = {TargetVar = "Attacker", Value = false}
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "IfHasBuffCheck",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2.5,
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
        Function = BBCanSeeTarget,
        Params = {
          ViewerVar = "Owner",
          TargetVar = "Target",
          ResultVar = "CanSee"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CanSee",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Owner",
              TargetVar = "Target",
              PosVar = "Target",
              EndPosVar = "Target",
              OverrideCastPosition = false,
              SlotNumber = 0,
              SlotType = ExtraSlots,
              OverrideForceLevel = 0,
              OverrideForceLevelVar = "Level",
              OverrideCoolDownCheck = true,
              FireWithoutCasting = true,
              UseAutoAttackSpell = false,
              ForceCastingOrChannelling = false,
              UpdateAutoAttackTimer = false
            }
          },
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "ParticleID",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSetDodgePiercing,
            Params = {TargetVar = "Attacker", Value = false}
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "IfHasBuffCheck",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 2.5,
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
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 5,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              SpellSlotValue = 3,
              OwnerVar = "Owner"
            }
          },
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "ParticleID",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSetDodgePiercing,
            Params = {TargetVar = "Attacker", Value = false}
          }
        }
      }
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcValue = 5,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 3,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Attacker", Value = false}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "caitlynaceinthehole"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_laser_beam_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ifhasbuffcheck"
    }
  }
}
