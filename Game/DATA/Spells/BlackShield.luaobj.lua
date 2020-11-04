NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "FallenAngel_BlackShield.dds"
BuffName = "Black Shield"
AutoBuffActivateEffect = "Global_Spellimmunity.troy"
AutoCooldownByLevel = {
  16,
  16,
  16,
  16,
  16
}
OnPreDamagePriority = 2
DoOnPreDamageInExpirationOrder = true
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Fear,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Net,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Silence,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Sleep,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Slow,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Snare,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Stun,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Taunt,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Blind,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Suppression,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = true}
          }
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ShieldHealth",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  },
  {
    Function = BBIncreaseShield,
    Params = {
      UnitVar = "Owner",
      AmountVar = "ShieldHealth",
      AmountVarTable = "InstanceVars",
      Amount = 0,
      MagicShield = true,
      PhysicalShield = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanCast
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ShieldHealth",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBRemoveShield,
        Params = {
          UnitVar = "Owner",
          AmountVar = "ShieldHealth",
          AmountVarTable = "InstanceVars",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = false
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "ShieldHealth",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "oldArmorAmount",
      DestVarTable = "InstanceVars",
      SrcVar = "ShieldHealth",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageType",
      Value2 = MAGIC_DAMAGE,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "ShieldHealth",
          Src1VarTable = "InstanceVars",
          Src2Var = "DamageAmount",
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "ShieldHealth",
              Src1VarTable = "InstanceVars",
              Src2Var = "DamageAmount",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "ShieldHealth",
              DestVarTable = "InstanceVars",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DamageAmount",
              SrcValue = 0
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "oldArmorAmount",
              Src1VarTable = "InstanceVars",
              Src2Var = "ShieldHealth",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "oldArmorAmount",
              DestVarTable = "InstanceVars",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBReduceShield,
            Params = {
              UnitVar = "Owner",
              AmountVar = "oldArmorAmount",
              AmountVarTable = "InstanceVars",
              Amount = 0,
              MagicShield = true,
              PhysicalShield = false
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
              Src2Var = "ShieldHealth",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "ShieldHealth",
              DestVarTable = "InstanceVars",
              SrcValue = 0
            }
          },
          {
            Function = BBReduceShield,
            Params = {
              UnitVar = "Owner",
              AmountVar = "oldArmorAmount",
              AmountVarTable = "InstanceVars",
              Amount = 0,
              MagicShield = true,
              PhysicalShield = false
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseHealth",
      SrcValueByLevel = {
        95,
        160,
        225,
        290,
        355
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.7,
      DestVar = "AbilityPowerMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPowerMod",
      Src2Var = "BaseHealth",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ShieldHealth",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ShieldHealth",
      DestVarTable = "NextBuffVars",
      SrcVar = "ShieldHealth"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_SpellImmunity,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        5,
        5,
        5,
        5,
        5
      },
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
