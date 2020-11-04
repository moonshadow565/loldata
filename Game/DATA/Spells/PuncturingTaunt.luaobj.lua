NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Armordillo_ScaledPlating.dds"
TargetExecuteBuildingBlocks = {
  {
    Function = BBApplyTaunt,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Duration = 0,
      DurationByLevel = {
        1,
        1.5,
        2,
        2.5,
        3
      }
    }
  },
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "PuncturingTauntArmorDebuff",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatDehancer,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        1,
        1.5,
        2,
        2.5,
        3
      },
      TickRate = 0
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
