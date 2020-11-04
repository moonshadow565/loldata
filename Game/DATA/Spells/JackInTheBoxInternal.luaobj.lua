OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TargetPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusHealth",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "FearDuration",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      SrcVar = "TargetPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusHealth",
      DestVarTable = "NextBuffVars",
      SrcVar = "BonusHealth",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "Jack In The Box",
      Skin = "JackInTheBox",
      AiScript = "turret.lua",
      PosVar = "TargetPos",
      Team = TEAM_CASTER,
      TeamVar = "TeamID",
      Stunned = false,
      Rooted = false,
      Silenced = true,
      Invulnerable = false,
      MagicImmune = false,
      IgnoreCollision = true,
      VisibilitySize = 500,
      DestVar = "Other3",
      GoldRedirectTargetVar = "Attacker"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "FearDuration",
      DestVarTable = "NextBuffVars",
      SrcVar = "FearDuration",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Attacker",
      BuffName = "JackInTheBox",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 90,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jackinthebox"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "jackinthebox"
    }
  }
}
