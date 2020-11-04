AutoBuffActivateEffect = "LuxLightstrike_mis.troy"
AutoBuffActivateAttachBoneName = "root"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Position",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Level",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "LSCooldown",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 2,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "LuxLightstrikeToggle",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Position",
      SrcVar = "Position",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "Position",
      EffectName = "LuxLightstrike_mis.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamOfOwner",
      FOWVisibilityRadius = 400,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "Position",
      EffectName = "LuxLightstrike_tar_green.troy",
      EffectNameForOtherTeam = "LuxLightstrike_tar_red.troy",
      Flags = 0,
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars",
      EffectID2Var = "Particle2",
      EffectID2VarTable = "InstanceVars",
      BoneName = "top",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamOfOwner",
      FOWVisibilityRadius = 400,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Attacker",
      State = false
    }
  },
  {
    Function = BBAddPosPerceptionBubble,
    Params = {
      TeamVar = "TeamOfOwner",
      Radius = 650,
      PosVar = "Position",
      Duration = 6,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BoomDamage",
      SrcValueByLevel = {
        60,
        105,
        150,
        195,
        240
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Position",
      SrcVar = "Position",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "Position",
      Range = 350,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "BoomDamage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.6,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "globalhit_mana.troy",
          Flags = 0,
          EffectIDVar = "PartExplodeHit",
          TargetObjectVar = "Unit",
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
        Function = BBIf,
        Params = {Src1Var = "Unit", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "LuxIlluminatingFraulein",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatDehancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 6,
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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 2,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "LuxLightstrikeKugel",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownStat"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownStat",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src2Var = "LSCooldown",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "NewCooldown",
      SlotNumber = 2,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "CasterID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CasterID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "Position",
          EffectName = "LuxBlitz_nova.troy",
          Flags = 0,
          EffectIDVar = "PartExplode",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 250,
          SendIfOnScreenOrDiscard = true,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
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
          BindObjectVar = "Nothing",
          PosVar = "Position",
          EffectName = "LuxBlitz_nova.troy",
          Flags = 0,
          EffectIDVar = "PartExplode",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 250,
          SendIfOnScreenOrDiscard = true,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  },
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.2,
        -0.24,
        -0.28,
        -0.32,
        -0.36
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Position",
      SrcVar = "Position",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Position",
      Range = 300,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "Slow",
          BuffAddType = BUFF_STACKS_AND_OVERLAPS,
          StacksExclusive = true,
          BuffType = BUFF_Slow,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
SpellOnMissileEndBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LSCooldown",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        9,
        9,
        9,
        9,
        9
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Position",
      DestVarTable = "NextBuffVars",
      SrcVar = "MissileEndPosition"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0.25,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Attacker",
      State = true
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SlotNumber = 2,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "luxlightstriketoggle"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "luxlightstrike_mis.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "luxlightstrike_tar_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "luxlightstrike_tar_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "globalhit_mana.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "luxilluminatingfraulein"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "luxlightstrikekugel"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "luxblitz_nova.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
