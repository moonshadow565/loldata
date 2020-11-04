NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Tristana_headshot.dds"
BuffName = "GravesSteroid"
AutoBuffActivateEffect = "Graves_Move_WeaponsFX.troy"
AutoBuffActivateAttachBoneName = "buffbone_cstm_barrela2"
AutoBuffActivateEffect2 = "Graves_Move_WeaponsFX.troy"
AutoBuffActivateAttachBoneName2 = "buffbone_cstm_barrelb2"
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
        0.4,
        0.55,
        0.7,
        0.85,
        1
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
