NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "MordekaiserMaceOfSpades.dds"
BuffName = "MordekaiserMaceOfSpades"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "mordakaiser_maceOfSpades_activate.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_WEAPON_1"
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = ""
NonDispellable = true
ChainMissileParameters = {
  MaximumHits = {
    4,
    4,
    4,
    4,
    4
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpellCooldown",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillRemove",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
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
      Src2Var = "SpellCooldown",
      Src2VarTable = "InstanceVars",
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
      SpellSlotValue = 0,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
      },
      {
        Function = BBElse,
        Params = {},
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
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "MordekaiserSyphonParticle",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.2,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BonusDamage",
              SrcValueByLevel = {
                20,
                40,
                60,
                80,
                100
              }
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src2Var = "BonusDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "BaseDamage",
              MathOp = MO_ADD
            }
          },
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
          },
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "UnitCount", SrcValue = 0}
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Target",
              Range = 450,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit"
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "UnitCount",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "UnitCount",
                  MathOp = MO_ADD
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "UnitCount",
              Value2 = 1,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBForNClosestUnitsInTargetArea,
                Params = {
                  AttackerVar = "Owner",
                  CenterVar = "Target",
                  Range = 450,
                  Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
                  IteratorVar = "Unit",
                  MaximumUnitsToPick = 4
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Unit",
                      Src2Var = "Target",
                      CompareOp = CO_NOT_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellCast,
                        Params = {
                          CasterVar = "Owner",
                          TargetVar = "Unit",
                          PosVar = "Target",
                          EndPosVar = "Target",
                          SlotNumber = 2,
                          SlotType = ExtraSlots,
                          OverrideForceLevel = 0,
                          OverrideForceLevelVar = "Level",
                          OverrideCoolDownCheck = true,
                          FireWithoutCasting = true,
                          UseAutoAttackSpell = false,
                          ForceCastingOrChannelling = false
                        }
                      }
                    }
                  }
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Target",
                  EffectName = "mordakaiser_maceOfSpades_tar.troy",
                  Flags = 0,
                  EffectIDVar = "a",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = true
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
                  Src1Var = "BonusDamage",
                  Src2Var = "BaseDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "BaseDamage",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Target",
                  EffectName = "mordakaiser_maceOfSpades_tar.troy",
                  Flags = 0,
                  EffectIDVar = "b",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = true
                }
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BaseDamage",
              DestVarTable = "NextBuffVars",
              SrcVar = "BaseDamage"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Target",
              BuffName = "MordekaiserMaceOfSpadesDmg",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.001,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthCost",
      SrcValueByLevel = {
        30,
        35,
        40,
        45,
        50
      }
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "Temp1",
      OwnerVar = "Owner",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "HealthCost",
      Src2Var = "Temp1",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Temp1",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "HealthCost",
          MathOp = MO_SUBTRACT
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthCost",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "HealthCost",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "HealthCost",
      HealerVar = "Owner"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellCooldown",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        8,
        7,
        6,
        5,
        4
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 10,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 0,
      OwnerVar = "Owner"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisersyphonparticle"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mordakaiser_maceofspades_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisermaceofspadesdmg"
    }
  }
}
