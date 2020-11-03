NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "GemKnight_Radiance.dds"
BuffName = "RadianceAura"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageIncrease",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_HERO},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageIncrease",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 3,
          DestVar = "DamageIncrease",
          DestVarTable = "InstanceVars",
          MathOp = MO_DIVIDE
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "DamageIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
