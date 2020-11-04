NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "OlafRagnarok.dds"
BuffName = "OlafRagnarok"
AutoBuffActivateEffect = "olaf_ragnorok_shield_02.troy"
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "olaf_ragnorok_shield_01.troy"
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = "olaf_ragnorok_buff.troy"
AutoBuffActivateAttachBoneName3 = "L_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect4 = "olaf_ragnorok_buff.troy"
AutoBuffActivateAttachBoneName4 = "R_BUFFBONE_GLB_HAND_LOC"
AutoCooldownByLevel = {
  120,
  120,
  120
}
NonDispellable = true
SpellVOOverrideSkins = {"BroOlaf"}
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
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
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
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
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
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
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
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
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
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
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
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
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
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
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
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
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageAbsorption",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetScaleSkinCoef,
    Params = {Scale = 1.1, OwnerVar = "Owner"}
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack1",
      OverrideAnim = "Attack3",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack2",
      OverrideAnim = "Attack3",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Run",
      OverrideAnim = "Spell2",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Stun}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Net}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Fear}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Sleep}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Snare}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Slow}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Taunt}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Polymorph}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Silence}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Suppression}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetScaleSkinCoef,
    Params = {Scale = 1, OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Attack1", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Attack2", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetScaleSkinCoef,
    Params = {Scale = 1.1, OwnerVar = "Owner"}
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageAbsorption",
      Src1VarTable = "InstanceVars",
      Src2Var = "DamageAmount",
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "DamageAbsorption",
          Src2VarTable = "InstanceVars",
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
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageAbsorption",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        20,
        30,
        40
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        5,
        6.5,
        8
      },
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
