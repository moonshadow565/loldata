AutoBuffActivateEffect = "maokai_sapling_activated_indicator.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_CHEST_LOC"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatBubbleRadiusMod,
      TargetVar = "Owner",
      Delta = 690
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatBubbleRadiusMod,
      TargetVar = "Owner",
      Delta = 690
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBAddPosPerceptionBubble,
    Params = {
      TeamVar = "TeamID",
      Radius = 250,
      PosVar = "TargetPos",
      Duration = 1,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "asdf"
    }
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBDistanceBetweenPoints,
    Params = {
      DestVar = "Distance",
      Point1Var = "TargetPos",
      Point2Var = "OwnerPos"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "k",
      Skin = "TestCubeRender10Vision",
      AiScript = "idle.lua",
      PosVar = "TargetPos",
      Team = TEAM_NEUTRAL,
      TeamVar = "TeamID",
      Stunned = true,
      Rooted = true,
      Silenced = false,
      Invulnerable = true,
      MagicImmune = true,
      IgnoreCollision = true,
      Placemarker = true,
      VisibilitySize = 1,
      DestVar = "Other2",
      GoldRedirectTargetVar = "Attacker"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other2",
      AttackerVar = "Attacker",
      BuffName = "MaokaiSapling2",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
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
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Other2",
      PosVar = "TargetPos",
      EndPosVar = "TargetPos",
      OverrideCastPosition = false,
      SlotNumber = 2,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = false,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other2",
      AttackerVar = "Attacker",
      BuffName = "ExpirationTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender10vision"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaisapling2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaisapling2boom"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaisaplingmine"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maoki_sapling_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "maokai_sproutling"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maoki_sapling_detonate.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maokai_sapling_rdy_indicator_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maokai_sapling_rdy_indicator_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maokai_sapling_team_id_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maokai_sapling_team_id_red.troy"
    }
  }
}
