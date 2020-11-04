BuffTextureName = "Poppy_DiplomaticImmunity.dds"
BuffName = "PoppyDITarget"
AutoBuffActivateEffect = "DiplomaticImmunity_tar.troy"
Nondispellable = true
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
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppydiplomaticimmunity"
    }
  }
}
