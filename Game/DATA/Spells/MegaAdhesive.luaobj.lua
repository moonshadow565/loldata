DoesntBreakShields = true
AutoBuffActivateEffect = "RunePrison_tar.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Duration",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SlowPercent",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Duration",
      DestVarTable = "NextBuffVars",
      SrcVar = "Duration",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SlowPercent",
      DestVarTable = "NextBuffVars",
      SrcVar = "SlowPercent",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "MegaAdhesiveApplicator",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "Duration",
      DurationVarTable = "InstanceVars",
      TickRate = 0,
      CanMitigateDuration = false
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
    Params = {DestVar = "CastPos"}
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "k",
      Skin = "SpellBook1",
      AiScript = "idle.lua",
      PosVar = "CastPos",
      Team = TEAM_NEUTRAL,
      TeamVar = "TeamID",
      Stunned = true,
      Rooted = true,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = true,
      IgnoreCollision = false,
      Placemarker = true,
      VisibilitySize = 0,
      DestVar = "Other2",
      GoldRedirectTargetVar = "Nothing"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Duration",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        5.5,
        5.5,
        5.5,
        5.5,
        5.5
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SlowPercent",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.35,
        -0.45,
        -0.55,
        -0.65,
        -0.75
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other2",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.25,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
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
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "Duration",
      DurationVarTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "megaadhesiveapplicator"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "spellbook1"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  }
}
