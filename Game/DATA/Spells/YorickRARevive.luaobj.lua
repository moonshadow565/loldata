TargetExecuteBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Target", PositionVar = "Pos"}
  },
  {
    Function = BBCloneUnitPet,
    Params = {
      UnitToCloneVar = "Target",
      Buff = "YorickRARevive",
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
      BuffName = "YorickRAPetBuff2",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 10,
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
      AttackerVar = "Other1",
      BuffName = "YorickRARemovePet",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 10,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickrarevive"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickrapetbuff2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickraremovepet"
    }
  }
}
