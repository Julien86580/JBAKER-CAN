--
-- EmberAC (https://github.com/Julien86580/Emberac-AntiCheat-Fivem)
-- Copyright 2023-2028 by Julien&Julie Vendeta(Masturlute) (https://github.com/Julien86580/)
-- Licensed under the GNU Affero General Public License v3.0
--

EMBERAC                          = {}

--【 𝗩𝗲𝗿𝘀𝗶𝗼𝗻 𝗖𝗵𝗲𝗰𝗸 】--
EMBERAC.Version                  = "6.2.3"

--【 𝗦𝗲𝗿𝘃𝗲𝗿 𝗦𝗲𝘁𝘁𝗶𝗻𝗴𝘀 】--
EMBERAC.ServerConfig             = {
    Name = "YOUR SERVER NAME",
    Port = "30120",
}

--【 𝗟𝗼𝗴 𝗼𝗳 𝗗𝗶𝘀𝗰𝗼𝗿𝗱 】--
EMBERAC.Log                      = {
    Ban        = "",
    Error      = "",
    Connect    = "",
    Disconnect = "",
    Exoplosion = "",
}

--【 𝗖𝗵𝗮𝘁 𝗦𝗲𝘁𝘁𝗶𝗻𝗴𝘀 】--
EMBERAC.ChatSettings             = {
    Enable      = true,
    PrivateWarn = true,
}

--【 𝗦𝗰𝗿𝗲𝗲𝗻𝗦𝗵𝗼𝘁 】--
EMBERAC.ScreenShot               = {
    Enable  = true,
    Format  = "PNG",
    Quality = 1,
    Log     = ""
}

--【 𝗖𝗼𝗻𝗻𝗲𝗰𝘁𝗶𝗼𝗻 𝗦𝗲𝘁𝘁𝗶𝗻𝗴𝘀 】--
EMBERAC.Connection               = {
    AntiBlackListName = true,
    AntiVPN           = true,
    HideIP            = true,
}

--【 𝗠𝗲𝘀𝘀𝗮𝗴𝗲 】--
EMBERAC.Message                  = {
    Kick = "You Are ⚡️ Kicked From Server Protection By EMBERAC® Don't Try For Cheat in this Server",
    Ban  = "You Are ⛔️ Banned By EMBERAC Form Server Please Make Ticket in Our Server ",
}

--【 𝗔𝗱𝗺𝗶𝗻 𝗠𝗲𝗻𝘂 】--
EMBERAC.AdminMenu                = {
    Enable         = true,
    Key            = "INSERT",
    MenuPunishment = "BAN",
}

--【 𝗔𝗻𝘁𝗶 𝗧𝗿𝗮𝗰𝗸 𝗣𝗹𝗮𝘆𝗲𝗿 】--
EMBERAC.AntiTrackPlayer          = false
EMBERAC.MaxTrack                 = 10
EMBERAC.TrackPunishment          = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗛𝗲𝗮𝗹𝘁𝗵 𝗛𝗮𝗰𝗸 】--
EMBERAC.AntiHealthHack           = true
EMBERAC.MaxHealth                = 200
EMBERAC.HealthPunishment         = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗔𝗿𝗺𝗼𝗿 𝗛𝗮𝗰𝗸 】--
EMBERAC.AntiArmorHack            = true
EMBERAC.MaxArmor                 = 100
EMBERAC.ArmorPunishment          = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗧𝗮𝘀𝗸𝘀 】--
EMBERAC.AntiBlacklistTasks       = true
EMBERAC.TasksPunishment          = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗣𝗹𝗮𝘆 𝗔𝗻𝗶𝗺𝘀 】--
EMBERAC.AntiBlacklistAnims       = true
EMBERAC.AnimsPunishment          = "BAN"

--【 𝗦𝗮𝗳𝗲 𝗣𝗹𝗮𝘆𝗲𝗿𝘀 】--
EMBERAC.SafePlayers              = true
EMBERAC.AntiInfinityAmmo         = true

--【 𝗔𝗻𝘁𝗶 𝗦𝗽𝗲𝗰𝘁𝗮𝘁𝗲 】--
EMBERAC.AntiSpectate             = true
EMBERAC.SpactatePunishment       = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗪𝗲𝗮𝗽𝗼𝗻 】--
EMBERAC.AntiBlackListWeapon      = true
EMBERAC.AntiAddWeapon            = true
EMBERAC.AntiRemoveWeapon         = true
EMBERAC.AntiWeaponsExplosive     = true
EMBERAC.WeaponPunishment         = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗚𝗼𝗱𝗠𝗼𝗱𝗲 】--
EMBERAC.AntiGodMode              = false
EMBERAC.GodPunishment            = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗜𝗻𝘃𝗶𝘀𝗶𝗯𝗹𝗲 】--
EMBERAC.AntiInvisible            = true
EMBERAC.InvisiblePunishment      = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗖𝗵𝗮𝗻𝗴𝗲 𝗦𝗽𝗲𝗲𝗱 】--
EMBERAC.AntiChangeSpeed          = true
EMBERAC.SpeedPunishment          = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗙𝗿𝗲𝗲 𝗖𝗮𝗺 】--
EMBERAC.AntiFreeCam              = false
EMBERAC.CamPunishment            = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗥𝗮𝗶𝗻𝗯𝗼𝘄 𝗩𝗲𝗵𝗶𝗰𝗹𝗲 】--
EMBERAC.AntiRainbowVehicle       = true
EMBERAC.RainbowPunishment        = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗣𝗹𝗮𝘁𝗲 】--
EMBERAC.AntiPlateChanger         = true
EMBERAC.AntiBlackListPlate       = true
EMBERAC.PlatePunishment          = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗩𝗶𝘀𝗶𝗼𝗻 】--
EMBERAC.AntiNightVision          = true
EMBERAC.AntiThermalVision        = true
EMBERAC.VisionPunishment         = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗦𝘂𝗽𝗲𝗿 𝗝𝘂𝗺𝗽 】--
EMBERAC.AntiSuperJump            = true
EMBERAC.JumpPunishment           = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗧𝗲𝗹𝗲𝗽𝗼𝗿𝘁 】--
EMBERAC.AntiTeleport             = true
EMBERAC.MaxFootDistance          = 200
EMBERAC.MaxVehicleDistance       = 600
EMBERAC.TeleportPunishment       = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗡𝗼𝗰𝗹𝗶𝗽 】--
EMBERAC.AntiNoclip               = false
EMBERAC.NoclipPunishment         = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗣𝗲𝗱 𝗖𝗵𝗮𝗻𝗴𝗲𝗿 】--
EMBERAC.AntiPedChanger           = true
EMBERAC.PedChangePunishment      = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗜𝗻𝗳𝗶𝗻𝗶𝘁𝗲 𝗦𝘁𝗮𝗺𝗶𝗻𝗮 】--
EMBERAC.AntiInfiniteStamina      = false
EMBERAC.InfinitePunishment       = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗥𝗮𝗴𝗱𝗼𝗹𝗹 】--
EMBERAC.AntiRagdoll              = false
EMBERAC.RagdollPunishment        = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗠𝗲𝗻𝘆𝗼𝗼 】--
EMBERAC.AntiMenyoo               = false
EMBERAC.MenyooPunishment         = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗔𝗶𝗺 𝗔𝘀𝘀𝗶𝘀𝘁 】--
EMBERAC.AntiAimAssist            = false
EMBERAC.AimAssistPunishment      = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗥𝗲𝘀𝗼𝘂𝗿𝗰𝗲 】--
EMBERAC.AntiResourceStopper      = true
EMBERAC.AntiResourceStarter      = false
EMBERAC.AntiResourceRestarter    = false
EMBERAC.ResourcePunishment       = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗖𝗵𝗮𝗻𝗴𝗲 𝗙𝗹𝗮𝗴 】--
EMBERAC.AntiTinyPed              = true
EMBERAC.PedFlagPunishment        = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗦𝘂𝗶𝗰𝗶𝗱𝗲 】--
EMBERAC.AntiSuicide              = false
EMBERAC.SuicidePunishment        = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗖𝗼𝗹𝗹𝗲𝗰𝘁𝗲𝗱 𝗣𝗶𝗰𝗸𝘂𝗽 】--
EMBERAC.AntiPickupCollect        = true
EMBERAC.PickupPunishment         = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗖𝗵𝗮𝘁 】--
EMBERAC.AntiSpamChat             = true
EMBERAC.MaxMessage               = 10
EMBERAC.CoolDownSec              = 3
EMBERAC.ChatPunishment           = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗖𝗼𝗺𝗺𝗮𝗻𝗱 】--
EMBERAC.AntiBlackListCommands    = true
EMBERAC.CMDPunishment            = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗖𝗵𝗮𝗻𝗴𝗲 𝗗𝗮𝗺𝗮𝗴𝗲 】--
EMBERAC.AntiWeaponDamageChanger  = true
EMBERAC.AntiVehicleDamageChanger = true
EMBERAC.DamagePunishment         = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗪𝗼𝗿𝗱 】--
EMBERAC.AntiBlackListWord        = true
EMBERAC.WordPunishment           = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗕𝗿𝗶𝗻𝗴 𝗔𝗹𝗹 】--
EMBERAC.AntiBringAll             = true
EMBERAC.BringAllPunishment       = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗧𝗿𝗶𝗴𝗴𝗲𝗿 】--
EMBERAC.AntiBlackListTrigger     = true
EMBERAC.AntiSpamTrigger          = true
EMBERAC.TriggerPunishment        = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗖𝗹𝗲𝗮𝗿 𝗣𝗲𝗱 𝗧𝗮𝘀𝗸𝘀 】--
EMBERAC.AntiClearPedTasks        = true
EMBERAC.MaxClearPedTasks         = 5
EMBERAC.CPTPunishment            = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗧𝗮𝘇𝗲 𝗣𝗹𝗮𝘆𝗲𝗿𝘀 】--
EMBERAC.AntiTazePlayers          = true
EMBERAC.MaxTazeSpam              = 3
EMBERAC.TazePunishment           = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗜𝗻𝗷𝗲𝗰𝘁 】--
EMBERAC.AntiInject               = false
EMBERAC.InjectPunishment         = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗘𝘅𝗽𝗹𝗼𝘀𝗶𝗼𝗻 】--
EMBERAC.AntiBlackListExplosion   = true
EMBERAC.AntiExplosionSpam        = true
EMBERAC.MaxExplosion             = 10
EMBERAC.ExplosionSpamPunishment  = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗘𝗻𝘁𝗶𝘁𝘆 𝗦𝗽𝗮𝘄𝗻𝗲𝗿 】--
EMBERAC.AntiBlackListObject      = true
EMBERAC.AntiBlackListPed         = true
EMBERAC.AntiBlackListBuilding    = true
EMBERAC.AntiBlackListVehicle     = true
EMBERAC.EntityPunishment         = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗘𝗻𝘁𝗶𝘁𝘆 𝗦𝗽𝗮𝗺𝗲𝗿 】--
EMBERAC.AntiSpawnNPC             = false

EMBERAC.AntiSpamVehicle          = true
EMBERAC.MaxVehicle               = 10

EMBERAC.AntiSpamPed              = true
EMBERAC.MaxPed                   = 4

EMBERAC.AntiSpamObject           = true
EMBERAC.MaxObject                = 15

EMBERAC.SpamPunishment           = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗖𝗵𝗮𝗻𝗴𝗲 𝗣𝗲𝗿𝗺 】--
EMBERAC.AntiChangePerm           = true
EMBERAC.PermPunishment           = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗣𝗹𝗮𝘆 𝗦𝗼𝘂𝗻𝗱 】--
EMBERAC.AntiPlaySound            = true
EMBERAC.SoundPunishment          = "KICK"
