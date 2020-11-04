BuffTextureName = "AlZahar_SummonVoidling.dds"
BuffName = "XarinPassiveBuff"
AutoBuffActivateEffect = "Xarin_passive_buf.troy"
AutoBuffActivateAttachBoneName = "r_hand"
AutoBuffActivateEffect2 = "Xarin_passive_buf.troy"
AutoBuffActivateAttachBoneName2 = "l_hand"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 0,
      SlotType = SpellSlots,
      Cost = -1,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 2,
      SlotType = SpellSlots,
      Cost = -1,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = -1,
      PARType = PAR_MANA
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 0,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 2,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "XarinEWrapper"
    },
    SubBlocks = {
      {
        Function = BBSetPARMultiplicativeCostInc,
        Params = {
          SpellSlotOwnerVar = "Owner",
          SpellSlot = 3,
          SlotType = SpellSlots,
          Cost = 0,
          PARType = PAR_MANA
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xarinewrapper"
    }
  }
}
