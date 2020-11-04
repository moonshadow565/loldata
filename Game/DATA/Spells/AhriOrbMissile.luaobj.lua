AutoBuffActivateEffect = "Ahri_OrbofDeception.troy"
AutoBuffActivateAttachBoneName = "root"
SpellOnMissileEndBuildingBlocks = {
  {
    Function = BBModifyPosition,
    Params = {
      PositionVar = "MissileEndPosition",
      x = 0,
      y = -50,
      z = 0
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "MissileEndPosition",
      Range = 100,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "OrbofDeceptionIsActive",
          DestVarTable = "NextBuffVars",
          SrcVar = "OrbofDeceptionIsActive",
          SrcVarTable = "CharVars"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "AhriOrbDamage",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "MissileEndPosition",
      Range = 100,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "OrbofDeceptionIsActive",
          DestVarTable = "NextBuffVars",
          SrcVar = "OrbofDeceptionIsActive",
          SrcVarTable = "CharVars"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "AhriOrbDamageSilence",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Owner",
      OverrideCastPosition = true,
      OverrideCastPosVar = "MissileEndPosition",
      SlotNumber = 1,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = true,
      UpdateAutoAttackTimer = false
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "OrbofDeceptionIsActive",
      DestVarTable = "NextBuffVars",
      SrcVar = "OrbofDeceptionIsActive",
      SrcVarTable = "CharVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "AhriOrbDamage",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ahriorbdamage"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ahriorbdamagesilence"
    }
  }
}
