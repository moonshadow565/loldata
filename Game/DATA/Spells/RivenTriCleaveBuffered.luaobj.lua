NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "AkaliCrescentSlash.dds"
BuffName = "RenekthonCleaveReady"
SpellToggleSlot = 1
SpellDamageRatio = 0.5
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TargetPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Level",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "TargetPos",
      CenterVarTable = "InstanceVars",
      Range = 175,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBGetUnitPosition,
        Params = {
          UnitVar = "Unit",
          PositionVar = "TargetPos",
          PositionVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ChampionLock",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 800,
          Flags = "AffectEnemies AffectHeroes ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          BuffNameFilter = "RivenTriCleaveBufferLock",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBGetUnitPosition,
            Params = {
              UnitVar = "Unit",
              PositionVar = "TargetPos",
              PositionVarTable = "InstanceVars"
            }
          }
        }
      }
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Nothing",
      PosVar = "TargetPos",
      PosVarTable = "InstanceVars",
      EndPosVar = "TargetPos",
      EndPosVarTable = "InstanceVars",
      OverrideCastPosition = false,
      SlotNumber = 4,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideForceLevelVarTable = "InstanceVars",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "marthtricleavebufferlock"
    }
  }
}
