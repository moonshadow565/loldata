NonDispellable = true
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "FoundUnit", SrcVar = "false"}
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 900,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      BuffNameFilter = "Stealth",
      InclusiveBuffFilter = false
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "FoundUnit", SrcVar = "false"}
      },
      {
        Function = BBCanSeeTarget,
        Params = {
          ViewerVar = "Owner",
          TargetVar = "Unit",
          ResultVar = "CanSee"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CanSee",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBFaceDirection,
            Params = {TargetVar = "Owner", LocationVar = "Unit"}
          },
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Owner",
              TargetVar = "Unit",
              PosVar = "Owner",
              EndPosVar = "Owner",
              OverrideCastPosition = false,
              SlotNumber = 3,
              SlotType = SpellSlots,
              OverrideForceLevel = 1,
              OverrideCoolDownCheck = false,
              FireWithoutCasting = false,
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
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "ActionTimer",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src2Var = "FoundUnit",
      Value1 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "ActionTimer",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.5,
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
    Function = BBPreloadSpell,
    Params = {Name = "stealth"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "actiontimer"
    }
  }
}
