TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "mordakaiser_maceOfSpades_tar2.troy",
      Flags = 0,
      EffectIDVar = "aasdf",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        80,
        110,
        140,
        170,
        200
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "baseDamage"
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {
      TargetVar = "Owner",
      DestVar = "totalDamage"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "totalDamage",
      Src2Var = "baseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "bonusDamage",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src2Var = "bonusDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BaseDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      DestVarTable = "NextBuffVars",
      SrcVar = "BaseDamage"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Target",
      BuffName = "MordekaiserNukeOfTheBeastDmg",
      BuffAddType = BUFF_STACKS_AND_OVERLAPS,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 5,
      NumberOfStacks = 1,
      Duration = 0.001,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mordakaiser_maceofspades_tar2.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisernukeofthebeastdmg"
    }
  }
}
