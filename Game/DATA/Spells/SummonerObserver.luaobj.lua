NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Summoner_boost.dds"
BuffName = "Cleanse"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "TargetPos"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Target", DestVar = "TeamID"}
  },
  {
    Function = BBAddPosPerceptionBubble,
    Params = {
      TeamVar = "TeamID",
      Radius = 90000,
      PosVar = "TargetPos",
      Duration = 50000,
      SpecificUnitsClientOnlyVar = "Owner",
      RevealSteath = true,
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SummonerObserverBuff",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 50000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SummonerObserver"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "SummonerObserver"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 50000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerobserverbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerobserver"
    }
  }
}
