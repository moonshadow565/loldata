NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Judicator_Intervention.dds"
BuffName = "Divine Blessing"
AutoBuffActivateEffect = "InterventionHeal_buf.troy"
AutoBuffActivateEffect2 = "Interventionspeed_buf.troy"
AutoBuffActivateAttachBoneName2 = "root"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "HealthRegen",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "HealthRegen",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthRegen",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        2,
        3,
        4,
        5,
        6
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.08,
        0.1,
        0.12,
        0.14,
        0.16
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 20,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
