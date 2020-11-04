NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Wolfman_FuryStance.dds"
BuffName = "Hunter's Call"
AutoBuffActivateEffect = "Global_DmgHands_buf.troy"
AutoBuffActivateAttachBoneName = "r_hand"
AutoBuffActivateEffect2 = "Global_DmgHands_buf.troy"
AutoBuffActivateAttachBoneName2 = "l_hand"
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeedVar",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeedOther",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncPercentAttackSpeedMod,
          TargetVar = "Owner",
          DeltaVar = "AttackSpeedVar",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncPercentAttackSpeedMod,
          TargetVar = "Owner",
          DeltaVar = "AttackSpeedOther",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedVar",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.5,
        0.55,
        0.6,
        0.65,
        0.7
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedOther",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.25,
        0.275,
        0.3,
        0.325,
        0.35
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1200,
      Flags = "AffectFriends AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 10,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
