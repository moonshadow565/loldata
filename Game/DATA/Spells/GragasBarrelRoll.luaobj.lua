NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
SpellToggleSlot = 1
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TargetPos",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnMissileEndBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "GragasBarrelRollMissile",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
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
        Function = BBSpawnMinion,
        Params = {
          Name = "DoABarrelRoll",
          Skin = "TestCube",
          AiScript = "idle.lua",
          PosVar = "TargetPos",
          Team = TEAM_CASTER,
          TeamVar = "TeamID",
          Stunned = false,
          Rooted = true,
          Silenced = false,
          Invulnerable = true,
          MagicImmune = true,
          IgnoreCollision = true,
          VisibilitySize = 0,
          DestVar = "Other1",
          GoldRedirectTargetVar = "Owner"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Other1",
          BuffName = "GragasBarrelRollBoom",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageLevel",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        100,
        150,
        200,
        250,
        300
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      DestVarTable = "NextBuffVars",
      SrcVar = "TargetPos"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "GragasBarrelRoll",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Attacker",
      TargetVar = "Nothing",
      PosVar = "TargetPos",
      EndPosVar = "TargetPos",
      SlotNumber = 0,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbarrelrollboom"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbarrelroll"
    }
  }
}
