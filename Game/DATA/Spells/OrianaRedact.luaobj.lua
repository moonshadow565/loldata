NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "3114_Malady.dds"
BuffName = "Malady"
SpellVOOverrideSkins = {"BroOlaf"}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Hit",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBDestroyMissile,
    Params = {MissileIDVar = "MissileID", MissileIDVarTable = "CharVars"}
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  }
}
SpellOnMissileEndBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CorrectSpell",
      SrcValue = false
    }
  },
  {
    Function = BBGetBuffRemainingDuration,
    Params = {
      DestVar = "Duration",
      TargetVar = "Owner",
      BuffName = "OrianaRedact"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "orianaredact",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CorrectSpell",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "OrianaRedact",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CorrectSpell",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CorrectSpell",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Hit",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "GhostAlive",
          DestVarTable = "CharVars",
          SrcValue = false
        }
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "OrianaRedact"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Duration",
      Value2 = 0.01,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Found", SrcValue = false}
      },
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "MissileEndPosition",
          Range = 25000,
          Flags = "AffectFriends AffectMinions AffectHeroes AffectUntargetable ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          BuffNameFilter = "OrianaGhost",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "Found", SrcValue = true}
          }
        }
      },
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "MissileEndPosition",
          Range = 25000,
          Flags = "AffectFriends AffectMinions AffectHeroes AffectUntargetable ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          BuffNameFilter = "OrianaGhostSelf",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "Found", SrcValue = true}
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Found",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "TeamID"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "MissileEndPosition",
              EffectName = "Orianna_Ball_Flash.troy",
              Flags = 0,
              EffectIDVar = "Temp",
              BoneName = "root",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "OrianaGhostSelf",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 25000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "Orianna_Ball_Flash_Reverse.troy",
              Flags = 0,
              EffectIDVar = "Temp",
              BoneName = "SpinnigBottomRidge",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Caster",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBDestroyMissile,
    Params = {MissileIDVar = "MissileID", MissileIDVarTable = "CharVars"}
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamageBlock",
      SrcValueByLevel = {
        80,
        120,
        160,
        200,
        240
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "SelfAP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SelfAP",
      Src1Value = 0,
      Src2Value = 0.6,
      DestVar = "BonusShield",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusShield",
      Src2Var = "BaseDamageBlock",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalShield",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "TotalShield",
      Src1Value = 0.75,
      Src2Value = 0,
      DestVar = "HalfShield",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Target",
      Src2Var = "Owner",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Target",
          AttackerVar = "Owner",
          BuffName = "OrianaRedactTarget"
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_DEAD},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Owner",
                  BuffName = "OrianaGhost",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 25000,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageBlock",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "TotalShield"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Owner",
                  BuffName = "OrianaRedactShield",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Target",
                  BuffName = "OrianaRedactTarget"
                }
              }
            }
          },
          {
            Function = BBDestroyMissile,
            Params = {
              MissileIDVar = "MissileNetworkID"
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Target",
          Src2Var = "Owner",
          CompareOp = CO_DIFFERENT_TEAM
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "TotalDamage",
              DestVarTable = "NextBuffVars",
              SrcVar = "HalfShield"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "OrianaRedactDamage",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Target",
          AttackerVar = "Owner",
          BuffName = "OrianaRedactTarget"
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "OrianaGhostSelf",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 25000,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageBlock",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "TotalShield"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "OrianaRedactShield",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Target",
                  BuffName = "OrianaRedactTarget"
                }
              }
            }
          },
          {
            Function = BBDestroyMissile,
            Params = {
              MissileIDVar = "MissileNetworkID"
            }
          }
        }
      }
    }
  }
}
BuffOnLaunchMissileBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MissileID",
      DestVarTable = "CharVars",
      SrcVar = "missileId"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "GhostAlive",
      DestVarTable = "CharVars",
      SrcValue = true
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaredact"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghost"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghostself"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianna_ball_flash.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianna_ball_flash_reverse.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaredacttarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaredactshield"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaredactdamage"
    }
  }
}
