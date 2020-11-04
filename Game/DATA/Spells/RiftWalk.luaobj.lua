NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Voidwalker_Riftwalk.dds"
BuffName = "RiftWalk"
AutoBuffActivateEffect = ""
AutoBuffActivateEvent = ""
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetManaCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = 0
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "CastPos"}
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
      Point2Var = "CastPos"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "CastPos"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 700,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 700,
          OffsetAngle = 0,
          PositionVar = "CastPos"
        }
      }
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "OwnerPos",
      EffectName = "Riftwalk_flashback.troy",
      Flags = 0,
      EffectIDVar = "p3",
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
    Function = BBTeleportToPosition,
    Params = {OwnerVar = "Owner", CastPositionName = "CastPos"}
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "Riftwalk"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Damage",
      SrcValueByLevel = {
        60,
        90,
        120
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Count",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Count2",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Damage",
      Src2Var = "Count2",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 270,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "TotalDamage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.4
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Count2",
      Src1Value = 100,
      Src2Value = 0,
      DestVar = "ExtraCost",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetManaCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = 0,
      CostVar = "ExtraCost"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "RiftWalk",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      BuffType = BUFF_Aura,
      MaxStack = 10,
      NumberStacks = 1,
      Duration = 8,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Riftwalk_flash.troy",
      Flags = 0,
      EffectIDVar = "ar1",
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "riftwalk_flashback.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "riftwalk"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "riftwalk_flash.troy"
    }
  }
}
