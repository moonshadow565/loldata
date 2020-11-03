NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "KogMaw_IcathianSurprise.dds"
BuffName = "KogMawIcathianDisplay"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {
      TargetVar = "Owner",
      DestVar = "LevelDamage"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "LevelDamage",
      Src1Value = 0,
      Src2Value = 25,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDamage",
      Src1Value = 0,
      Src2Value = 100,
      DestVar = "TotalDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TotalDamage",
      Index = 1
    }
  }
}
