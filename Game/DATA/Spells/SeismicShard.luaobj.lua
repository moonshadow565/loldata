BuffTextureName = "Malphite_SeismicShard.dds"
BuffName = "SeismicShard"
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      DestVarTable = "NextBuffVars",
      SrcVar = "Level"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        80,
        135,
        190,
        245,
        300
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_DEFAULT,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.6
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "SeismicShardBuff",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Slow,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "seismicshardbuff"
    }
  }
}
