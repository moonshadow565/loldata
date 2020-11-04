DoLuaLevel("GlobalLevelScript")
EVENT_STAGE_WELCOME_TIME = 15
EVENT_STAGE_PREANNOUNCE_TIME = 30
EVENT_STAGE_MINIONS_SPAWNED_TIME = 120
MAX_MINIONS_EVER = 180
TEAM_ORDER = 100
TEAM_CHAOS = 200
ORDER_HQ = 1
CHAOS_HQ = 2
FRONT_TOWER = 4
MID_TOWER = 3
BACK_TOWER = 2
BACK_TOWER2 = 1
CENTER_LANE = 1
INITIAL_TIME_TO_SPAWN = 60
CANNON_MINION_SPAWN_FREQUENCY = 3
MINION_HEALTH_DENIAL_PERCENT = 0
UPGRADE_MINION_TIMER = 90
UPGRADE_MINION_ITERATIONS_FOR_LATE_SCALING = 6
TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION = 3
EXP_GIVEN_RADIUS = 1400
GOLD_GIVEN_RADIUS = 1250
DISABLE_MINION_SPAWN_BASE_TIME = 300
DISABLE_MINION_SPAWN_MAG_TIME = 0
CHAOS_INHIBITOR_RESPAWN_ANIMATION_DURATION = 11.67
ORDER_INHIBITOR_RESPAWN_ANIMATION_DURATION = 11
LAST_WAVE = -1
HQTurretAttackable = false
UpgradedMinionIterations = 0
SpawnTable = {
  WaveSpawnRate = 30000,
  SingleMinionSpawnDelay = 800,
  ExpRadius = EXP_GIVEN_RADIUS,
  GoldRadius = GOLD_GIVEN_RADIUS
}
MeleeDefaultMinionInfo = {
  DefaultNumPerWave = 3,
  Armor = 0,
  ArmorUpgrade = 1,
  MagicResistance = 0,
  MagicResistanceUpgrade = 0.625,
  HPBonus = 0,
  HPUpgrade = 13,
  HPUpgradeGrowth = 0.2,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 2,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 0.5,
  DamageInhibitor = 0,
  ExpGiven = 64,
  ExpBonus = 0,
  ExpUpgrade = 5,
  ExpInhibitor = 0,
  GoldGiven = 26,
  GoldBonus = 0,
  GoldUpgrade = 0.5,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 10,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
CasterDefaultMinionInfo = {
  DefaultNumPerWave = 3,
  Armor = 0,
  ArmorUpgrade = 0.625,
  MagicResistance = 0,
  MagicResistanceUpgrade = 1,
  HPBonus = 0,
  HPUpgrade = 10,
  HPUpgradeGrowth = 0.2,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 1,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 1,
  DamageInhibitor = 0,
  ExpGiven = 32,
  ExpBonus = 0,
  ExpUpgrade = 3,
  ExpInhibitor = 0,
  GoldGiven = 19,
  GoldBonus = 0,
  GoldUpgrade = 0.5,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 10,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
CannonDefaultMinionInfo = {
  DefaultNumPerWave = 0,
  Armor = 0,
  ArmorUpgrade = 1.5,
  MagicResistance = 0,
  MagicResistanceUpgrade = 1.5,
  HPBonus = 0,
  HPUpgrade = 23,
  HPUpgradeGrowth = 0.3,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 3,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 1.5,
  DamageInhibitor = 0,
  ExpGiven = 100,
  ExpBonus = 0,
  ExpUpgrade = 7,
  ExpInhibitor = 0,
  GoldGiven = 42,
  GoldBonus = 0,
  GoldUpgrade = 1,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
SuperDefaultMinionInfo = {
  DefaultNumPerWave = 0,
  Armor = 0,
  ArmorUpgrade = 0,
  MagicResistance = 0,
  MagicResistanceUpgrade = 0,
  HPBonus = 0,
  HPUpgrade = 100,
  HPUpgradeGrowth = 0,
  HPUpgradeLate = 0,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 5,
  DamageInhibitor = 0,
  ExpGiven = 100,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 42,
  GoldBonus = 0,
  GoldUpgrade = 1,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
OrderMeleeMinionInfo = {
  MinionName = "HA_OrderMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
ChaosMeleeMinionInfo = {
  MinionName = "HA_ChaosMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
OrderCasterMinionInfo = {
  MinionName = "HA_OrderMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
ChaosCasterMinionInfo = {
  MinionName = "HA_ChaosMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
OrderCannonMinionInfo = {
  MinionName = "HA_OrderMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
ChaosCannonMinionInfo = {
  MinionName = "HA_ChaosMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
OrderSuperMinionInfo = {
  MinionName = "HA_OrderMinionSuper",
  DefaultInfo = SuperDefaultMinionInfo
}
ChaosSuperMinionInfo = {
  MinionName = "HA_ChaosMinionSuper",
  DefaultInfo = SuperDefaultMinionInfo
}
DefaultBarrackInfo = {
  IsDestroyed = false,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  SpawnOrderMinionNames = {
    "Super",
    "Melee",
    "Cannon",
    "Caster"
  }
}
DefaultOrderMinionInfoTable = {
  Melee = OrderMeleeMinionInfo,
  Caster = OrderCasterMinionInfo,
  Cannon = OrderCannonMinionInfo,
  Super = OrderSuperMinionInfo
}
DefaultChaosMinionInfoTable = {
  Melee = ChaosMeleeMinionInfo,
  Caster = ChaosCasterMinionInfo,
  Cannon = ChaosCannonMinionInfo,
  Super = ChaosSuperMinionInfo
}
OrderBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
OrderBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
OrderBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
ChaosBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
ChaosBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
ChaosBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
function AppendTable(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  if A1_1 ~= nil then
    L4_4 = type
    L5_5 = A1_1
    L4_4 = L4_4(L5_5)
    if L4_4 == "table" then
      L4_4, L5_5 = nil, nil
      if A0_0 == nil then
        A0_0 = L6_6
      end
      for L9_9, L10_10 in L6_6(L7_7) do
        if A2_2 == true and type(L10_10) == "table" then
          A0_0[L9_9] = AppendTable(A0_0[L9_9], L10_10, A3_3, A3_3)
        else
          A0_0[L9_9] = L10_10
        end
      end
    end
  end
  return A0_0
end
function InitBarrackInfo(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20
  L1_12 = AppendTable
  L2_13 = A0_11
  L1_12 = L1_12(L2_13, L3_14, L4_15, L5_16)
  A0_11 = L1_12
  L1_12 = AppendTable
  L2_13 = A0_11.MinionInfoTable
  L1_12 = L1_12(L2_13, L3_14, L4_15, L5_16)
  A0_11.MinionInfoTable = L1_12
  L1_12 = A0_11.MinionInfoTable
  if L1_12 ~= nil then
    L1_12 = A0_11.MinionInfoTable
    L2_13 = nil
    for L7_18, L8_19 in L4_15(L5_16) do
      L9_20 = L1_12[L7_18]
      if L9_20.DefaultInfo ~= nil then
        AppendTable(L9_20, L9_20.DefaultInfo, true, true)
        L9_20.NumPerWave = L9_20.DefaultNumPerWave
        L9_20.GoldGivenBase = L9_20.GoldGiven
        L9_20.ExpGivenBase = L9_20.ExpGiven
      end
    end
  end
  L1_12 = A0_11.Overrides
  if L1_12 ~= nil then
    L1_12, L2_13 = nil, nil
    for L6_17, L7_18 in L3_14(L4_15) do
      L8_19 = type
      L9_20 = A0_11[L6_17]
      L8_19 = L8_19(L9_20)
      if L8_19 == "table" then
        L8_19 = type
        L9_20 = L7_18
        L8_19 = L8_19(L9_20)
        if L8_19 == "table" then
          L8_19 = AppendTable
          L9_20 = A0_11[L6_17]
          L8_19(L9_20, L7_18, true, true)
        end
      else
        L8_19 = type
        L9_20 = L7_18
        L8_19 = L8_19(L9_20)
        if L8_19 ~= "table" then
          A0_11[L6_17] = L7_18
        end
      end
    end
  end
  return A0_11
end
OrderBarracksBonuses = {
  InitBarrackInfo(OrderBarrack0),
  InitBarrackInfo(OrderBarrack1),
  InitBarrackInfo(OrderBarrack2)
}
ChaosBarracksBonuses = {
  InitBarrackInfo(ChaosBarrack0),
  InitBarrackInfo(ChaosBarrack1),
  InitBarrackInfo(ChaosBarrack2)
}
OrderBuildingStatus = {
  Turret4 = true,
  Turret3 = true,
  Turret2 = true,
  Turret1 = true,
  Barracks = true,
  HQ = true
}
ChaosBuildingStatus = {
  Turret4 = true,
  Turret3 = true,
  Turret2 = true,
  Turret1 = true,
  Barracks = true,
  HQ = true
}
TotalNumberOfMinions = 0
function PreloadBarrackCharacters(A0_21)
  local L1_22, L2_23
  for _FORV_6_, _FORV_7_ in pairs(A0_21.DefaultMinionInfoTable) do
    if _FORV_7_.PreloadedCharacter == nil then
      _FORV_7_.PreloadedCharacter = 1
      PreloadCharacter(_FORV_7_.MinionName)
    end
  end
end
function OnLevelInit()
  local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37
  L3_27(L4_28)
  L3_27(L4_28)
  L3_27(L4_28)
  for L6_30, L7_31 in L3_27(L4_28) do
    L8_32 = PreloadBarrackCharacters
    L8_32(L9_33)
  end
  for L6_30, L7_31 in L3_27(L4_28) do
    L8_32 = PreloadBarrackCharacters
    L8_32(L9_33)
  end
  L3_27.WaveSpawnRate = 30000
  L3_27.SingleMinionSpawnDelay = 800
  if L3_27 == "FIRSTBLOOD" then
    L4_28.ExpGiven = 64
    L4_28.GoldGiven = 19.75
    L4_28.GoldUpgrade = 0.25
    L4_28.HPUpgrade = 10
    L4_28.DamageUpgrade = 0.5
    L4_28.ExpUpgrade = 2
    L4_28.ArmorUpgrade = 1
    L4_28.MagicResistanceUpgrade = 0.625
    L4_28.GoldMaximumBonus = 12
    L5_29.ExpGiven = 32
    L5_29.GoldGiven = 14.75
    L5_29.GoldUpgrade = 0.25
    L5_29.HPUpgrade = 7.5
    L5_29.DamageUpgrade = 1
    L5_29.ExpUpgrade = 1.2
    L5_29.ArmorUpgrade = 0.625
    L5_29.MagicResistanceUpgrade = 1
    L5_29.GoldMaximumBonus = 8
    L6_30 = {}
    L6_30.ExpGiven = 100
    L6_30.GoldGiven = 39.5
    L6_30.GoldUpgrade = 0.5
    L6_30.HPUpgrade = 10
    L6_30.DamageUpgrade = 1.5
    L6_30.ExpUpgrade = 3
    L6_30.ArmorUpgrade = 1.5
    L6_30.MagicResistanceUpgrade = 1.5
    L6_30.GoldMaximumBonus = 30
    L7_31 = {}
    L7_31.ExpGiven = 100
    L7_31.GoldGiven = 27
    L7_31.GoldUpgrade = 0
    L7_31.HPUpgrade = 100
    L7_31.DamageUpgrade = 5
    L7_31.ExpUpgrade = 0
    L7_31.ArmorUpgrade = 0
    L7_31.MagicResistanceUpgrade = 0
    L7_31.GoldMaximumBonus = 30
    L8_32 = {}
    L8_32.Melee = L4_28
    L8_32.Caster = L5_29
    L8_32.Cannon = L6_30
    L8_32.Super = L7_31
    for L12_36, L13_37 in L9_33(L10_34) do
      for _FORV_21_, _FORV_22_ in pairs(L13_37) do
        OrderBarracksBonuses[1].MinionInfoTable[L12_36][_FORV_21_] = _FORV_22_
        ChaosBarracksBonuses[1].MinionInfoTable[L12_36][_FORV_21_] = _FORV_22_
      end
    end
    INITIAL_TIME_TO_SPAWN = L9_33
    UPGRADE_MINION_TIMER = L9_33
  end
  if L3_27 == "TUTORIAL" then
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    INITIAL_TIME_TO_SPAWN = L4_28
    L4_28.NumOfMeleeMinionsPerWave = 0
    L4_28.NumOfCasterMinionsPerWave = 0
  else
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28(L5_29)
    if L3_27 == "FIRSTBLOOD" then
      L4_28(L5_29)
      L4_28(L5_29)
      L4_28(L5_29)
      L4_28(L5_29)
      L4_28(L5_29)
    end
    L4_28(L5_29)
    L4_28(L5_29)
    L4_28.NumOfMeleeMinionsPerWave = 3
    L4_28.NumOfCasterMinionsPerWave = 3
    L4_28(L5_29)
    L4_28()
  end
  L4_28(L5_29)
  L13_37 = L5_29()
  L4_28(L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37, L5_29())
end
function OnLevelInitServer()
  if GetGameMode() == "TUTORIAL" then
    InitTimer("PlaceTutorialSpawnRunes", 1, false)
  else
    InitTimer("UpgradeMinionTimer", UPGRADE_MINION_TIMER, true)
    InitTimer("AllowDamageOnBuildings", 10, false)
  end
end
function ApplyBountyTrackerBuff(A0_38)
  ApplyPersistentBuff(A0_38, "S6_BountyTracker", false, 1, 1)
end
function OnPostLevelLoad()
  local L0_39, L1_40, L2_41, L3_42, L4_43, L5_44
  L0_39 = LoadLevelScriptIntoScript
  L0_39(L1_40)
  L0_39 = GetGameMode
  L0_39 = L0_39()
  if L0_39 == "TUTORIAL" then
    L1_40()
  else
    L1_40()
    for L4_43 = RIGHT_LANE, LEFT_LANE do
      L5_44 = GetDampener
      L5_44 = L5_44(TEAM_ORDER, L4_43)
      SetDampenerRespawnAnimationDuration(L5_44, ORDER_INHIBITOR_RESPAWN_ANIMATION_DURATION)
      L5_44 = GetDampener(TEAM_CHAOS, L4_43)
      SetDampenerRespawnAnimationDuration(L5_44, CHAOS_INHIBITOR_RESPAWN_ANIMATION_DURATION)
      SetLaneExposed(TEAM_ORDER, L4_43, false)
      SetLaneExposed(TEAM_CHAOS, L4_43, false)
      SetLaneTowerCount(TEAM_ORDER, L4_43, 3)
      SetLaneTowerCount(TEAM_CHAOS, L4_43, 3)
    end
    L1_40(L2_41)
    L1_40(L2_41)
    L1_40(L2_41, L3_42)
    L1_40(L2_41, L3_42)
    L1_40(L2_41, L3_42)
  end
end
function OppositeTeam(A0_45)
  if A0_45 == TEAM_CHAOS then
    return TEAM_ORDER
  else
    return TEAM_CHAOS
  end
end
function OnGameStartup()
  LuaForEachChampion(TEAM_UNKNOWN, "ApplyBountyTrackerBuff")
end
function AllowDamageOnBuildings()
  local L0_46, L1_47, L2_48, L3_49, L4_50, L5_51, L6_52
  L0_46 = CENTER_LANE
  for L4_50 = BACK_TOWER2, FRONT_TOWER do
    L5_51 = GetTurret
    L6_52 = TEAM_ORDER
    L5_51 = L5_51(L6_52, L0_46, L4_50)
    if L5_51 ~= nil then
      L6_52 = FRONT_TOWER
      if L4_50 == L6_52 then
        L6_52 = SetInvulnerable
        L6_52(L5_51, false)
        L6_52 = SetTargetable
        L6_52(L5_51, true)
      else
        L6_52 = SetInvulnerable
        L6_52(L5_51, true)
        L6_52 = SetNotTargetableToTeam
        L6_52(L5_51, true, TEAM_CHAOS)
      end
    else
    end
    L6_52 = GetTurret
    L6_52 = L6_52(TEAM_CHAOS, L0_46, L4_50)
    if L6_52 ~= nil then
      if L4_50 == FRONT_TOWER then
        SetInvulnerable(L6_52, false)
        SetTargetable(L6_52, true)
      else
        SetInvulnerable(L6_52, true)
        SetNotTargetableToTeam(L6_52, true, TEAM_ORDER)
      end
    else
    end
  end
end
function ResetToDefaultWaveCounts(A0_53)
  local L1_54, L2_55
  for _FORV_6_, _FORV_7_ in pairs(A0_53) do
    _FORV_7_.NumPerWave = _FORV_7_.DefaultNumPerWave
  end
end
function ClearCurrentWaveCounts(A0_56)
  local L1_57, L2_58
  for _FORV_6_, _FORV_7_ in pairs(A0_56) do
    _FORV_7_.NumPerWave = 0
  end
end
function GetInitSpawnInfo(A0_59, A1_60)
  local L2_61, L3_62, L4_63
  L2_61 = 0
  L3_62 = TEAM_ORDER
  if A1_60 == L3_62 then
    L3_62 = OrderBarracksBonuses
    L4_63 = A0_59 + 1
    L2_61 = L3_62[L4_63]
  else
    L3_62 = ChaosBarracksBonuses
    L4_63 = A0_59 + 1
    L2_61 = L3_62[L4_63]
  end
  L3_62 = {}
  L4_63 = SpawnTable
  L4_63 = L4_63.WaveSpawnRate
  L3_62.WaveSpawnRate = L4_63
  L4_63 = SpawnTable
  L4_63 = L4_63.SingleMinionSpawnDelay
  L3_62.SingleMinionSpawnDelay = L4_63
  L4_63 = L2_61.IsDestroyed
  L3_62.IsDestroyed = L4_63
  L4_63 = L2_61.MinionInfoTable
  L3_62.MinionInfoTable = L4_63
  ReturnTable = L3_62
  L3_62 = ReturnTable
  return L3_62
end
function GetMinionSpawnInfo(A0_64, A1_65, A2_66, A3_67, A4_68)
  local L5_69, L6_70, L7_71
  L5_69 = 0
  L6_70 = TEAM_ORDER
  if A3_67 == L6_70 then
    L6_70 = OrderBarracksBonuses
    L5_69 = L6_70[1]
  else
    L6_70 = ChaosBarracksBonuses
    L5_69 = L6_70[1]
  end
  L6_70 = L5_69.MinionInfoTable
  L6_70 = L6_70.Super
  L7_71 = L5_69.MinionInfoTable
  L7_71 = L7_71.Cannon
  ResetToDefaultWaveCounts(L5_69.MinionInfoTable)
  if A1_65 % CANNON_MINION_SPAWN_FREQUENCY == 0 then
    L7_71.NumPerWave = L7_71.NumPerWave + 1
  end
  if A4_68 ~= LAST_WAVE then
    BARRACKSCOUNT = 6
    totalMinionsRemaining = MAX_MINIONS_EVER - GetTotalTeamMinionsSpawned()
    LAST_WAVE = A4_68
  end
  if L5_69.WillSpawnSuperMinion == 1 then
    L6_70.NumPerWave = 1
    L7_71.NumPerWave = 0
  end
  ReturnTable = {
    NewFormat = true,
    SpawnOrderMinionNames = L5_69.SpawnOrderMinionNames,
    IsDestroyed = L5_69.IsDestroyed,
    ExperienceRadius = SpawnTable.ExpRadius,
    GoldRadius = SpawnTable.GoldRadius,
    MinionInfoTable = L5_69.MinionInfoTable
  }
  return ReturnTable
end
function UpgradeMinionTimer()
  local L0_72, L1_73, L2_74, L3_75, L4_76, L5_77, L6_78, L7_79, L8_80, L9_81, L10_82, L11_83
  UpgradedMinionIterations = L1_73
  L1_73(L2_74, L3_75)
  for L4_76 = 1, 2 do
    if L4_76 == 1 then
      L0_72 = OrderBarracksBonuses
    else
      L0_72 = ChaosBarracksBonuses
    end
    for L8_80 = 1, 3 do
      L9_81, L10_82 = nil, nil
      L11_83 = L0_72[L8_80]
      L11_83 = L11_83.MinionInfoTable
      for _FORV_15_, _FORV_16_ in pairs(L11_83) do
        if UpgradedMinionIterations >= UPGRADE_MINION_ITERATIONS_FOR_LATE_SCALING then
        end
        _FORV_16_.HPBonus = _FORV_16_.HPBonus + (_FORV_16_.HPUpgrade + _FORV_16_.HPUpgradeLate)
        _FORV_16_.HPUpgrade = _FORV_16_.HPUpgrade + (_FORV_16_.HPUpgradeGrowth + _FORV_16_.HPUpgradeGrowthLate)
        _FORV_16_.DamageBonus = _FORV_16_.DamageBonus + _FORV_16_.DamageUpgrade
        _FORV_16_.GoldBonus = _FORV_16_.GoldBonus + _FORV_16_.GoldUpgrade
        if _FORV_16_.GoldBonus > _FORV_16_.GoldMaximumBonus then
          _FORV_16_.GoldBonus = _FORV_16_.GoldMaximumBonus
        end
        _FORV_16_.LocalGoldBonus = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShareUpgrade
        _FORV_16_.Armor = _FORV_16_.Armor
        _FORV_16_.MagicResistance = _FORV_16_.MagicResistance
        _FORV_16_.ExpBonus = _FORV_16_.ExpBonus + _FORV_16_.ExpUpgrade
        _FORV_16_.GoldGiven = _FORV_16_.GoldBonus + _FORV_16_.GoldGivenBase
        _FORV_16_.LocalGoldGiven = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShared
        _FORV_16_.ExpGiven = _FORV_16_.ExpBonus + _FORV_16_.ExpGivenBase
      end
    end
  end
end
function DeactivateCorrectStructure(A0_84, A1_85, A2_86)
  local L3_87, L4_88
  L4_88 = GetGameMode
  L4_88 = L4_88()
  if L4_88 ~= "TUTORIAL" then
    L4_88 = TEAM_ORDER
    if A0_84 == L4_88 then
      L3_87 = OrderBuildingStatus
    else
      L3_87 = ChaosBuildingStatus
    end
    L4_88 = FRONT_TOWER
    if A2_86 == L4_88 then
      L3_87.Turret4 = false
      L4_88 = GetTurret
      L4_88 = L4_88(A0_84, A1_85, MID_TOWER)
      SetInvulnerable(L4_88, false)
      SetTargetable(L4_88, true)
    else
      L4_88 = MID_TOWER
      if A2_86 == L4_88 then
        L3_87.Turret3 = false
        L4_88 = GetDampener
        L4_88 = L4_88(A0_84, A1_85)
        SetInvulnerable(L4_88, false)
        SetTargetable(L4_88, true)
      else
        L4_88 = BACK_TOWER
        if A2_86 ~= L4_88 then
          L4_88 = BACK_TOWER2
        elseif A2_86 == L4_88 then
          L4_88 = BACK_TOWER
          if A2_86 == L4_88 then
            L3_87.Turret2 = false
          else
            L3_87.Turret1 = false
          end
          L4_88 = L3_87.Turret1
          if L4_88 == false then
            L4_88 = L3_87.Turret2
            if L4_88 == false then
              L4_88 = GetHQ
              L4_88 = L4_88(A0_84)
              SetInvulnerable(L4_88, false)
              SetTargetable(L4_88, true)
            end
          end
        end
      end
    end
  end
end
function GetLuaBarracks(A0_89, A1_90)
  local L2_91, L3_92, L4_93
  L3_92 = TEAM_ORDER
  if A0_89 == L3_92 then
    L3_92 = OrderBarracksBonuses
    L4_93 = A1_90 + 1
    L2_91 = L3_92[L4_93]
  else
    L3_92 = ChaosBarracksBonuses
    L4_93 = A1_90 + 1
    L2_91 = L3_92[L4_93]
  end
  return L2_91
end
function GetDisableMinionSpawnTime(A0_94, A1_95)
  barrack = GetLuaBarracks(A1_95, A0_94)
  return DISABLE_MINION_SPAWN_BASE_TIME + DISABLE_MINION_SPAWN_MAG_TIME * barrack.NumOfSpawnDisables
end
function DisableBarracksSpawn(A0_96, A1_97)
  cLangBarracks = GetBarracks(A1_97, A0_96)
  luaBarrack = GetLuaBarracks(A1_97, A0_96)
  SetDisableMinionSpawn(cLangBarracks, GetDisableMinionSpawnTime(A0_96, A1_97))
  luaBarrack.NumOfSpawnDisables = luaBarrack.NumOfSpawnDisables + 1
end
BonusesCounter = 0
function ApplyBarracksDestructionBonuses(A0_98, A1_99)
  local L2_100, L3_101, L4_102, L5_103, L6_104
  L2_100 = BonusesCounter
  L2_100 = L2_100 + 1
  BonusesCounter = L2_100
  L2_100 = 1
  L3_101 = nil
  L4_102 = TEAM_ORDER
  if A0_98 == L4_102 then
    L3_101 = OrderBarracksBonuses
  else
    L3_101 = ChaosBarracksBonuses
  end
  L4_102, L5_103 = nil, nil
  L6_104 = L3_101[L2_100]
  L6_104 = L6_104.MinionInfoTable
  for _FORV_10_, _FORV_11_ in pairs(L6_104) do
    _FORV_11_.HPBonus = _FORV_11_.HPBonus + _FORV_11_.HPInhibitor
    _FORV_11_.DamageBonus = _FORV_11_.DamageBonus + _FORV_11_.DamageInhibitor
    _FORV_11_.ExpGiven = _FORV_11_.ExpGiven - _FORV_11_.ExpInhibitor
    _FORV_11_.GoldGiven = _FORV_11_.GoldGiven - _FORV_11_.GoldInhibitor
  end
  L3_101[L2_100].WillSpawnSuperMinion = 1
end
function ApplyBarracksRespawnReductions(A0_105, A1_106)
  local L2_107, L3_108, L4_109, L5_110, L6_111, L7_112, L8_113, L9_114
  L2_107 = Log
  L3_108 = "Inhibitor respawn, barrack ID is: "
  L4_109 = A1_106
  L3_108 = L3_108 .. L4_109
  L2_107(L3_108)
  L2_107 = CENTER_LANE
  L3_108 = nil
  L4_109 = TEAM_ORDER
  if A0_105 == L4_109 then
    L3_108 = OrderBarracksBonuses
  else
    L3_108 = ChaosBarracksBonuses
  end
  L4_109, L5_110 = nil, nil
  L6_111 = L3_108[L2_107]
  L6_111 = L6_111.MinionInfoTable
  for _FORV_10_, _FORV_11_ in L7_112(L8_113) do
    _FORV_11_.HPBonus = _FORV_11_.HPBonus - _FORV_11_.HPInhibitor
    _FORV_11_.DamageBonus = _FORV_11_.DamageBonus - _FORV_11_.DamageInhibitor
    _FORV_11_.ExpGiven = _FORV_11_.ExpGiven + _FORV_11_.ExpInhibitor
    _FORV_11_.GoldGiven = _FORV_11_.GoldGiven + _FORV_11_.GoldInhibitor
  end
  L7_112.WillSpawnSuperMinion = 0
  if A0_105 == L7_112 then
    L8_113(L9_114, true)
    L8_113(L9_114, false)
    if L8_113 ~= Nil then
      SetInvulnerable(L8_113, true)
      SetNotTargetableToTeam(L8_113, true, A0_105)
    end
    if L9_114 ~= Nil then
      SetInvulnerable(L9_114, true)
      SetNotTargetableToTeam(L9_114, true, A0_105)
    end
  elseif A0_105 == L7_112 then
    L8_113(L9_114, true)
    L8_113(L9_114, false)
    if L8_113 ~= Nil then
      SetInvulnerable(L8_113, true)
      SetNotTargetableToTeam(L8_113, true, A0_105)
    end
    if L9_114 ~= Nil then
      SetInvulnerable(L9_114, true)
      SetNotTargetableToTeam(L9_114, true, A0_105)
    end
  end
end
function BarrackReactiveEvent(A0_115, A1_116)
  local L2_117
  L2_117 = OppositeTeam(A0_115)
  dampener = GetDampener(A0_115, A1_116)
  SetInvulnerable(dampener, false)
  SetTargetable(dampener, true)
  ApplyBarracksRespawnReductions(L2_117, A1_116)
end
function HandleDestroyedObject(A0_118)
  local L1_119, L2_120, L3_121
  L1_119 = GetHQType
  L2_120 = A0_118
  L1_119 = L1_119(L2_120)
  HQType = L1_119
  L1_119 = HQType
  L2_120 = ORDER_HQ
  if L1_119 ~= L2_120 then
    L1_119 = HQType
    L2_120 = CHAOS_HQ
  elseif L1_119 == L2_120 then
    L1_119 = HQType
    L2_120 = CHAOS_HQ
    if L1_119 == L2_120 then
      L1_119 = EndOfGameCeremony
      L2_120 = TEAM_ORDER
      L3_121 = A0_118
      L1_119(L2_120, L3_121)
    else
      L1_119 = EndOfGameCeremony
      L2_120 = TEAM_CHAOS
      L3_121 = A0_118
      L1_119(L2_120, L3_121)
    end
    return
  end
  L1_119 = IsDampener
  L2_120 = A0_118
  L1_119 = L1_119(L2_120)
  if L1_119 then
    L1_119 = GetLinkedBarrack
    L2_120 = A0_118
    L1_119 = L1_119(L2_120)
    barrack = L1_119
    L1_119 = GetTeamID
    L2_120 = barrack
    L1_119 = L1_119(L2_120)
    barrackTeam = L1_119
    L1_119 = GetLane
    L2_120 = A0_118
    L1_119 = L1_119(L2_120)
    barrackLane = L1_119
    L1_119 = DisableBarracksSpawn
    L2_120 = barrackLane
    L3_121 = barrackTeam
    L1_119(L2_120, L3_121)
    L1_119 = SetDampenerState
    L2_120 = A0_118
    L3_121 = DampenerRegenerationState
    L1_119(L2_120, L3_121)
    L1_119 = SetInvulnerable
    L2_120 = A0_118
    L3_121 = true
    L1_119(L2_120, L3_121)
    L1_119 = SetTargetable
    L2_120 = A0_118
    L3_121 = false
    L1_119(L2_120, L3_121)
    L1_119 = GetGameMode
    L1_119 = L1_119()
    if L1_119 == "TUTORIAL" then
      L1_119 = GetHQ
      L2_120 = Team
      L1_119 = L1_119(L2_120)
      L2_120 = SetInvulnerable
      L3_121 = L1_119
      L2_120(L3_121, false)
      L2_120 = SetTargetable
      L3_121 = L1_119
      L2_120(L3_121, true)
    else
      L1_119 = GetTurret
      L2_120 = barrackTeam
      L3_121 = barrackLane
      L1_119 = L1_119(L2_120, L3_121, BACK_TOWER)
      L2_120 = GetTurret
      L3_121 = barrackTeam
      L2_120 = L2_120(L3_121, barrackLane, BACK_TOWER2)
      L3_121 = Nil
      if L1_119 ~= L3_121 then
        L3_121 = SetInvulnerable
        L3_121(L1_119, false)
        L3_121 = SetTargetable
        L3_121(L1_119, true)
      end
      L3_121 = Nil
      if L2_120 ~= L3_121 then
        L3_121 = SetInvulnerable
        L3_121(L2_120, false)
        L3_121 = SetTargetable
        L3_121(L2_120, true)
      end
      L3_121 = Nil
      if L1_119 == L3_121 then
        L3_121 = Nil
        if L2_120 == L3_121 then
          L3_121 = GetHQ
          L3_121 = L3_121(barrackTeam)
          SetInvulnerable(L3_121, false)
          SetTargetable(L3_121, true)
        end
      end
    end
    L1_119 = nil
    L2_120 = barrackTeam
    L3_121 = TEAM_CHAOS
    if L2_120 == L3_121 then
      L1_119 = TEAM_ORDER
    else
      L1_119 = TEAM_CHAOS
    end
    L2_120 = ApplyBarracksDestructionBonuses
    L3_121 = L1_119
    L2_120(L3_121, barrackLane)
  end
  L1_119 = IsTurretAI
  L2_120 = A0_118
  L1_119 = L1_119(L2_120)
  if L1_119 then
    L1_119 = GetTeamID
    L2_120 = A0_118
    L1_119 = L1_119(L2_120)
    L2_120 = GetObjectLaneId
    L3_121 = A0_118
    L2_120 = L2_120(L3_121)
    L3_121 = GetTurretPosition
    L3_121 = L3_121(A0_118)
    DeactivateCorrectStructure(L1_119, L2_120, L3_121)
    return
  end
  L1_119 = GetDampenerType
  L2_120 = A0_118
  L1_119 = L1_119(L2_120)
  if L1_119 > -1 then
    L2_120 = 0
    L3_121 = TEAM_ORDER
    if L1_119 % TEAM_CHAOS == CENTER_LANE then
      L2_120 = ChaosBarracksBonuses[L1_119 % TEAM_CHAOS + 1]
      ChaosBuildingStatus.Barracks = false
    else
      L3_121 = TEAM_CHAOS
      L2_120 = OrderBarracksBonuses[L1_119 % TEAM_CHAOS - TEAM_ORDER + 1]
      OrderBuildingStatus.Barracks = false
    end
  else
    L2_120 = Log
    L3_121 = "Could not find Linking barracks!"
    L2_120(L3_121)
  end
  L2_120 = true
  return L2_120
end
TEAM_UNKNOWN = 0
EOG_PAN_TO_NEXUS_TIME = 3
EOG_NEXUS_EXPLOSION_TIME = EOG_PAN_TO_NEXUS_TIME + 0.5
EOG_SCOREBOARD_PHASE_DELAY_TIME = 1.2
EOG_NEXUS_REVIVE_TIME = 10
EOG_ALIVE_NEXUS_SKIN = 0
EOG_DESTROYED_NEXUS_SKIN = 1
EOG_MINION_FADE_AMOUNT = 0
EOG_MINION_FADE_TIME = 2
function EndOfGameCeremony(A0_122, A1_123)
  orderHQ = GetHQ(TEAM_ORDER)
  SetInvulnerable(orderHQ, true)
  SetTargetable(orderHQ, false)
  SetBuildingHealthRegenEnabled(orderHQ, false)
  chaosHQ = GetHQ(TEAM_CHAOS)
  SetInvulnerable(chaosHQ, true)
  SetTargetable(chaosHQ, false)
  SetBuildingHealthRegenEnabled(chaosHQ, false)
  winningTeam = A0_122
  if winningTeam == TEAM_ORDER then
    losingTeam = TEAM_CHAOS
    losingHQPosition = GetPosition(chaosHQ)
    winningHQPosition = GetPosition(orderHQ)
  else
    losingTeam = TEAM_ORDER
    losingHQPosition = GetPosition(orderHQ)
    winningHQPosition = GetPosition(chaosHQ)
  end
  SetInputLockForAllClients(INPUT_LOCK_CAMERA_LOCKING, true)
  SetInputLockForAllClients(INPUT_LOCK_CAMERA_MOVEMENT, true)
  SetInputLockForAllClients(INPUT_LOCK_ABILITIES, true)
  SetInputLockForAllClients(INPUT_LOCK_SUMMONER_SPELLS, true)
  SetInputLockForAllClients(INPUT_LOCK_MOVEMENT, true)
  SetInputLockForAllClients(INPUT_LOCK_SHOP, true)
  SetInputLockForAllClients(INPUT_LOCK_MINIMAP_MOVEMENT, true)
  DisableHUDForEndOfGame()
  SetBarracksSpawnEnabled(false)
  CloseShop()
  HaltAllAI()
  LuaForEachChampion(TEAM_UNKNOWN, "ChampionEoGCeremony")
  Log("Destroy Nexus Called")
  InitTimer("DestroyNexusPhase", EOG_NEXUS_EXPLOSION_TIME, false)
end
function ChampionEoGCeremony(A0_124)
  MoveCameraFromCurrentPositionToPoint(A0_124, losingHQPosition, EOG_PAN_TO_NEXUS_TIME, true)
  SetGreyscaleEnabledWhenDead(A0_124, false)
end
function DestroyNexusPhase()
  if GetEoGUseNexusDeathAnimation() == false then
    SetHQCurrentSkin(losingTeam, EOG_DESTROYED_NEXUS_SKIN)
  end
  FadeMinions(losingTeam, EOG_MINION_FADE_AMOUNT, EOG_MINION_FADE_TIME)
  InitTimer("StopRenderingMinionsPhase", EOG_MINION_FADE_TIME, false)
  InitTimer("ScoreboardPhase", EOG_SCOREBOARD_PHASE_DELAY_TIME, false)
  Log("Destroy Nexus Reached")
end
function StopRenderingMinionsPhase()
  SetMinionsNoRender(losingTeam, true)
end
function ScoreboardPhase()
  Log("Scoreboard reached.")
  SetInputLockForAllClients(INPUT_LOCK_CHAT, true)
  EndGame(winningTeam)
end
EOG_EASTER_EGG_PAN_TO_NEXUS_DELAY = 20
EOG_EASTER_EGG_CAMERA_PATH_TIME = 154
EOG_EASTER_EGG_MUSIC_FADE_TIME = 4
function PostGameSetup(A0_125)
  local L1_126, L2_127, L3_128, L4_129, L5_130
  L1_126 = GetGameMode
  L1_126 = L1_126()
  if L1_126 ~= "ARAM" then
    return
  end
  L2_127 = Make3DPoint
  L3_128 = 2586
  L4_129 = 0
  L5_130 = 1986
  L2_127 = L2_127(L3_128, L4_129, L5_130)
  L3_128 = Make3DPoint
  L4_129 = 10702
  L5_130 = 0
  L3_128 = L3_128(L4_129, L5_130, 10193)
  L4_129 = {
    L5_130,
    Make3DPoint(2500, 0, 2000),
    Make3DPoint(2500, 0, 2000)
  }
  L5_130 = Make3DPoint
  L5_130 = L5_130(5700, 0, 6900)
  L5_130 = {
    Make3DPoint(5700, 0, 6900),
    Make3DPoint(10700, 0, 10700),
    Make3DPoint(10700, 0, 10700)
  }
  if A0_125 == TEAM_CHAOS then
    L2_127, L3_128 = L3_128, L2_127
  end
  POST_GAME_EVENTS = {
    [1] = {delay = EOG_EASTER_EGG_PAN_TO_NEXUS_DELAY},
    [2] = {
      delay = EOG_EASTER_EGG_PAN_TO_NEXUS_DELAY + EOG_EASTER_EGG_MUSIC_FADE_TIME,
      soundCharacterName = "Lissandra",
      soundName = "freljordlore",
      cameraPath = L5_130,
      travelTime = EOG_EASTER_EGG_CAMERA_PATH_TIME
    }
  }
end
function PostGameUpdate(A0_131, A1_132, A2_133)
  local L3_134, L4_135, L5_136, L6_137
  if A1_132 ~= A2_133 then
    return
  end
  for L6_137, _FORV_7_ in L3_134(L4_135) do
    if A0_131 > _FORV_7_.delay then
      if _FORV_7_.cameraLocation then
        ClientSide_CameraMoveCameraFromCurrentPositionToPoint(_FORV_7_.cameraLocation, _FORV_7_.travelTime)
      end
      if _FORV_7_.cameraPath then
        ClientSide_CameraMoveCameraFromCurrentPositionAlongSpline(_FORV_7_.cameraPath, _FORV_7_.travelTime)
      end
      if _FORV_7_.soundName then
        if _FORV_7_.soundCharacterName then
          ClientSide_PlayGenericVOSoundFile(_FORV_7_.soundCharacterName, _FORV_7_.soundName)
        else
          ClientSide_PlaySoundFile(_FORV_7_.soundName)
        end
      end
      table.remove(POST_GAME_EVENTS, L6_137)
      break
    end
  end
end
