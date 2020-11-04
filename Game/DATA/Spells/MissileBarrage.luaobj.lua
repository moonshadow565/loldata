BuffTextureName = "Corki_MissileBarrage.dds"
BuffName = "MissileBarrageCheck"
NonDispellable = true
CanCastBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "MissileBarrage"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "MissileBarrage"
    },
    SubBlocks = {
      {
        Function = BBGetCastSpellTargetPos,
        Params = {DestVar = "Pos"}
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "MissileBarrage"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "MissileBarrage",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_Aura,
          MaxStack = 7,
          NumberStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "MissileBarrage",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_Aura,
          MaxStack = 7,
          NumberStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "MissileBarrage",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_Aura,
          MaxStack = 7,
          NumberStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "MissileBarrage",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_Aura,
          MaxStack = 7,
          NumberStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "MissileBarrage",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_Aura,
          MaxStack = 7,
          NumberStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "MissileBarrage",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_Aura,
          MaxStack = 7,
          NumberStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "MissileBarrage",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_Aura,
          MaxStack = 7,
          NumberStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBGetCastSpellTargetPos,
        Params = {DestVar = "Pos"}
      }
    }
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBDistanceBetweenPoints,
    Params = {
      DestVar = "Distance",
      Point1Var = "OwnerPos",
      Point2Var = "Pos"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "Pos"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 1200,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 1150,
          OffsetAngle = 0,
          PositionVar = "Pos"
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "MBCheck2"
    },
    SubBlocks = {
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Pos",
          EndPosVar = "Pos",
          SlotNumber = 2,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = false,
          UseAutoAttackSpell = false
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "MBCheck2"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Pos",
          EndPosVar = "Pos",
          SlotNumber = 1,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = false,
          UseAutoAttackSpell = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missilebarrage"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "mbcheck2"}
  }
}
