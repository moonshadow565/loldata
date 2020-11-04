BuffTextureName = "DrMundo_BurningAgony.dds"
BuffName = "OdinShrineBombBuff"
AutoBuffActivateEffect2 = "dr_mundo_burning_agony_cas_02.troy"
AutoBuffActivateAttachBoneName2 = "root"
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "OrderTeam", SrcValue = TEAM_ORDER}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "ChaosTeam", SrcValue = TEAM_CHAOS}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ChaosTeam",
      DestVarTable = "InstanceVars",
      SrcVar = "ChaosTeam"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "OrderTeam",
      DestVarTable = "InstanceVars",
      SrcVar = "OrderTeam"
    }
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "OrderTeam",
      TeamVarTable = "InstanceVars",
      Radius = 400,
      TargetVar = "Owner",
      Duration = 70,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "OrderBubble",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "ChaosTeam",
      TeamVarTable = "InstanceVars",
      Radius = 400,
      TargetVar = "Owner",
      Duration = 70,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "ChaosBubble",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "OrderBubble",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "ChaosBubble",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
