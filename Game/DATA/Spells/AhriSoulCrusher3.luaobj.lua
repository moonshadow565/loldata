BuffTextureName = "3017_Egitai_Twinsoul.dds"
BuffName = "AhriSoulCrusher"
AutoBuffActivateEffect = "PotionofElusiveness_itm.troy"
AutoBuffActivateEffect2 = "PotionofBrilliance_itm.troy"
AutoBuffActivateEffect3 = "PotionofGiantStrength_itm.troy"
PersistsThroughDeath = true
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "AhriSoulCrusher4",
      BuffAddType = BUFF_STACKS_AND_OVERLAPS,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0.25,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "AhriFoxFire"
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Owner",
              BuffName = "AhriSoulCrusher3"
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Ahrisoulcrusher4"
    }
  }
}
