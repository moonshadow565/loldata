BuffTextureName = "AlZahar_SummonVoidling.dds"
BuffName = "AlZaharVoidlingPhase2"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "voidlingtransform.prt",
      Flags = 0,
      EffectIDVar = "varrr",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSetScaleSkinCoef,
    Params = {Scale = 1.5, OwnerVar = "Owner"}
  },
  {
    Function = BBGetArmor,
    Params = {TargetVar = "Owner", DestVar = "BaseArmor"}
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Owner", DestVar = "BaseDamage"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "DamageInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseArmor",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "ArmorInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetScaleSkinCoef,
    Params = {Scale = 1.5, OwnerVar = "Owner"}
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "DamageInc",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorInc",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "voidlingtransform.prt"
    }
  }
}
