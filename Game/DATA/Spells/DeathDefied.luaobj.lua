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
      BuffName = "FallenOne",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 8,
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
    Params = {
      Name = "deathdefiedspirit"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "fallenone"}
  }
}
