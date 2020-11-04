NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = True
BuffTextureName = "3009_Boots_of_Teleportation.dds"
BuffName = "Calamitys Grasp"
AutoBuffActivateEffect = "Global_Freeze.troy"
OnBuffActivateBuildingBlocks = {
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
      RequiredVar = "APGrab",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "Level",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "APGrab",
      DestVarTable = "NextBuffVars",
      SrcVar = "APGrab",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "AttackerID"}
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetRandomPointInAreaPosition,
        Params = {
          PosVar = "Owner",
          Radius = 600,
          InnerRadius = 590,
          ResultVar = "MinionSpawnPos"
        }
      },
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "HiddenMinion",
          Skin = "TestCubeRender",
          AiScript = "idle.lua",
          PosVar = "MinionSpawnPos",
          Team = TEAM_CASTER,
          TeamVar = "AttackerID",
          Stunned = false,
          Rooted = true,
          Silenced = false,
          Invulnerable = true,
          MagicImmune = true,
          IgnoreCollision = true,
          VisibilitySize = 0,
          DestVar = "Other1",
          GoldRedirectTargetVar = "Attacker"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other1",
          AttackerVar = "Owner",
          BuffName = "CalamityAPTransfer",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 10,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Other1", LocationVar = "Owner"}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Other1",
          Distance = 800,
          OffsetAngle = 0,
          PositionVar = "MissileEndPos"
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Other1",
          TargetVar = "Nothing",
          PosVar = "MissileEndPos",
          EndPosVar = "MissileEndPos",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other1",
          AttackerVar = "Other1",
          BuffName = "ExpirationTimer",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 0.8,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      DestVarTable = "NextBuffVars",
      SrcVar = "Level"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "APGain"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "APGrab",
      DestVarTable = "NextBuffVars",
      SrcVar = "APGain"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Damage,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        5.9,
        8.9,
        11.9
      },
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "calamityaptransfer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  }
}
