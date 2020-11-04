NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Yeti_YetiSmash.dds"
BuffName = "Blood Boil"
AutoBuffActivateEffect = "bloodboil_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "bloodboil_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
AutoBuffActivateEffect3 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeedBonusPercent",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MovementSpeedBonusPercent",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedBonusPercent",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MovementSpeedBonusPercent",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedBonusPercent",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.25,
        0.35,
        0.45,
        0.55,
        0.65
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MovementSpeedBonusPercent",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.1,
        0.125,
        0.15,
        0.175,
        0.2
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Haste,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 40,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
