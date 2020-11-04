OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageCount",
      DestVarTable = "CharVars",
      SrcValue = 1
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageCount",
      DestVarTable = "NextBuffVars",
      SrcVar = "DamageCount",
      SrcVarTable = "CharVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PoppyMightOfDemacia",
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
      Src1Var = "DamageCount",
      Src1VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "DamageCount",
      DestVarTable = "CharVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageCount",
      Src1VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 20,
      DestVar = "DamageCount",
      DestVarTable = "CharVars",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "poppydam_buf.troy",
      Flags = 0,
      EffectIDVar = "A",
      BoneName = "hammer_b",
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
      Name = "poppymightofdemacia"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "poppydam_buf.troy"
    }
  }
}
