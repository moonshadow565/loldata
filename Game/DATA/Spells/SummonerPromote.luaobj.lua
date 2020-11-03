NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRedirectGold,
    Params = {RedirectSourceVar = "Owner", RedirectTargetVar = "Attacker"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      PosVar = "Owner",
      EffectName = "Summoner_Flash.troy",
      Flags = 0,
      EffectIDVar = "aras",
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
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusHealth",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Attacker",
      DestVar = "OwnerTeamID"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "OwnerTeamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBPushCharacterData,
        Params = {
          SkinName = "Summoner_Rider_Order",
          TargetVar = "Owner",
          IDVar = "SkinName2",
          OverrideSpells = true
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBPushCharacterData,
        Params = {
          SkinName = "Summoner_Rider_Chaos",
          TargetVar = "Owner",
          IDVar = "SkinName2",
          OverrideSpells = false
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "BonusHealth",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.9,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ArmorBonus",
          DestVarTable = "NextBuffVars",
          SrcValue = 30
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageBonus",
          DestVarTable = "NextBuffVars",
          SrcValue = 13
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 800,
          Flags = "AffectFriends AffectMinions AffectHeroes ",
          IteratorVar = "Unit"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "PromoteAura",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      }
    }
  }
}
AdjustCooldownBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "SummonerCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "SummonerCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownMultiplier",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "CooldownMultiplier",
          Src1Value = 300,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "PromoteCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCooldown",
          Src2Var = "PromoteCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_SUBTRACT
        }
      }
    }
  },
  {
    Function = BBSetReturnValue,
    Params = {
      SrcVar = "BaseCooldown"
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PromoteBuff"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "PromoteBuff"
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetUnitSkinName,
    Params = {TargetVar = "Target", DestVar = "SkinName"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SkinName",
      Value2 = "bear",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "SlotName",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellName
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SlotName",
          Value2 = "SummonerPromote",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 0,
              OwnerVar = "Owner"
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
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 1,
              OwnerVar = "Owner"
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SkinName",
      Value2 = "BantamTrap",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "SlotName",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellName
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SlotName",
          Value2 = "SummonerPromote",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 0,
              OwnerVar = "Owner"
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
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 1,
              OwnerVar = "Owner"
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SkinName",
      Value2 = "SummonerBeacon",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "SlotName",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellName
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SlotName",
          Value2 = "SummonerPromote",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 0,
              OwnerVar = "Owner"
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
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 1,
              OwnerVar = "Owner"
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SkinName",
      Value2 = "BantamTrap",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "SlotName",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellName
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SlotName",
          Value2 = "SummonerPromote",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 0,
              OwnerVar = "Owner"
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
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 1,
              OwnerVar = "Owner"
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SkinName",
      Value2 = "SightWard",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "SlotName",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellName
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SlotName",
          Value2 = "SummonerPromote",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 0,
              OwnerVar = "Owner"
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
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 1,
              OwnerVar = "Owner"
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SkinName",
      Value2 = "Blue_Minion_MechMelee",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "SlotName",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellName
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SlotName",
          Value2 = "SummonerPromote",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 0,
              OwnerVar = "Owner"
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
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 1,
              OwnerVar = "Owner"
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SkinName",
      Value2 = "Red_Minion_MechMelee",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "SlotName",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellName
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SlotName",
          Value2 = "SummonerPromote",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 0,
              OwnerVar = "Owner"
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
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 1,
              OwnerVar = "Owner"
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SkinName",
      Value2 = "Jester",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "SlotName",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellName
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SlotName",
          Value2 = "SummonerPromote",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 0,
              OwnerVar = "Owner"
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
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 1,
              OwnerVar = "Owner"
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SkinName",
      Value2 = "JackintheBox",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "SlotName",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellName
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SlotName",
          Value2 = "SummonerPromote",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 0,
              OwnerVar = "Owner"
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
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 1,
              OwnerVar = "Owner"
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SkinName",
      Value2 = "H28GEvolutionTurret",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "SlotName",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellName
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SlotName",
          Value2 = "SummonerPromote",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 0,
              OwnerVar = "Owner"
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
              SrcValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              SpellSlotValue = 1,
              OwnerVar = "Owner"
            }
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Summoner_Cast.troy",
          Flags = 0,
          EffectIDVar = "CastParticle",
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
        Function = BBIf,
        Params = {
          Src1Var = "PromoteArmorBonus",
          Src1VarTable = "AvatarVars",
          Value2 = 20,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BonusArmor",
              DestVarTable = "NextBuffVars",
              SrcVar = "PromoteArmorBonus",
              SrcVarTable = "AvatarVars"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "TurretBait",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 3600,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      },
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "OwnerLevel",
          Src1Value = 0,
          Src2Value = 160,
          DestVar = "BonusHealth",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusHealth",
          DestVarTable = "NextBuffVars",
          SrcVar = "BonusHealth"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3600,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "Stun",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.63,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Target",
          Delta = 10000,
          HealerVar = "Target"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_flash.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "summoner_rider_order"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "summoner_rider_chaos"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "promoteaura"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "promotebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "turretbait"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "stun"}
  }
}
