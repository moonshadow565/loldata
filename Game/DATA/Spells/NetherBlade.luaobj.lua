NotSingleTargetSpell = true
BuffTextureName = "Voidwalker_NullBlade.dds"
BuffName = "NetherBlade"
AutoBuffActivateEffect = ""
SpellToggleSlot = 2
NonDispellable = true
BuffOnHitUnitBuildingBlocks = {
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ManaGainAmount",
      SrcValueByLevel = {
        8,
        11,
        14,
        17,
        20
      }
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "ManaGainAmount",
          Src1Value = 0,
          Src2Value = 3,
          DestVar = "ModifiedManaGainAmount",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          PARType = PAR_MANA,
          DeltaVar = "ModifiedManaGainAmount"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          PARType = PAR_MANA,
          DeltaVar = "ManaGainAmount"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "Netherblade_cas.troy",
          Flags = 0,
          EffectIDVar = "num",
          TargetObjectVar = "Target",
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "NetherBladeBuff",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = false,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "netherblade_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "netherbladebuff"
    }
  }
}
