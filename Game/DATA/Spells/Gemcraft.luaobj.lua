NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "GemKnight_Gemcraft.dds"
BuffName = "Gemcraft"
PersistsThroughDeath = true
Nondispellable = true
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Dodge,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "HitResult",
          Value2 = HIT_Miss,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "DamageAmount",
              Src1Value = 0.075,
              Src2Value = 0,
              DestVar = "DamagePercent",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBIncMana,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              DeltaVar = "DamagePercent"
            }
          }
        }
      }
    }
  }
}
