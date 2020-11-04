BuffTextureName = "Jester_ManiacalCloak2.dds"
BuffName = "AkaliTwilightShroudDebuff"
AutoBuffActivateEffect = "Global_Slow.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MovementSpeed",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        -0.14,
        -0.18,
        -0.22,
        -0.26,
        -0.3
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeed",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        -0.14,
        -0.18,
        -0.22,
        -0.26,
        -0.3
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MovementSpeed",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeed",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
