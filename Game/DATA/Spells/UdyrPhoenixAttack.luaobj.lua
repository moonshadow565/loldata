TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "baseDamage"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "baseDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Count",
      Src2VarTable = "InstanceVars",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Count",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Src1VarTable = "CharVars",
          Value2 = 4,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "PhoenixBreath_cas.troy",
              Flags = 0,
              EffectIDVar = "a",
              BoneName = "goatee",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 400,
              OffsetAngle = 0,
              PositionVar = "TargetPos"
            }
          },
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Owner",
              TargetVar = "Nothing",
              PosVar = "TargetPos",
              EndPosVar = "TargetPos",
              OverrideCastPosition = false,
              SlotNumber = 0,
              SlotType = ExtraSlots,
              OverrideForceLevel = 1,
              OverrideCoolDownCheck = true,
              FireWithoutCasting = true,
              UseAutoAttackSpell = false,
              ForceCastingOrChannelling = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Count",
              DestVarTable = "CharVars",
              SrcValue = 0
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "phoenixbreath_cas.troy"
    }
  }
}
