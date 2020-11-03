NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Garen_CommandingPresence.dds"
BuffName = "GarenCommandKill"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusArmor",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusMR",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MaxBonus",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "TotalBonus",
      Src1VarTable = "CharVars",
      Src2Var = "MaxBonus",
      Src2VarTable = "CharVars",
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "TotalBonus",
          Src2VarTable = "CharVars",
          Src1Value = 0.5,
          Src2Value = 0,
          DestVar = "BonusAdd",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TotalBonus",
          DestVarTable = "CharVars",
          SrcVar = "BonusAdd"
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatSpellBlockMod,
          TargetVar = "Owner",
          Delta = 0.5
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatArmorMod,
          TargetVar = "Owner",
          Delta = 0.5
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "GarenKillBuff",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
BuffOnLevelUpSpellBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
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
          DestVar = "BonusArmor",
          DestVarTable = "NextBuffVars",
          SrcVar = "BonusArmor",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusMR",
          DestVarTable = "NextBuffVars",
          SrcVar = "BonusMR",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MaxBonus",
          DestVarTable = "CharVars",
          SrcValueByLevel = {
            7,
            14,
            21,
            28,
            35
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MaxBonus",
          DestVarTable = "NextBuffVars",
          SrcVar = "MaxBonus",
          SrcVarTable = "CharVars"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "GarenCommandKill",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
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
    Params = {
      Name = "garenkillbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garencommandkill"
    }
  }
}
