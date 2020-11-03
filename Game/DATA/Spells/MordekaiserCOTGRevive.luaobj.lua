TargetExecuteBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Target", PositionVar = "Pos"}
  },
  {
    Function = BBCloneUnitPet,
    Params = {
      UnitToCloneVar = "Target",
      Buff = "MordekaiserCotgRevive",
      Duration = 0,
      PosVar = "Pos",
      HealthBonus = 0,
      DamageBonus = 0,
      DestVar = "Other1"
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "Temp1",
      OwnerVar = "Other1",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Other1",
      Delta = 0,
      DeltaVar = "Temp1",
      HealerVar = "Other1"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Owner",
      BuffName = "MordekaiserCOTGPetBuff2",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 30,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Other1",
      BuffName = "Entropy"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisercotgrevive"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisercotgpetbuff2"
    }
  }
}
