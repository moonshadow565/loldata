NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Judicator_RighteousFury.dds"
BuffName = "Righteous Fury"
AutoBuffActivateEffect = "Flamesword.troy"
AutoBuffActivateAttachBoneName = "weapon"
AutoBuffActivateEffect2 = "RighteousFuryHalo_buf.troy"
AutoBuffActivateAttachBoneName2 = "head"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 0,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 1
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackRangeIncrease",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "PhysicalDamageMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner"}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatAttackRangeMod,
      TargetVar = "Owner",
      DeltaVar = "AttackRangeIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "PhysicalDamageMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PhysicalDamageMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        30,
        50,
        70,
        70,
        70
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackRangeIncrease",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        350,
        350,
        350,
        350,
        350
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        25,
        25,
        25
      },
      TickRate = 0
    }
  }
}
