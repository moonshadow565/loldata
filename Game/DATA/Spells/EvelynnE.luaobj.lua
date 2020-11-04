NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Evelynn_Ravage.dds"
BuffName = "EvelynnE"
AutoBuffActivateEffect = "evelynn_E_buf.troy"
AutoBuffActivateAttachBoneName = "L_hand"
AutoBuffActivateEffect2 = "Evelynn_e_buf.troy"
AutoBuffActivateAttachBoneName2 = "R_hand"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "evelynn_e_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "evelynne"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "evelynnravagedot"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "evelynnhatespikemarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "evelynnwpassive"
    }
  }
}
