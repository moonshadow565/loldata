NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "ChemicalMan_AcidSpray.dds"
BuffName = "Poison Trail"
AutoBuffActivateEffect = "AcidTrail_buf.troy"
AutoBuffActivateAttachBoneName = "bag_b"
SpellToggleSlot = 1
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "LastPosition",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamagePerTick",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ManaCost",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 25,
      OffsetAngle = 180,
      PositionVar = "CurPos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamagePerTick",
      DestVarTable = "NextBuffVars",
      SrcVar = "DamagePerTick",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "AcidTrail",
      Skin = "TestCube",
      AiScript = "idle.lua",
      PosVar = "CurPos",
      Team = TEAM_CASTER,
      TeamVar = "TeamID",
      Stunned = true,
      Rooted = false,
      Silenced = false,
      Invulnerable = true,
      MagicImmune = false,
      IgnoreCollision = true,
      Placemarker = true,
      VisibilitySize = 0,
      DestVar = "Other3",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Owner",
      BuffName = "PoisonTrailApplicator",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Damage,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LastPosition",
      DestVarTable = "InstanceVars",
      SrcVar = "CurPos"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 25,
      OffsetAngle = 180,
      PositionVar = "CurPos"
    }
  },
  {
    Function = BBDistanceBetweenPoints,
    Params = {
      DestVar = "Distance",
      Point1Var = "CurPos",
      Point2Var = "LastPosition",
      Point2VarTable = "InstanceVars"
    }
  },
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
          DestVar = "OwnerMana",
          OwnerVar = "Owner",
          Function = GetPAR,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "OwnerMana",
          Src2Var = "ManaCost",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
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
              Src2Var = "ManaCost",
              Src2VarTable = "InstanceVars",
              Src1Value = -1,
              Src2Value = 0,
              DestVar = "NegManaCost",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              PARType = PAR_MANA,
              DeltaVar = "NegManaCost"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Distance",
              Value2 = 90,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBGetTeamID,
                Params = {TargetVar = "Attacker", DestVar = "TeamID"}
              },
              {
                Function = BBGetPointByUnitFacingOffset,
                Params = {
                  UnitVar = "Owner",
                  Distance = 35,
                  OffsetAngle = 0,
                  PositionVar = "FrontPos"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamagePerTick",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "DamagePerTick",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBSpawnMinion,
                Params = {
                  Name = "AcidTrail",
                  Skin = "TestCube",
                  AiScript = "idle.lua",
                  PosVar = "FrontPos",
                  Team = TEAM_CASTER,
                  TeamVar = "TeamID",
                  Stunned = true,
                  Rooted = false,
                  Silenced = false,
                  Invulnerable = true,
                  MagicImmune = false,
                  IgnoreCollision = true,
                  Placemarker = true,
                  VisibilitySize = 0,
                  DestVar = "Other3",
                  GoldRedirectTargetVar = "Attacker"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Other3",
                  AttackerVar = "Attacker",
                  BuffName = "PoisonTrailApplicator",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Damage,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 3.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "LastPosition",
                  DestVarTable = "InstanceVars",
                  SrcVar = "CurPos"
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 90,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Attacker", DestVar = "TeamID"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamagePerTick",
          DestVarTable = "NextBuffVars",
          SrcVar = "DamagePerTick",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "AcidTrail",
          Skin = "TestCube",
          AiScript = "idle.lua",
          PosVar = "CurPos",
          Team = TEAM_CASTER,
          TeamVar = "TeamID",
          Stunned = true,
          Rooted = false,
          Silenced = false,
          Invulnerable = true,
          MagicImmune = false,
          IgnoreCollision = true,
          Placemarker = true,
          VisibilitySize = 0,
          DestVar = "Other3",
          GoldRedirectTargetVar = "Attacker"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Attacker",
          BuffName = "PoisonTrailApplicator",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Damage,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LastPosition",
          DestVarTable = "InstanceVars",
          SrcVar = "CurPos"
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PoisonTrail"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "PoisonTrail"
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
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
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Owner", PositionVar = "Pos"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LastPosition",
          DestVarTable = "NextBuffVars",
          SrcVar = "Pos"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamagePerTick",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            22,
            34,
            46,
            58,
            70
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ManaCost",
          DestVarTable = "NextBuffVars",
          SrcValue = 13
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "PoisonTrail",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 20000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poisontrailapplicator"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poisontrail"
    }
  }
}
