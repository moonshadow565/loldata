NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Tristana_headshot.dds"
BuffName = "Rapid Fire"
AutoBuffActivateEffect = "rapidfire_buf.troy"
AutoBuffActivateAttachBoneName = "weapon"
SpellFXOverrideSkins = {
  "RocketTristana"
}
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeedMod",
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
      DeltaVar = "AttackSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.3,
        0.45,
        0.6,
        0.75,
        0.9
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 7,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
