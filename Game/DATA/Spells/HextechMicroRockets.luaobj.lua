DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Tristana_headshot.dds"
BuffName = ""
AutoBuffActivateEffect = "rapidfire_buf.troy"
AutoBuffActivateAttachBoneName = "weapon"
TriggersSpellCasts = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "CasterID"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBForEachUnitInTargetAreaRandom,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1350,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1
    },
    SubBlocks = {
      {
        Function = BBCanSeeTarget,
        Params = {
          ViewerVar = "Owner",
          TargetVar = "Unit",
          ResultVar = "Result"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Result",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBAddUnitPerceptionBubble,
            Params = {
              TeamVar = "CasterID",
              Radius = 300,
              TargetVar = "Unit",
              Duration = 1,
              SpecificUnitsClientOnlyVar = "Nothing",
              RevealSpecificUnitOnlyVar = "Nothing",
              RevealSteath = false,
              BubbleIDVar = "BubbleID",
              BubbleIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Owner",
              TargetVar = "Unit",
              PosVar = "Owner",
              EndPosVar = "Owner",
              SlotNumber = 1,
              SlotType = ExtraSlots,
              OverrideForceLevel = 0,
              OverrideForceLevelVar = "Level",
              OverrideCoolDownCheck = true,
              FireWithoutCasting = true,
              UseAutoAttackSpell = false
            }
          }
        }
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "temp", SrcValue = false}
  },
  {
    Function = BBForEachUnitInTargetAreaRandom,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1350,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1
    },
    SubBlocks = {
      {
        Function = BBCanSeeTarget,
        Params = {
          ViewerVar = "Owner",
          TargetVar = "Unit",
          ResultVar = "Result"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Result",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "temp", SrcValue = true}
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "temp",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        0.257,
        0.507,
        0.757,
        1.007,
        1.257
      },
      TickRate = 0.25
    }
  }
}
