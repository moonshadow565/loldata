TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
  },
  {
    Function = BBGetChampionBySkinName,
    Params = {
      Skin = "Jester",
      Team = TEAM_UNKNOWN,
      TeamVar = "teamID",
      DestVar = "Attacker"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Dmg",
      SrcValueByLevel = {
        40,
        55,
        70,
        85,
        100
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Attacker",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.35,
      DestVar = "AbilityPowerBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Dmg",
      Src2Var = "AbilityPowerBonus",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalDmg",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_HERO},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalDmg",
          Src1Value = 0,
          Src2Value = 0.5,
          DestVar = "TotalDmg",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "TotalDmg",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0
    }
  }
}
