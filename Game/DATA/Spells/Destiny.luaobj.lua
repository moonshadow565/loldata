NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Destiny_temp.dds"
BuffName = "Destiny"
AutoBuffActivateEffect = "DestinyEye.troy"
AutoBuffActivateEffect2 = "GLOBAL_SLOW.TROY"
SpellDamageRatio = 0.75
AutoCooldownByLevel = {
  130,
  110,
  90
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "CasterID"}
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "CasterID",
      Radius = 1000,
      TargetVar = "Owner",
      Duration = 40,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Destiny_marker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        4.5,
        6.5,
        8.5
      },
      TickRate = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = -0.45
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Slow,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        4,
        5,
        6
      },
      TickRate = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "DestinySlow",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Slow,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        4,
        6,
        8
      },
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "destiny_marker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "destinyslow"
    }
  }
}
