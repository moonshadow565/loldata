BuffTextureName = "OriannaPassive.dds"
BuffName = "OrianaGhost"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "CurrentPos"}
  },
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBSetBuffCasterUnit,
    Params = {
      CasterVar = "Caster",
      CasterVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "GhostSpawned",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MinionBall",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBGetUnitSkinName,
    Params = {TargetVar = "Owner", DestVar = "SkinName"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SkinName",
      Value2 = "OriannaBall",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MinionBall",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SkinName",
      Value2 = "OriannaBall",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MinionBall",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "MinionBall",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Caster",
          Src2Var = "Owner",
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetSkinID,
            Params = {UnitVar = "Caster", SkinIDVar = "SkinID"}
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "SkinID",
              Value2 = 1,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  PosVar = "CurrentPos",
                  EffectName = "Oriana_ghost_bind_goth.troy",
                  Flags = 0,
                  EffectIDVar = "Temp",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Owner",
                  TargetPosVar = "CurrentPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              }
            }
          },
          {
            Function = BBElseIf,
            Params = {
              Src1Var = "SkinID",
              Value2 = 2,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  PosVar = "CurrentPos",
                  EffectName = "Oriana_ghost_bind_doll.troy",
                  Flags = 0,
                  EffectIDVar = "Temp",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Owner",
                  TargetPosVar = "CurrentPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false,
                  FollowsGroundTilt = false,
                  FacesTarget = false
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
                  PosVar = "CurrentPos",
                  EffectName = "Oriana_Ghost_bind.troy",
                  Flags = 0,
                  EffectIDVar = "Temp",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Owner",
                  TargetPosVar = "CurrentPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBGetUnitPosition,
    Params = {
      UnitVar = "Attacker",
      PositionVar = "AttackerPos"
    }
  },
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Caster",
      ObjectVar2 = "Owner"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 1000,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "OrianaBallIndicatorFar.troy",
          Flags = 0,
          EffectIDVar = "OrianaPointer",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Attacker",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          OrientTowardsVar = "Owner",
          FollowsGroundTilt = false,
          FacesTarget = true
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "PreviousState",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 800,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "OrianaBallIndicatorMedium.troy",
          Flags = 0,
          EffectIDVar = "OrianaPointer",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Attacker",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          OrientTowardsVar = "Owner",
          FollowsGroundTilt = false,
          FacesTarget = true
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "PreviousState",
          DestVarTable = "InstanceVars",
          SrcValue = 1
        }
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "OrianaBallIndicatorNear.troy",
          Flags = 0,
          EffectIDVar = "OrianaPointer",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Attacker",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          OrientTowardsVar = "Owner",
          FollowsGroundTilt = false,
          FacesTarget = true
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "PreviousState",
          DestVarTable = "InstanceVars",
          SrcValue = 2
        }
      }
    }
  },
  {
    Function = BBSetSpellOffsetTarget,
    Params = {
      SlotNumber = 1,
      SlotType = SpellSlots,
      SpellName = "JunkName",
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Attacker",
      OffsetTargetVar = "Owner"
    }
  },
  {
    Function = BBSetSpellOffsetTarget,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SpellName = "JunkName",
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Attacker",
      OffsetTargetVar = "Owner"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "OrianaPointer",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OrianaGhostMinion"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Caster",
      SrcVar = "Caster",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetUnitSkinName,
    Params = {TargetVar = "Owner", DestVar = "SkinName"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SkinName",
      Value2 = "OriannaBall",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Caster",
          Src2Var = "Owner",
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "Temp",
              EffectIDVarTable = "InstanceVars"
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
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Attacker",
          BuffName = "OriannaBallTracker"
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Caster",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DefenseBonus",
          SrcValueByLevel = {
            10,
            15,
            20,
            25,
            30
          }
        }
      },
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatArmorMod,
          TargetVar = "Owner",
          DeltaVar = "DefenseBonus",
          Delta = 0
        }
      },
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatSpellBlockMod,
          TargetVar = "Owner",
          DeltaVar = "DefenseBonus",
          Delta = 0
        }
      }
    }
  },
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Caster",
      ObjectVar2 = "Owner"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 1000,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CurrentState",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 800,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CurrentState",
          DestVarTable = "InstanceVars",
          SrcValue = 1
        }
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
        Params = {
          DestVar = "CurrentState",
          DestVarTable = "InstanceVars",
          SrcValue = 2
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentState",
      Src1VarTable = "InstanceVars",
      Src2Var = "PreviousState",
      Src2VarTable = "InstanceVars",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "OrianaPointer",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CurrentState",
          Src1VarTable = "InstanceVars",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "OrianaBallIndicatorFar.troy",
              Flags = 0,
              EffectIDVar = "OrianaPointer",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Attacker",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = true,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              OrientTowardsVar = "Owner",
              FollowsGroundTilt = false,
              FacesTarget = true
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "CurrentState",
          Src1VarTable = "InstanceVars",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "OrianaBallIndicatorMedium.troy",
              Flags = 0,
              EffectIDVar = "OrianaPointer",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Attacker",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = true,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              OrientTowardsVar = "Owner",
              FollowsGroundTilt = false,
              FacesTarget = true
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
              BindObjectVar = "Attacker",
              EffectName = "OrianaBallIndicatorNear.troy",
              Flags = 0,
              EffectIDVar = "OrianaPointer",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Attacker",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = true,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              OrientTowardsVar = "Owner",
              FollowsGroundTilt = false,
              FacesTarget = true
            }
          }
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PreviousState",
      DestVarTable = "InstanceVars",
      SrcVar = "CurrentState",
      SrcVarTable = "InstanceVars"
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
      DestVar = "Distance",
      ObjectVar1 = "Caster",
      ObjectVar2 = "Owner"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 1125,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Caster",
          State = true
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Caster",
          State = true
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Caster",
          State = true
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Caster",
          State = true
        }
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "OrianaGhost"
        }
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Owner", PositionVar = "CastPos"}
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "CastPos",
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
          SendIfOnScreenOrDiscard = true,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Caster",
          AttackerVar = "Caster",
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Caster",
          PosVar = "CastPos",
          EffectName = "Orianna_Ball_Flash_Reverse.troy",
          Flags = 0,
          EffectIDVar = "Temp",
          BoneName = "SpinnigBottomRidge",
          TargetObjectVar = "Caster",
          SpecificUnitOnlyVar = "Caster",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Caster",
          State = false
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Caster",
          State = false
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Caster",
          State = false
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Caster",
          State = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 25,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Caster",
          CasterVar = "Nothing",
          BuffName = "OrianaDissonanceCountdown"
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_HERO},
            SubBlocks = {
              {
                Function = BBSetBuffCasterUnit,
                Params = {CasterVar = "Caster"}
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Caster",
                  AttackerVar = "Caster",
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
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "OrianaGhost"
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Caster",
                  PosVar = "CastPos",
                  EffectName = "Orianna_Ball_Flash_Reverse.troy",
                  Flags = 0,
                  EffectIDVar = "Temp",
                  BoneName = "SpinnigBottomRidge",
                  TargetObjectVar = "Caster",
                  SpecificUnitOnlyVar = "Caster",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              }
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
        Function = BBGetStatus,
        Params = {
          TargetVar = "Owner",
          DestVar = "NoRender",
          Status = GetNoRender
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "NoRender",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 0,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Caster",
                  State = true
                }
              },
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 1,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Caster",
                  State = true
                }
              },
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 2,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Caster",
                  State = true
                }
              },
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 3,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Caster",
                  State = true
                }
              },
              {
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "OrianaGhost"
                }
              },
              {
                Function = BBGetUnitPosition,
                Params = {UnitVar = "Owner", PositionVar = "CastPos"}
              },
              {
                Function = BBGetTeamID,
                Params = {TargetVar = "Owner", DestVar = "TeamID"}
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "CastPos",
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
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Caster",
                  AttackerVar = "Caster",
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
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Caster",
                  PosVar = "CastPos",
                  EffectName = "Orianna_Ball_Flash_Reverse.troy",
                  Flags = 0,
                  EffectIDVar = "Temp",
                  BoneName = "SpinnigBottomRidge",
                  TargetObjectVar = "Caster",
                  SpecificUnitOnlyVar = "Caster",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 0,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Caster",
                  State = false
                }
              },
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 1,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Caster",
                  State = false
                }
              },
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 2,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Caster",
                  State = false
                }
              },
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 3,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Caster",
                  State = false
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
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "GhostSpawned",
          Src1VarTable = "InstanceVars",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
            SubBlocks = {
              {
                Function = BBSetBuffCasterUnit,
                Params = {CasterVar = "Caster"}
              },
              {
                Function = BBGetUnitPosition,
                Params = {
                  UnitVar = "Owner",
                  PositionVar = "MissileEndPosition"
                }
              },
              {
                Function = BBGetTeamID,
                Params = {TargetVar = "Attacker", DestVar = "TeamID"}
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "GhostSpawned",
                  DestVarTable = "InstanceVars",
                  SrcValue = true
                }
              },
              {
                Function = BBSpawnMinion,
                Params = {
                  Name = "TheDoomBall",
                  Skin = "Oriana_Ball",
                  AiScript = "idle.lua",
                  PosVar = "MissileEndPosition",
                  Team = TEAM_ORDER,
                  TeamVar = "TeamID",
                  Stunned = false,
                  Rooted = true,
                  Silenced = false,
                  Invulnerable = true,
                  MagicImmune = true,
                  IgnoreCollision = true,
                  IsWard = false,
                  Placemarker = true,
                  VisibilitySize = 0,
                  DestVar = "Other3",
                  GoldRedirectTargetVar = "Caster"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Other3",
                  AttackerVar = "Attacker",
                  BuffName = "OrianaGhost",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
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
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Other3",
                  AttackerVar = "Attacker",
                  BuffName = "OrianaGhostMinion",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
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
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "OrianaGhost"
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
    Params = {Src1Var = "Caster", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "OrianaGhost"
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Caster",
      Src2Var = "Owner",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Caster",
          AttackerVar = "Caster",
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
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "OrianaGhost"
        }
      }
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "OrianaPointer",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "GhostSpawned",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "MinionBall",
          Src1VarTable = "InstanceVars",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetBuffCasterUnit,
            Params = {CasterVar = "Caster"}
          },
          {
            Function = BBGetUnitPosition,
            Params = {
              UnitVar = "Owner",
              PositionVar = "MissileEndPosition"
            }
          },
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Caster", DestVar = "TeamID"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "GhostSpawned",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSpawnMinion,
            Params = {
              Name = "TheDoomBall",
              Skin = "OriannaBall",
              AiScript = "idle.lua",
              PosVar = "MissileEndPosition",
              Team = TEAM_ORDER,
              TeamVar = "TeamID",
              Stunned = false,
              Rooted = true,
              Silenced = false,
              Invulnerable = true,
              MagicImmune = true,
              IgnoreCollision = true,
              IsWard = false,
              Placemarker = true,
              VisibilitySize = 0,
              DestVar = "Other3",
              GoldRedirectTargetVar = "Caster"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Other3",
              AttackerVar = "Caster",
              BuffName = "OrianaGhost",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
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
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Other3",
              AttackerVar = "Caster",
              BuffName = "OrianaGhostMinion",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
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
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Owner",
              BuffName = "OrianaGhost"
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "oriana_ghost_bind_goth.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "oriana_ghost_bind_doll.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "oriana_ghost_bind.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianaballindicatorfar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianaballindicatormedium.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianaballindicatornear.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghostminion"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "oriannaballtracker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghost"
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
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghostself"
    }
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
      Name = "orianadissonancecountdown"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "oriannaball"
    }
  }
}
