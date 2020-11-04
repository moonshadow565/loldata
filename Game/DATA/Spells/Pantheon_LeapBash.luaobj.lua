NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
AutoBuffActivateEffect = "pantheon_aegis_self.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageLvl",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner"}
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageLvl",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        50,
        75,
        100,
        125,
        150
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Target",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Attacker",
      ObjectVar2 = "Target"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 600,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 70}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 1150}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 500,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 80}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 1150}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 375,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 100}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 1080}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 275,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 120}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 1010}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 175,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 150}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 950}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 75,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 300}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 900}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 1000}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 900}
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Distance",
      Src1Value = 420,
      Src2Value = 0,
      DestVar = "factor",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "factor",
      Src1Value = 0,
      Src2Value = 420,
      DestVar = "factor",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "factor",
      Src1Value = 0.4,
      Src2Value = 0,
      DestVar = "factor",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "factor",
      Src1Value = 0.75,
      Src2Value = 0,
      DestVar = "scaletime",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell2",
      ScaleTime = 0,
      ScaleTimeVar = "scaletime",
      TargetVar = "Attacker",
      Loop = false
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Attacker",
      TargetVar = "Target",
      Speed = 0,
      SpeedVar = "SpeedVar",
      Gravity = 0,
      GravityVar = "GravityVar",
      MoveBackBy = 200,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      IdealDistance = 0,
      IdealDistanceVar = "Distance"
    }
  }
}
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "DistanceTar",
      ObjectVar1 = "Caster",
      ObjectVar2 = "Owner"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DistanceTar",
      Value2 = 250,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Pantheon_AegisShield",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Caster"}
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          TargetVar = "Caster",
          Damage = 0,
          DamageVar = "DamageLvl",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 1,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBApplyStun,
        Params = {
          AttackerVar = "Owner",
          TargetVar = "Caster",
          Duration = 1
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheon_aegisshield"
    }
  }
}
