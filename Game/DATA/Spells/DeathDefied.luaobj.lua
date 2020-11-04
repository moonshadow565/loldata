BuffTextureName = "Lich_Untransmutable.dds"
BuffName = "Death Defied"
PersistsThroughDeath = true
Nondispellable = true
BuffOnDeathBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 60,
      OffsetAngle = 0,
      PositionVar = "Pos"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "Karthus",
      Skin = "Lich",
      AiScript = "idle.lua",
      PosVar = "Owner",
      Team = TEAM_UNKNOWN,
      TeamVar = "TeamID",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = true,
      MagicImmune = false,
      IgnoreCollision = true,
      VisibilitySize = 0,
      DestVar = "Other1",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Other1", LocationVar = "Pos"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "LichAP"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LichAP",
      DestVarTable = "NextBuffVars",
      SrcVar = "LichAP"
    }
  },
  {
    Function = BBStopChanneling,
    Params = {
      CasterVar = "Owner",
      StopCondition = ChannelingStopCondition_Cancel,
      StopSource = ChannelingStopSource_Die
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Defile"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Defile"
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Owner",
      BuffName = "DeathDefiedSpirit",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 8,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Other1",
      BuffName = "DeathDefiedSelf",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 8,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "FallenOneTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "lich"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "defile"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deathdefiedspirit"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deathdefiedself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fallenonetimer"
    }
  }
}
