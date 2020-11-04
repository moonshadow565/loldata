NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Cryophoenix_FrigidOrb.dds"
BuffName = "Flash Frost"
SpellToggleSlot = 1
TargetExecuteBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        60,
        90,
        120,
        150,
        180
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.5
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MovementSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = -0.2
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "Chilled",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      BuffType = BUFF_Slow,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "chilled"}
  }
}
