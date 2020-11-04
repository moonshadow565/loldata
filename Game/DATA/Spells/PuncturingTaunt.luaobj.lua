NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Armordillo_ScaledPlating.dds"
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorDebuff",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -10,
        -15,
        -20,
        -25,
        -30
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "tauntDuration",
      SrcValueByLevel = {
        1,
        1.5,
        2,
        2.5,
        3
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "PuncturingTauntArmorDebuff",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatDehancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "tauntDuration",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBApplyTaunt,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Duration = 0,
      DurationVar = "tauntDuration"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "puncturingtauntarmordebuff"
    }
  }
}
