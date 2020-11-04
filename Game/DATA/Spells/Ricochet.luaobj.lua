NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Sivir_Ricochet.dds"
BuffName = "Ricochet"
SpellToggleSlot = 2
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "LastLevel",
      RequiredVarTable = "InstanceVars"
    }
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
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 0,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 0,
      AutoAttackSpellLevelVar = "Level"
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {Value = 1, Index = 1}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner"}
  }
}
BuffOnUpdateActionsBuildingBlocks = {
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
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Src2Var = "LastLevel",
      Src2VarTable = "InstanceVars",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBOverrideAutoAttack,
        Params = {
          SpellSlot = 0,
          SlotType = ExtraSlots,
          OwnerVar = "Owner",
          AutoAttackSpellLevel = 0,
          AutoAttackSpellLevelVar = "Level"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LastLevel",
          DestVarTable = "InstanceVars",
          SrcVar = "Level"
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "Level",
          Index = 1
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Ricochet"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Ricochet"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LastLevel",
          DestVarTable = "NextBuffVars",
          SrcVar = "Level"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 20000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "ricochet"}
  }
}
