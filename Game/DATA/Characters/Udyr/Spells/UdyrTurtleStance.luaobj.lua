NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Udyr_TurtleStance.dds"
BuffName = "UdyrTurtleStance"
AutoBuffActivateEffect = "Udyr_Spirit_Turtle_Arms.troy"
AutoBuffActivateAttachBoneName = "r_buffbone_glb_hand_loc"
AutoBuffActivateEffect2 = "Udyr_Spirit_Turtle_Arms.troy"
AutoBuffActivateAttachBoneName2 = "L_buffbone_glb_hand_loc"
SpellToggleSlot = 2
PersistsThroughDeath = true
SpellFXOverrideSkins = {"SpiritUdyr"}
SpellVOOverrideSkins = {"SpiritUdyr"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "udyrturtleult"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "udyrturtle"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyr_spiritguard_audio_turtle.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrturtleattackult"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "turtlepelt.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "turtlestance.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrturtleactivation"
    }
  }
}
