BuffTextureName = "Poppy_DiplomaticImmunity.dds"
BuffName = "PoppyDITarget"
AutoBuffActivateEffect = "DiplomaticImmunity_tar.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Caster",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Caster",
      AttackerVar = "Owner",
      BuffName = "PoppyDiplomaticImmunity",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        6,
        7,
        8
      },
      TickRate = 0
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Caster",
      AttackerVar = "Owner",
      BuffName = "PoppyDiplomaticImmunity"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Caster",
          AttackerVar = "Owner",
          BuffName = "PoppyDiplomaticImmunity"
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Attacker"}
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Owner",
      BuffName = "PoppyDiplomaticImmunity"
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Attacker",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LevelMultiplier",
          SrcValueByLevel = {
            1.2,
            1.3,
            1.4
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "LevelMultiplier",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_MULTIPLY
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppydiplomaticimmunity"
    }
  }
}
