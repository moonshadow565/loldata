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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleSup",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
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
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
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
      },
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
      }
    }
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
      BuffType = BUFF_Invulnerability,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 10,
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
      Value2 = 400,
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
      Value2 = 300,
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
      Value2 = 200,
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
      Value2 = 100,
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
      MovementOrdersType = CANCEL_ORDER
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
