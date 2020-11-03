BuffTextureName = "Mordekaiser_IronMan.dds"
BuffName = "MordekaiserIronMan"
PersistsThroughDeath = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "MaxEnergy",
          OwnerVar = "Owner",
          Function = GetMaxPAR,
          PARType = PAR_SHIELD
        }
      },
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "Level"}
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Level",
          Src1Value = 0,
          Src2Value = 30,
          DestVar = "ShieldMax",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ShieldMax",
          Src1Value = 0,
          Src2Value = 90,
          DestVar = "ShieldMax",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "ShieldMax",
          Index = 1
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "shieldPercent",
          SrcValueByLevel = {
            25,
            25,
            25,
            25,
            25,
            25,
            27.5,
            27.5,
            27.5,
            27.5,
            27.5,
            27.5,
            30,
            30,
            30,
            30,
            30,
            30
          }
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "shieldPercent",
          Index = 2
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MaxEnergy",
          Src1Value = 0,
          Src2Value = 0.03,
          DestVar = "ShieldDecay",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ShieldDecay",
          Src1Value = 0,
          Src2Value = -1,
          DestVar = "ShieldDecay",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          PARType = PAR_SHIELD,
          DeltaVar = "ShieldDecay"
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
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "bonusDamage",
          Index = 2,
          SlotNumber = 0,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Attacker"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "bonusDamage",
          Src1Value = 0,
          Src2Value = 1.75,
          DestVar = "tooltipNumber",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "tooltipNumber",
          Index = 1,
          SlotNumber = 0,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Attacker"
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "CurrentEnergy",
      OwnerVar = "Owner",
      Function = GetPAR,
      PARType = PAR_SHIELD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "DA",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      PARType = PAR_SHIELD,
      DeltaVar = "DA"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentEnergy",
      Src2Var = "DamageAmount",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "CurrentEnergy",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      }
    }
  }
}
