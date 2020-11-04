NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = -1,
      PARType = PAR_MANA
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Nothing",
      PosVar = "TargetPos",
      EndPosVar = "TargetPos",
      OverrideCastPosition = false,
      SlotNumber = 2,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "XerathArcaneBarrageBarrage"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "XerathArcaneBarrageBarrage",
          ResetDuration = 0
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "XerathArcaneBarrageBarrage"
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTimeVer2,
            Params = {
              Src = 0.6,
              SlotNumber = 3,
              SlotType = SpellSlots,
              SpellbookType = SPELLBOOK_CHAMPION,
              OwnerVar = "Owner",
              BroadcastEvent = false
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
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "XerathArcaneBarrageWrapper"
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTimeVer2,
            Params = {
              Src = 0.6,
              SlotNumber = 3,
              SlotType = SpellSlots,
              SpellbookType = SPELLBOOK_CHAMPION,
              OwnerVar = "Owner",
              BroadcastEvent = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "XerathArcaneBarrageBarrage",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 3,
              NumberOfStacks = 2,
              Duration = 12,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "XerathArcaneBarrageWrapper",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 15,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanebarragebarrage"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanebarragewrapper"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanebarrageminion"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "xeratharcanebarragelauncher"
    }
  }
}
