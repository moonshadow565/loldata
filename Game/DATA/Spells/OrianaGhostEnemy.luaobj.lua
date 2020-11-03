AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Caster",
      DestVarTable = "InstanceVars",
      SrcVar = "Caster"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Caster",
      Src2Var = "Owner",
      CompareOp = CO_NOT_EQUAL
    },
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
          FollowsGroundTilt = false
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PickUp",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
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
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "DropBall", SrcValue = false}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Expired",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "DropBall", SrcValue = true}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "DropBall", SrcValue = true}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DropBall",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Caster",
          SrcVar = "Caster",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Caster", DestVar = "TeamID"}
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Owner", PositionVar = "TargetPos"}
      },
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "HiddenMinion",
          Skin = "TestCube",
          AiScript = "idle.lua",
          PosVar = "TargetPos",
          Team = TEAM_ORDER,
          TeamVar = "TeamID",
          Stunned = false,
          Rooted = true,
          Silenced = false,
          Invulnerable = true,
          MagicImmune = true,
          IgnoreCollision = true,
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
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Attacker",
      ObjectVar2 = "Owner"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 1250,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "PickUp",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "OrianaGhostEnemy"
        }
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Owner", PositionVar = "CastPos"}
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "OrianaReturn",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1.25,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Attacker",
          TargetVar = "Attacker",
          PosVar = "Attacker",
          EndPosVar = "Attacker",
          OverrideCastPosition = true,
          OverrideCastPosVar = "CastPos",
          SlotNumber = 4,
          SlotType = ExtraSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = false,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
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
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "OrianaGhostEnemy"
                }
              }
            }
          }
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      Delta = 0,
      DeltaByLevel = {
        -0.2,
        -0.25,
        -0.3,
        -0.35,
        -0.4
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yomu_ghost_bind.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "yomughost"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yomughostminion"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yomughostenemy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "yomureturn"}
  }
}
