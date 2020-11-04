NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Wolfman_Bloodscent.dds"
BuffName = "Haste"
AutoBuffActivateEffect = "wolfman_bloodscent_activate_speed.troy"
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "wolfman_bloodscent_activate_blood_buff.troy"
AutoBuffActivateAttachBoneName2 = "L_hand"
AutoBuffActivateEffect3 = "wolfman_bloodscent_activate_blood_buff.troy"
AutoBuffActivateAttachBoneName3 = "R_hand"
AutoBuffActivateEffect4 = "wolfman_bloodscent_activate_blood_buff_02.troy"
AutoBuffActivateAttachBoneName4 = "head"
SpellToggleSlot = 3
AutoCooldownByLevel = {
  45,
  40,
  35,
  30,
  25
}
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveSpeedBuff",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Attacker",
      DeltaVar = "MoveSpeedBuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnLevelUpSpellBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MoveSpeedBuff",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            0.2,
            0.25,
            0.3,
            0.35,
            0.4
          }
        }
      }
    }
  }
}
