NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Wolfman_FuryStance.dds"
BuffName = "Hunter's Call"
AutoBuffActivateEffect = "Global_DmgHands_buf.troy"
AutoBuffActivateAttachBoneName = "r_hand"
AutoBuffActivateEffect2 = "Global_DmgHands_buf.troy"
AutoBuffActivateAttachBoneName2 = "l_hand"
TriggersSpellCasts = true
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
          Delta = 0.5
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
          Delta = 0.25
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 20000,
      Flags = "AffectFriends AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationByLevel = {
            6,
            9,
            12,
            15,
            18
          },
          TickRate = 0
        }
      }
    }
  }
}
