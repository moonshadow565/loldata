NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Summoner_revive.dds"
BuffName = "SummonerReviveSpeedBoost"
AutoBuffActivateEffect = "ArmordilloSpin.troy"
AutoBuffActivateEffect2 = "Powerball_buf.troy"
SpellToggleSlot = 1
AutoBuffActivateEffectFlags = EFFCREATE_UPDATE_ORIENTATION
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "MoveSpeedMod",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.045,
      DestVar = "MoveSpeedMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "MoveSpeedMod",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MoveSpeedMod",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
