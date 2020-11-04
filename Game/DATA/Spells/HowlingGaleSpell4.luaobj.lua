NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
AutoBuffActivateEffect = "DarkBinding_tar.troy"
AutoBuffActivateEffect2 = ""
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Attacker"}
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Target"}
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        160,
        220,
        280,
        340,
        400
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.8,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBGetRandomPointInAreaUnit,
    Params = {
      TargetVar = "Target",
      Radius = 100,
      InnerRadius = 100,
      ResultVar = "BouncePos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Position",
      DestVarTable = "NextBuffVars",
      SrcVar = "BouncePos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Speed",
      DestVarTable = "NextBuffVars",
      SrcValue = 100
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Gravity",
      DestVarTable = "NextBuffVars",
      SrcValue = 20
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "Move",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatDehancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "move"}
  }
}
