SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DtD",
      SrcValueByLevel = {
        150,
        200,
        250
      }
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      Flags = 0,
      EffectIDVar = "a",
      TargetObjectVar = "Unit",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Owner", DestVar = "WeaponDmg"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "WeaponDmg",
      Src1Value = 0,
      Src2Value = 0.4,
      DestVar = "WeaponDmgBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DtD",
      Src2Var = "WeaponDmgBonus",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DtDReal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 450,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "DtDReal",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_PROC,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
