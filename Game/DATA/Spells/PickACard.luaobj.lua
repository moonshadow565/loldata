BuffTextureName = "CardMaster_FatesGambit.dds"
BuffName = "Pick A Card"
AutoBuffActivateEffect = ""
SpellToggleSlot = 3
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Counter",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "WillRemove",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Counter",
      Src1VarTable = "InstanceVars",
      Value2 = 5,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          PosVar = "Owner",
          EffectName = "Card_Blue.troy",
          Flags = 0,
          EffectIDVar = "EffectID",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Counter",
      Src1VarTable = "InstanceVars",
      Value2 = 9,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          PosVar = "Owner",
          EffectName = "Card_Red.troy",
          Flags = 0,
          EffectIDVar = "EffectID",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          PosVar = "Owner",
          EffectName = "Card_Yellow.troy",
          Flags = 0,
          EffectIDVar = "EffectID",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcValue = 0.5,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 1,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Frozen",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ManaCostInc",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        -20,
        -30,
        -40,
        -50,
        -60
      }
    }
  },
  {
    Function = BBSetManaCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 1,
      SlotType = SpellSlots,
      Cost = 0,
      CostVar = "ManaCostInc",
      CostVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "EffectID",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 1,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseCooldown",
      SrcValue = 3
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownStat"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownStat",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src2Var = "BaseCooldown",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcVar = "NewCooldown",
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 1,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner"}
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "ManaCostInc",
      Src2VarTable = "InstanceVars",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "NewManaCostInc",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetManaCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 1,
      SlotType = SpellSlots,
      Cost = 0,
      CostVar = "NewManaCostInc"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Frozen",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Counter",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "Counter",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Counter",
          Src1VarTable = "InstanceVars",
          Value2 = 6,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "EffectID",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "Card_Red.troy",
              Flags = 0,
              EffectIDVar = "EffectID",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Counter",
          Src1VarTable = "InstanceVars",
          Value2 = 9,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "EffectID",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              PosVar = "Owner",
              EffectName = "Card_Yellow.troy",
              Flags = 0,
              EffectIDVar = "EffectID",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Counter",
          Src1VarTable = "InstanceVars",
          Value2 = 10,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "EffectID",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              PosVar = "Owner",
              EffectName = "Card_Blue.troy",
              Flags = 0,
              EffectIDVar = "EffectID",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Counter",
              DestVarTable = "InstanceVars",
              SrcValue = 0
            }
          }
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LifeTime",
      DestVarTable = "InstanceVars",
      SrcVar = "LifeTime"
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "SpellName", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "PickACard",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Frozen",
          Src1VarTable = "InstanceVars",
          Value2 = 1,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSilenceSpellSlot,
            Params = {
              SpellSlot = 1,
              SlotType = SpellSlots,
              TargetVar = "Owner",
              State = true
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Counter",
              Src1VarTable = "InstanceVars",
              Value2 = 6,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Frozen",
                  DestVarTable = "InstanceVars",
                  SrcValue = 1
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Frozen",
                  DestVarTable = "InstanceVars",
                  SrcValue = 2
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Counter",
              Src1VarTable = "InstanceVars",
              Value2 = 5,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBOverrideAutoAttack,
                Params = {
                  SpellSlot = 0,
                  SlotType = ExtraSlots,
                  OwnerVar = "Owner",
                  AutoAttackSpellLevel = 1
                }
              }
            }
          },
          {
            Function = BBElseIf,
            Params = {
              Src1Var = "Counter",
              Src1VarTable = "InstanceVars",
              Value2 = 8,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBOverrideAutoAttack,
                Params = {
                  SpellSlot = 2,
                  SlotType = ExtraSlots,
                  OwnerVar = "Owner",
                  AutoAttackSpellLevel = 1
                }
              }
            }
          },
          {
            Function = BBElseIf,
            Params = {
              Src1Var = "Counter",
              Src1VarTable = "InstanceVars",
              Value2 = 9,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBOverrideAutoAttack,
                Params = {
                  SpellSlot = 3,
                  SlotType = ExtraSlots,
                  OwnerVar = "Owner",
                  AutoAttackSpellLevel = 1
                }
              }
            }
          }
        }
      }
    }
  }
}
BuffOnPreAttackBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Frozen",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBRemoveOverrideAutoAttack,
        Params = {OwnerVar = "Owner"}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Frozen",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Counter",
          Src1VarTable = "InstanceVars",
          Value2 = 8,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBOverrideAutoAttack,
            Params = {
              SpellSlot = 2,
              SlotType = ExtraSlots,
              OwnerVar = "Owner",
              AutoAttackSpellLevel = 1
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBOverrideAutoAttack,
            Params = {
              SpellSlot = 3,
              SlotType = ExtraSlots,
              OwnerVar = "Owner",
              AutoAttackSpellLevel = 1
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Frozen",
      Src1VarTable = "InstanceVars",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBOverrideAutoAttack,
        Params = {
          SpellSlot = 0,
          SlotType = ExtraSlots,
          OwnerVar = "Owner",
          AutoAttackSpellLevel = 1
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "PickACard"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Rnd1",
          Value2 = 0.1,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Counter",
              DestVarTable = "NextBuffVars",
              SrcValue = 0
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Rnd1",
          Value2 = 0.2,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Counter",
              DestVarTable = "NextBuffVars",
              SrcValue = 1
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Rnd1",
          Value2 = 0.3,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Counter",
              DestVarTable = "NextBuffVars",
              SrcValue = 2
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Rnd1",
          Value2 = 0.4,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Counter",
              DestVarTable = "NextBuffVars",
              SrcValue = 3
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Rnd1",
          Value2 = 0.5,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Counter",
              DestVarTable = "NextBuffVars",
              SrcValue = 4
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Rnd1",
          Value2 = 0.6,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Counter",
              DestVarTable = "NextBuffVars",
              SrcValue = 5
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Rnd1",
          Value2 = 0.7,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Counter",
              DestVarTable = "NextBuffVars",
              SrcValue = 6
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Rnd1",
          Value2 = 0.8,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Counter",
              DestVarTable = "NextBuffVars",
              SrcValue = 7
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Rnd1",
          Value2 = 0.9,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Counter",
              DestVarTable = "NextBuffVars",
              SrcValue = 8
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Counter",
              DestVarTable = "NextBuffVars",
              SrcValue = 9
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillRemove",
          DestVarTable = "NextBuffVars",
          SrcValue = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 15,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 0.5,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 1,
          OwnerVar = "Owner"
        }
      }
    }
  }
}
BuffOnLaunchAttackBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Frozen",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillRemove",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "LifeTime",
          Src2VarTable = "InstanceVars",
          Src1Value = 15,
          Src2Value = 0,
          DestVar = "TimeRemaining",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TimeRemaining",
          Value2 = 0.75,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "PickACard",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 0.75,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      },
      {
        Function = BBRemoveOverrideAutoAttack,
        Params = {OwnerVar = "Owner"}
      },
      {
        Function = BBSilenceSpellSlot,
        Params = {
          SpellSlot = 1,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Frozen",
      Src1VarTable = "InstanceVars",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Frozen",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      },
      {
        Function = BBRemoveOverrideAutoAttack,
        Params = {OwnerVar = "Owner"}
      },
      {
        Function = BBSilenceSpellSlot,
        Params = {
          SpellSlot = 1,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "card_blue.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "card_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "card_yellow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "pickacard"}
  }
}
