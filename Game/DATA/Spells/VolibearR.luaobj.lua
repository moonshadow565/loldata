NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Minotaur_Pulverize.dds"
BuffName = "VolibearR"
AutoBuffActivateEffect = ""
SpellDamageRatio = 0.75
PopupMessage1 = "game_floatingtext_Knockup"
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "VolibearRDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        75,
        115,
        155
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "VolibearRSpeed",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0,
        0,
        0
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "VolibearRRatio",
      DestVarTable = "NextBuffVars",
      SrcValue = 0.3
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "VolibearRCharges",
      SrcValueByLevel = {
        4,
        5,
        6
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "VolibearRApplicator",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        12,
        12,
        12
      },
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = true}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearrapplicator"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearrchargetracker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearpassiveheal"
    }
  }
}
