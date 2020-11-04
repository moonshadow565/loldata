OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorCount",
      DestVarTable = "CharVars",
      SrcValue = 1
    }
  }
}
BuffOnBeingHitBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorCount",
      DestVarTable = "NextBuffVars",
      SrcVar = "ArmorCount",
      SrcVarTable = "CharVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PoppyDefenseOfDemacia",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 10,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ArmorCount",
      Src1VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "ArmorCount",
      DestVarTable = "CharVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ArmorCount",
      Src1VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 20,
      DestVar = "ArmorCount",
      DestVarTable = "CharVars",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "poppydef_buf.troy",
      Flags = 0,
      EffectIDVar = "A",
      BoneName = "L_finger",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppydefenseofdemacia"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "poppydef_buf.troy"
    }
  }
}
