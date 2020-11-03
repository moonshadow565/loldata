NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Sona_SongofDiscordGold.dds"
BuffName = "OdinShamanBuff"
AutoBuffActivateEffect = "bloodboil_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "bloodboil_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetScaleSkinCoef,
    Params = {Scale = 1.15, OwnerVar = "Owner"}
  }
}
OnBuffDeactivateBuildingBlocks = {}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetScaleSkinCoef,
    Params = {Scale = 1.15, OwnerVar = "Owner"}
  }
}
BuffOnPreDealDamageBuildingBlocks = {
  {
    Function = BBGetUnitSkinName,
    Params = {TargetVar = "Target", DestVar = "TargetName"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageMultiplier",
      SrcValue = 1.5
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TargetName",
      Value2 = "OdinChaosGuardian",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageMultiplier",
          SrcValue = 1
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TargetName",
      Value2 = "OdinOrderGuardian",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageMultiplier",
          SrcValue = 1
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TargetName",
      Value2 = "OdinNeutralGuardian",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageMultiplier",
          SrcValue = 1
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageMultiplier",
      Src2Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageAmount",
      MathOp = MO_MULTIPLY
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "DamageAmount",
      MathOp = MO_MULTIPLY
    }
  }
}
