Config = Config or {}

Config.OnlyShowOnDuty = true
Config.UseCQCMugshot = true

-- Front, Back Side. Use 4 for both sides, we recommend leaving at 1 for default.
Config.MugPhotos = 1

Config.MugShotSpots = {
    ["missionrow"] = {
        signLabel = "LSPD Mission Row",
        camX = 479.0,
        camY = -984.8743,
        camZ = 21.8,
        camRot = {x = 0.0, y = 0.0, z = 90.0},
        suspectHeading = 269.6102,
        suspectX = 477.5081,
        suspectY = -984.9333,
        suspectZ = 20.5595,
    },    
    ["boling"] = {
        signLabel = "Pénitentier de Bolingbroke",
        camX = 1828.69,
        camY = 2581.72,
        camZ = 46.3,
        camRot = {x = 0.0, y = 0.0, z = 92.23},
        suspectHeading = 265.00,
        suspectX = 1827.63,
        suspectY = 2581.7,
        suspectZ = 44.89,
    },
    ["sandy"] = {
        signLabel = "BCSO Sandy Shore",
        camX = 1814.5914,
        camY = 3664.3955,
        camZ = 34.1892,
        camRot = {x = 0.0, y = 0.0, z = 92.0},
        suspectHeading = 298.7003,
        suspectX = 1813.3495,
        suspectY = 3663.9260,
        suspectZ = 33.1893,
    },
}

-- If set to true = Fine gets automatically removed from bank automatically charging the player.
-- If set to false = The fine gets sent as an Invoice to their phone and it us to the player to pay for it, can remain unpaid and ignored.
Config.BillVariation = true

-- If set to false (default) = The fine amount is just being removed from the player's bank account
-- If set to true = The fine amount is beeing added to the society account after being removed from the player's bank account
Config.QBManagementUse = false

-- Set up your inventory to automatically retrieve images when a weapon is registered at a weapon shop or self-registered.
-- If you're utilizing lj-inventory's latest version from GitHub, no further modifications are necessary. 
-- However, if you're using a different inventory system, please refer to the "Inventory Edit | Automatic Add Weapons with images" section in ps-mdt's README.
Config.InventoryForWeaponsImages = "ox_inventory"

-- "LegacyFuel", "lj-fuel", "ps-fuel"
Config.Fuel = "ps-fuel"

Config.dispatchName = "ps-dispatch-esx"

-- ['License Name'] = true/false. If false, license are set to false by default.
Config.Licenses = {
    ['dmv'] = false,
    ['drive'] = false,
    ['drive_bike'] = false,
    ['drive_truck'] = false,
    ['weapon_a'] = false,
    ['weapon_b'] = false,
    ['weapon_c'] = false,
}

-- Google Docs Link
Config.sopLink = {
    ['police'] = '',
    ['ambulance'] = '',
    ['bcso'] = '',
    ['doj'] = '',
    ['sast'] = '',
    ['sasp'] = '',
    ['doc'] = '',
    ['lssd'] = '',
    ['sapr'] = '',
}

-- Google Docs Link
Config.RosterLink = {
    ['police'] = 'https://docs.google.com/spreadsheets/d/1NDxo4Th_bAwD4q04b7QXEKC4SM22p7-yBjrWn8YJGbo/edit#gid=0',
    ['ambulance'] = '',
    ['bcso'] = '',
    ['gouv'] = 'https://docs.google.com/spreadsheets/d/1cjmhHVil3-XDDC3HxwV8FJQSSSlREXRH4n4JRqF8Bag/edit#gid=0',
    ['doj'] = '',
    ['sast'] = '',
    ['sasp'] = '',
    ['doc'] = '',
    ['lssd'] = '',
    ['sapr'] = '',	
}

Config.PoliceJobs = {
    ['police'] = true,
    ['lspd'] = false,
    ['bcso'] = true,
    ['sast'] = false,
    ['sasp'] = false,
    ['doc'] = false,
    ['lssd'] = false,
    ['sapr'] = false,
    ['pa'] = false
}

Config.AmbulanceJobs = {
    ['ambulance'] = true,
    ['pompier'] = true
}

Config.DojJobs = {
    ['gouv'] = true,
    ['lawyer'] = false,
    ['judge'] = false
}

-- This is a workaround solution because the qb-menu present in qb-policejob fills in an impound location and sends it to the event. 
-- If the impound locations are modified in qb-policejob, the changes must also be implemented here to ensure consistency.

Config.ImpoundLocations = {
    [1] = vector4(436.68, -1007.42, 27.32, 180.0),
    [2] = vector4(-436.14, 5982.63, 31.34, 136.0),
}

-- Support for Wraith ARS 2X. 

Config.UseWolfknightRadar = true
Config.WolfknightNotifyTime = 15000 -- How long the notification displays for in milliseconds (30000 = 30 seconds)
Config.PlateScanForDriversLicense = false -- If true, plate scanner will check if the owner of the scanned vehicle has a drivers license

-- IMPORTANT: To avoid making excessive database queries, modify this config to true 'CONFIG.use_sonorancad = true' setting in the configuration file located at 'wk_wars2x/config.lua'. 
-- Enabling this setting will limit plate checks to only those vehicles that have been used by a player.

Config.LogPerms = {
	['ambulance'] = {
		[4] = true,
	},
	['police'] = {
		[4] = true,
	},
    ['bcso'] = {
		[4] = true,
	},
    ['sast'] = {
		[4] = true,
	},
    ['sasp'] = {
		[4] = true,
	},
    ['sapr'] = {
		[4] = true,
	},
    ['doc'] = {
		[4] = true,
	},
    ['lssd'] = {
		[4] = true,
	},
}

Config.RemoveIncidentPerms = {
	['ambulance'] = {
		[4] = true,
	},
	['police'] = {
		[4] = true,
	},
    ['bcso'] = {
		[4] = true,
	},
    ['sast'] = {
		[4] = true,
	},
    ['sasp'] = {
		[4] = true,
	},
    ['sapr'] = {
		[4] = true,
	},
    ['doc'] = {
		[4] = true,
	},
    ['lssd'] = {
		[4] = true,
	},
}

Config.RemoveReportPerms = {
	['ambulance'] = {
		[4] = true,
	},
	['police'] = {
		[4] = true,
	},
    ['bcso'] = {
		[4] = true,
	},
    ['sast'] = {
		[4] = true,
	},
    ['sasp'] = {
		[4] = true,
	},
    ['sapr'] = {
		[4] = true,
	},
    ['doc'] = {
		[4] = true,
	},
    ['lssd'] = {
		[4] = true,
	},
}

Config.RemoveWeaponsPerms = {
	['ambulance'] = {
		[4] = true,
	},
	['police'] = {
		[4] = true,
	},
    ['bcso'] = {
		[4] = true,
	},
    ['sast'] = {
		[4] = true,
	},
    ['sasp'] = {
		[4] = true,
	},
    ['sapr'] = {
		[4] = true,
	},
    ['doc'] = {
		[4] = true,
	},
    ['lssd'] = {
		[4] = true,
	},
}

Config.PenalCodeTitles = {
    [1] = "INFRACTIONS AU CODE DE LA ROUTE",
    [2] = "ATTEINTES A LA VIE",
    [3] = "ATTEINTES AU CORPS",
    [4] = "ATTEINTES A L'ESPRIT",
    [5] = "L'ACCAPAREMENT DE BIENS",
    [6] = "L'ALTÉRATION DE BIENS",
    [7] = "LA PROPRIÉTÉ",
    [8] = "ATTEINTES A L'AUTORITÉ",
    [9] = "ATTEINTES A LA SOCIÉTÉ",
    [10] = "ARMES ET STUPÉFIANTS",
}

Config.PenalCode = {
	[1] = {
	    [1] = {title = "Conduite sans permis", class = "Délit Routier", id = "C.P. 1001", months = 0, fine = 1200, color = "yellow", description = "Est qualifié de délit routier de conduite sans permis le fait de conduire un engin motorisé terrestre sans être titulaire du présent document."},
	    [2] = {title = "Défaut de matériel", class = "Infraction Routière", id = "C.P. 1002", months = 0, fine = 500, color = "green", description = "Est qualifiée d’infraction routière de défaut de matériel le fait de conduire un véhicule dont l’état peut mettre en danger la vie du conducteur ou celle des usagers."},
	    [3] = {title = "Dissimulation de plaque", class = "Infraction Routière", id = "C.P. 1003", months = 0, fine = 800, color = "green", description = "Est qualifié d’infraction routière dissimulation de plaque le fait de dissimuler, brouiller ou rendre illisible sa plaque par quelque moyen que ce soit."},
	    [4] = {title = "Faux avertisseurs lumineux", class = "Délit Routier", id = "C.P. 1004", months = 2, fine = 1500, color = "yellow", description = "Est qualifié de délit routier de faux avertisseurs lumineux le fait pour un conducteur d’un véhicule dit “non prioritaire” d’utiliser ces outils sur la voie publique."},
	    [5] = {title = "Non respect d'un stop", class = "Infraction Routière", id = "C.P. 1005", months = 0, fine = 100, color = "green", description = "Est qualifiée d’infraction routière de non-respect d’un stop le fait de ne pas s’arrêter lorsqu’une indication stop est indiquée."},
	    [6] = {title = "Excés de Vitesse", class = "Infraction Routière", id = "C.P. 1006", months = 0, fine = 200, color = "green", description = "Est qualifiée d’infraction routière d'excès de vitesse le fait de rouler à plus de 10 km/h au-dessus des limites fixées."},
	    [7] = {title = "Excés de Vitesse Aggravé", class = "Infraction Routière", id = "C.P. 1007", months = 0, fine = 500, color = "green", description = "Est considérée comme circonstance aggravante le fait de rouler au plus de 30 km/h au-dessus des limites prévues."},
	    [8] = {title = "Conduite à Contre-Sens", class = "Infraction Routière", id = "C.P. 1008", months = 0, fine = 250, color = "green", description = "Est qualifiée d’infraction routière de conduite à contre-sens le fait de rouler sur la mauvaise voie et dans le mauvais sens."},
	    [9] = {title = "Stationnement Gênant", class = "Infraction Routière", id = "C.P. 1009", months = 0, fine = 100, color = "green", description = "Est qualifiée d’infraction routière de stationnement gênant le fait de gêner le trafic ou d’obstruer le passage par le placement ou le stationnement de son véhicule."},
	    [10] = {title = "Conduite sans casque ou ceinture", class = "Infraction Routière", id = "C.P. 1010", months = 0, fine = 75, color = "green", description = "Est qualifiée d’infraction routière de conduite sans casque ou ceinture le fait de rouler en véhicule deux roues ou quatre roues sans port de casque ou de ceinture."},
	    [11] = {title = "Conduite Dangereuse", class = "Délit Routier", id = "C.P. 1011", months = 2, fine = 600, color = "green", description = "Est qualifié de délit routier de conduite dangereuse le fait de part l’attitude du conducteur, sa façon de conduire ou les différentes infractions qu’il commet."},
	    [12] = {title = "Téléphone au Volant", class = "Infraction Routière", id = "C.P. 1012", months = 0, fine = 0, color = "green", description = "Est qualifiée d’infraction routière de téléphone au volant le fait d’utiliser son téléphone en conduisant."},
	    [13] = {title = "Possession de NOS", class = "Infraction Routière", id = "C.P. 1013", months = 0, fine = 800, color = "green", description = "Est qualifiée d’infraction routière de possession de NOS le fait de posséder un tel accessoire."},
	    [14] = {title = "Conduite en État Altéré", class = "Infraction Routière", id = "C.P. 1014", months = 4, fine = 1000, color = "green", description = "Est qualifié de délit routier le fait de conduire sous l’emprise d’une substance illicite telle que de la drogue, même obtenue légalement pour usage médical, des médicaments contre-indiqués ou encore de l’alcool."},
	},
    
	[2] = {
	    [1] = {title = "L'homicide volontaire", class = "Crime", id = "C.P. 2001", months = 72, fine = 40000, color = "red", description = "Est qualifié de crime d’homicide volontaire le fait d’ôter la vie volontairement à autrui par quelque moyen que ce soit."},
	    [2] = {title = "L'homicide volontaire aggravé", class = "Crime", id = "C.P. 2002", months = 120, fine = 75000, color = "red", description = "Circonstances aggravantes : Agent de police ; Victime Mineure ; Torture ou violences ; Meurtres en Série"},
	    [3] = {title = "Assassinat", class = "Crime", id = "C.P. 2003", months = 280, fine = 50000, color = "red", description = "Est qualifié de crime d’assassinat le fait d’ôter volontairement la vie à autrui en organisant, préparant, préméditation l’acte à l’avance."},
	    [4] = {title = "Assassinat aggravé", class = "Crime infâmant", id = "C.P. 2004", months = 99999, fine = 80000, color = "red", description = "Le fait de commettre un Assassinat dans les circonstances prévues par l’Article I du présent chapitre concernant l’homicide volontaire transforme cet acte en violence volontaire ayant entraîné la mort “aggravée”. - Peine de Mort ou Perpétuité"},
	    [5] = {title = "Violence volontaire ayant entraînée la mort", class = "Crime", id = "C.P. 2005", months = 24, fine = 15000, color = "red", description = "Est qualifiée de crime violence volontaire ayant entraîné la mort le fait d’exercer des violences volontairement à l’encontre d’autrui sans intention de lui donner la mort et, par mégarde, de lui ôter la vie."},
	    [6] = {title = "Violence volontaire ayant entraînée la mort aggravée ", class = "Crime", id = "C.P. 2006", months = 30, fine = 25000, color = "red", description = "Le fait de commettre la violence volontaire ayant entraîné la mort dans les circonstances prévues par l’Article I du présent chapitre concernant l’homicide volontaire transforme cet acte en violence volontaire ayant entraîné la mort “aggravée”."},
	    [7] = {title = "Mise en péril de la vie d'autrui", class = "Délit mineur", id = "C.P. 2007", months = 6, fine = 6000, color = "yellow", description = "Est qualifiée de délit de mise en péril de la vie d’autrui le fait pour toute personne de par ses actes délibérément de mettre en danger la vie d’une autre personne. La résultante n’étant ni la blessure ou la mort de cette dernière."},
	    [8] = {title = "Incitation au suicide", class = "Délit mineur", id = "C.P. 2008", months = 2, fine = 2500, color = "yellow", description = "Est qualifié de délit d’incitation au suicide le fait d’inciter une personne à se donner la mort sans que cette dernière ne décède."},
	    [9] = {title = "Non assistance à personne en danger", class = "Délit mineur", id = "C.P. 2009", months = 3, fine = 7500, color = "yellow", description = "Est qualifié de délit de non assistance à personne en danger le fait de ne pas porter secours volontairement à une personne en péril alors que cela était possible. Ne peut être considéré comme coupable de non assistance à personne en danger la personne qui a contacté les secours."},
	    [10] = {title = "L'homicide involontaire'", class = "Crime", id = "C.P. 2010", months = 4, fine = 9500, color = "red", description = "Est qualifié de crime d’homicide involontaire le fait de donner la mort à autrui sans avoir eu l’intention de la donner. La mort peut résulter d’une acte d’imprudence, de négligence, de maladresse ou de manquement à une obligation de prudence ou de sécurité."},
	    [11] = {title = "L'homicide involontaire aggravé", class = "Crime", id = "C.P. 2011", months = 8, fine = 12000, color = "red", description = "Le fait que l’acte ayant causé la mort a été commis volontairement transforme alors le présent crime en “homicide volontaire aggravée”."},
	},
		
    [3] = {
        [1] = {title = 'La mutilation', class = 'Crime', id = 'P.C. 3001', months = 24, fine = 10500, color = 'red', description = "Est qualifié de crime de mutilation le fait de causer sur une autre personne une mutilation persistante sur le long terme, une invalidité, une amputation ou l’ablation directe ou indirecte de quelque partie de son corps."},
        [2] = {title = 'La mutilation aggravé', class = 'Crime', id = 'P.C. 3002', months = 30, fine = 25000, color = 'red', description = "Circonstances aggravantes : Agent de police ; Victime Mineure ; Torture ou violences ; Crime de haine ; Acte commis en groupe"},
        [3] = {title = 'Violence majeure', class = 'Délit majeur', id = 'P.C. 3003', months = 6, fine = 8000, color = 'orange', description = "Est qualifié de crime de violence majeure le fait d’exercer sur autrui par quelque moyen que ce soit, même sans contact physique une violence entraînant une blessure ou un traumatisme persistant sur plus de 10 jours."},
        [4] = {title = 'Violence majeure aggravée', class = 'Crime', id = 'P.C. 3004', months = 12, fine = 15000, color = 'red', description = "Le fait de commettre une violence majeure dans les circonstances prévues dans l’Article I du présent chapitre concernant la mutilation transforme cet acte en violence majeure “aggravée”."},
        [5] = {title = 'Violence mineure', class = 'Délit mineur', id = 'P.C. 3005', months = 2, fine = 5000, color = 'yellow', description = "Est qualifié de délit mineur de violence mineure le fait d’exercer sur autrui par quelque moyen que ce soit, même sans contact physique une violence entraînant une blessure ou un traumatisme persistant sur moins de 10 jours."},
        [6] = {title = 'Violence mineure aggravée', class = 'Délit majeur', id = 'P.C. 3006', months = 6, fine = 7500, color = 'orange', description = "Le fait de commettre une violence mineure dans les circonstances prévues dans l’Article I du présent chapitre concernant la mutilation transforme cet acte en violence mineure “aggravée”."},
        [7] = {title = 'Séquestration', class = 'Crime', id = 'P.C. 3007', months = 24, fine = 8000, color = 'crime', description = "Est qualifié de crime de séquestration le fait d’entraver la liberté de déplacement contre la loi et le plein gré d’autrui par la force, la contrainte, l’entrave ou l’intimidation."},
        [8] = {title = 'Séquestration aggravée', class = 'Crime', id = 'P.C. 3008', months = 36, fine = 15000, color = 'red', description = "Le fait de commettre une séquestration dans les circonstances prévues dans l’Article I du présent chapitre concernant la mutilation transforme cet acte en séquestration “aggravée”."},
        [9] = {title = 'Viol', class = 'Crime', id = 'P.C. 3009', months = 600, fine = 175000, color = 'red', description = "Est qualifié de crime de viol le fait de pénétrer sexuellement une autre personne sans son consentement, par la ruse, la force, l’entrave, la menace."},
        [10] = {title = 'Viol aggravé', class = 'Crime', id = 'P.C. 3010', months = 9999, fine = 250.000, color = 'red', description = "Le fait de commettre un viol dans les circonstances prévues dans l’Article I du présent chapitre I de la présente section concernant la mutilation transforme cet acte en viol “aggravé”. - Peine de mort ou perpétuité"},
        [11] = {title = 'Aggression sexuelle', class = 'Crime', id = 'P.C. 3011', months = 36, fine = 10000, color = 'red', description = "Est qualifié de crime d’agression sexuelle l’acte physique, le comportement ou la parole qui par sa nature ou sa répétition induit une violence de nature sexuelle n’impliquant cependant aucunes pénétration."},
        [12] = {title = 'Aggression sexuelle aggravée', class = 'Crime', id = 'P.C. 3012', months = 72, fine = 22500, color = 'red', description = "Le fait de commettre une agression sexuelle dans les circonstances prévues dans l’Article I du présent chapitre I de la présente section concernant la mutilation transforme cet acte en agression sexuelle “aggravée”."},
    },
    [4] = {
        [1] = {title = 'Injure', class = 'Infraction pénale', id = 'P.C. 4001', months = 0, fine = 500, color = 'green', description = "Est qualifiée d’infraction le fait de tenir un propos, cri, discours, image, objet ou diffusion de tout élément hautement offensant atteignant la dignité, la réputation ou l’honneur d’autrui."},
        [2] = {title = 'Injure aggravée', class = 'Infraction pénale', id = 'P.C. 4002', months = 0, fine = 1500, color = 'green', description = "Injure aggravée si : Racisme, diffusion presse ou réseaux sociaux"},
        [3] = {title = 'Diffamation', class = 'Délit mineur', id = 'P.C. 4003', months = 2, fine = 1500, color = 'yellow', description = "Est qualifié de délit mineur de diffamation le fait d’imputer malicieusement à autrui un fait non avéré soit en sachant que c’est faux, soit en négligent profondément sa vérification. "},
        [4] = {title = 'Diffamation aggravée', class = 'Délit majeur', id = 'P.C. 4004', months = 3, fine = 4000, color = 'orange', description = "Le fait de commettre une une diffamation dans les circonstances prévues dans l’Article I du présent chapitre concernant l’injure transforme cet acte en diffamation “aggravée”."},
        [5] = {title = 'Hacèlement', class = 'Délit majeur', id = 'P.C. 4005', months = 8, fine = 7500, color = 'orange', description = "Est qualifié de délit de harcèlement le fait de tenir des propos, actes ou comportements qui par leur récurrence sont de nature à bouleverser la qualité de vie ou le psychisme de la personne en faisant l’objet."},
        [6] = {title = 'Harcèlement aggravé', class = 'Délit majeur', id = 'P.C. 4006', months = 12, fine = 15000, color = 'orange', description = "Harcèlement dans le cadre du handicap, de la religion, orientation sexuelle, nature sexuelle, statut autoritaire"},
        [7] = {title = 'Menace', class = 'Délit mineur', id = 'P.C. 4007', months = 2, fine = 4500 , color = 'yellow', description = "Est qualifié de délit mineur de menace le fait d’affirmer, de sous-entendre ou de montrer de manière explicite qu’une personne encourt un risque quelconque de manière malicieuse et illégitime.        "},
        [8] = {title = 'Menace aggravée', class = 'Délit majeur', id = 'P.C. 4008', months = 6, fine = 10000, color = 'orange', description = "Menace en raison de la sexualité, Nature sexuelle, avec arme"},
    },
    [5] = {
        [1] = {title = 'Le braquage', class = 'Crime', id = 'P.C. 5001', months = 60, fine = 10000, color = 'red', description = "Est qualifié de crime de braquage le fait d’attaquer un convoi de fonds, un coffre recelant des fonds ou une banque en vue de s’approprier les fonds et effets qui y sont stockés."},
        [2] = {title = 'Vol au troisième degré', class = 'Délit majeur', id = 'P.C. 5002', months = 30, fine = 4000, color = 'orange', description = "Est qualifié de délit majeur de vol au troisième degré le fait de soustraire frauduleusement le bien appartenant à autrui à l’aide d’une arme à feu (Intimidation, menace, tir) ou par l’usage de la violence physique sur une ou plusieurs victimes."},
        [3] = {title = 'Vol au second degré', class = 'Délit majeur', id = 'P.C. 5003', months = 24, fine = 2500, color = 'orange', description = "Est qualifié de délit majeur de vol au second degré le fait de soustraire frauduleusement le bien appartenant à autrui à l’aide de la dégradation ou l’altération d’un bien, usage d’une arme blanche, introduction dans le domicile, usage de menaces contre une ou plusieurs personnes ou qu’il s’agit d’une véhicule occupé ou un bien porté par la victime."},
        [4] = {title = 'Vol au premier', class = 'Délit mineur', id = 'P.C. 5004', months = 18, fine = 1500, color = 'yellow', description = "Est qualifié de délit mineur de vol au premier degré le fait de soustraire frauduleusement le bien appartenant à autrui sans aucune atteinte au bien, sans pénétrer illégalement dans un domicile, sans usage d’armes et sans atteinte aux personnes."},
        [5] = {title = 'Le recel', class = 'Délit mineur', id = 'P.C. 5005', months = 12, fine = 5000, color = 'yellow', description = "Est qualifié de délit mineur de recel le fait de détenir, posséder ou vendre un bien ou une donnée issue d’une infraction à la loi soit de nature illégale."},
        [6] = {title = 'Extorsion', class = 'Délit majeur', id = 'P.C. 5006', months = 3, fine = 8000, color = 'orange', description = "Est qualifié de délit majeur d’extorsion le fait pour toute personne d’user de menaces, d’atteintes aux biens ou aux personnes en vue de dérober malicieusement un bien ou un service de manière régulière."},
        [7] = {title = 'Le chantage', class = 'Délit majeur', id = 'P.C. 5007', months = 6, fine = 5000, color = 'orange', description = "Est considéré comme un délit majeur de chantage le fait d’effectuer les actes caractérisant l’extorsion mais de manière ponctuelle ou non régulière."},
        [8] = {title = 'Abus de confiance', class = 'Délit mineur', id = 'P.C. 5008', months = 3, fine = 4500, color = 'yellow', description = "Est qualifié de délit mineur d’abus de confiance le fait de faire un usage illégitime d’un bien, d’un moyen confié par autrui dans un but précis et connu et de par ce détournement causer du tort à autrui."},
        [9] = {title = 'Escroquerie', class = 'Délit majeur', id = 'P.C. 5009', months = 9, fine = 10000, color = 'orange', description = "Est qualifié de délit majeur d’escroquerie le fait de tromper volontairement et malicieusement autrui dans le cadre d’une transaction par la présentation d’une fausse offre, en connaissance de de cause afin d’obtenir un avantage ou une contrepartie indue."},
    },
    [6] = {
        [1] = {title = 'La destruction de bien', class = 'Délit mineur', id = 'P.C. 6001', months = 12, fine = 8000, color = 'yellow', description = "Est qualifié de délit mineur de destruction de biens le fait de détruire en totalité ou en quasi totalité un bien ou une donnée de manière à le rendre inopérant."},
        [2] = {title = 'La destruction de bien aggravée', class = 'Délit majeur', id = 'P.C. 6002', months = 18, fine = 12000, color = 'orange', description = "Aggravée si : Propriété immobilière, En raison de la race, la religion, orientation sexuelle, utilisation de matériaux incendiers ou explosifs. "},
        [3] = {title = 'Dégradation majeure', class = 'Délit majeur', id = 'P.C. 6003', months = 6, fine = 5000, color = 'orange', description = "Est qualifié de délit majeur de dégradation majeure le fait d’altérer durablement et gravement un bien en nuisant ainsi à sa fonctionnalité."},
        [4] = {title = 'Dégradation majeure aggravée', class = 'Délit majeur', id = 'P.C. 6004', months = 9, fine = 8000, color = 'orange', description = "Le fait de commettre une dégradation majeure dans les circonstances prévues dans l’Article I de la présente section concernant la destruction de biens transforme cet acte en dégradation majeure “aggravée”."},
        [5] = {title = 'Dégradation mineure', class = 'Délit mineur', id = 'P.C. 6005', months = 3, fine = 3500, color = 'yellow', description = "Est qualifié de délit mineur de dégradation mineure le fait d’altérer un bien sans corrompre sa fonctionnalité."},
        [6] = {title = 'Dégradation mineure aggravée', class = 'Délit majeur', id = 'P.C. 6006', months = 5, fine = 6000, color = 'orange', description = "Le fait de commettre une dégradation majeure dans les circonstances prévues dans l’Article I de la présente section concernant la destruction de biens transforme cet acte en dégradation mineure “aggravée”."},
    },
    [7] = {
        [1] = {title = 'Intrusion', class = 'Délit mineur', id = 'P.C. 7001', months = 6, fine = 2000, color = 'yellow', description = "Est qualifié de délit mineur d’intrusion le fait d’utiliser, de fouiller ou de s’introduire dans un bien mobilier ou immobilier sans autorisation de la loi ou de son propriétaire."},
        [2] = {title = 'Intrusion aggravée', class = 'Délit majeur', id = 'P.C. 7002', months = 9, fine = 6000, color = 'orange', description = "Aggravé si : Intrusion chez un avocat ou journaliste "},
    },
    [8] = {
        [1] = {title = 'Délit de fuite', class = 'Délit majeur', id = 'P.C. 8001', months = 12, fine = 8000, color = 'orange', description = "Est qualifié de délit majeur de fuite le fait pour toute personne de ne pas vouloir informer la victime ou les autorités de son acte ou de son identité notamment en prenant la fuite alors que l’individu a causé, occasionné ou a été impliqué dans un accident de la route. Qu’il a commis un acte de violence physique sur une personne ou qu’il a commis une dégradation voire destruction sur un bien."},
        [2] = {title = 'Entrave aux secours', class = 'Délit mineur', id = 'P.C. 8002', months = 6, fine = 5000, color = 'yellow', description = "Est qualifié de délit mineur d’entrave aux secours le fait de ralentir, gêner, bloquer ou de compliquer les conditions d’intervention des secours publics ou individuels de personnes ou de biens malgré les sommations de cesser."},
        [3] = {title = 'Entrave aux secours aggravée', class = 'Crime', id = 'P.C. 8003', months = 60, fine = 12.500, color = 'red', description = "Aggravée si : Entraîne le décés de plusieurs victimes, Permet une aggravation de la situation"},
        [4] = {title = 'La fausse alerte', class = 'Infraction pénale', id = 'P.C. 8004', months = 0, fine = 1000, color = 'green', description = "Est qualifiée d’infraction pénale de fausse alerte le fait pour toute personne de contacter les services de secours afin de les faire intervenir sur un cas inexistant ou alors en donnant de fausses informations."},
        [5] = {title = 'La dissimulation de visage', class = 'Infraction pénale', id = 'P.C. 8005', months = 0, fine = 1500, color = 'orange', description = "Est qualifiée d’infraction pénale de dissimulation de visage le fait pour toute personne de dissimuler son visage volontairement ou malicieusement dans un lieu public, sans motifs légitimes et malgré une demande de la police de cesser la dissimulation."},
        [6] = {title = 'Outrage', class = 'Délit mineur', id = 'P.C. 8006', months = 1, fine = 1500, color = 'yellow', description = "Est qualifié de délit mineur d’outrage le fait de diffamer un agent public dans le cadre de ses fonctions et notamment un policier, un membre du gouvernement, un magistrat ou un membre de l’administration."},
        [7] = {title = 'Refus d"identification', class = 'Infraction pénale', id = 'P.C. 8007', months = 0, fine = 2000, color = 'green', description = "Est qualifiée d’infraction pénale de refus d’identification le fait pour toute personne de refuser présenter son permis de conduire lors d’un contrôle routier, soit sa carte d’identité lors d’un contrôle d’identité. Le fait de refuser de donner sa réelle identité en cas de défaut de papiers est considéré comme un refus d’identification."},
        [8] = {title = 'Défaut de paiement', class = 'Délit mineur', id = 'P.C. 8008', months = 2, fine = 1500, color = 'yellow', description = "Est considéré comme un délit mineur de défaut de paiement le fait pour un individu de refuser de payer l’amende à laquelle il a été condamné. S’il refuse de payer une amende émanant d’une décision de justice, il s’agit d’une entrave à la justice."},
        [9] = {title = 'Piraterie', class = 'Délit majeur', id = 'P.C. 8009', months = 6, fine = 6500, color = 'orange', description = "Est considéré comme délit majeur de piraterie le fait de piloter un hélicoptère, un avion ou un hydravion sans être titulaire du permis de vol ou de conduire un navire sans être titulaire du permis bateau. Le fait de manipuler un de ces engins de manière dangereuse, d’accoster ou de se poser sur le domaine public de la ville de Los Santos ou sur une propriété privée est également considéré comme acte de piraterie."},
        [10] = {title = 'Attroupement illégal', class = 'Délit mineur', id = 'P.C. 8010', months = 6, fine = 5000, color = 'yellow', description = "Est considéré comme délit mineur d’attroupement illégal le fait de former un groupe sur la voie publique ou dans un espace ouvert au public est considéré comme un attroupement illégal si bagarres, entrave de la circulation, entrave aux secours, permet la fuite ou une infraction"},
        [11] = {title = 'Incitation à l’émeute', class = 'Délit majeur', id = 'P.C. 8011', months = 12, fine = 8000, color = 'orange', description = "Est qualifié de délit majeur d’incitation à l’émeute le fait d’inciter autrui à participer à une émeute ou à former une émeute, ou bien à maintenir une émeute malgré l’action de la police. La condamnation pour incitation à l’émeute s’applique également au protagoniste absent de la manifestation mais ayant contribué à la déclencher."},
        [12] = {title = 'Atteinte aux symboles nationaux', class = 'Délit mineur', id = 'P.C. 8012', months = 6, fine = 4000, color = 'yellow', description = "Est qualifié de délit mineur d’atteinte aux symboles nationaux le fait de brûler, abîmer, insulter ou attenter physiquement que ce le drapeau national, l’hymne national ou autre symbole national."},
        [13] = {title = 'Embuscade', class = 'Délit majeur', id = 'P.C. 8013', months = 48, fine = 10000, color = 'orange', description = "Est qualifié de délit majeur d’embuscade le fait d’attendre malicieusement dans un lieu précis des agents des forces publics avec l’intention claire de les attaquer à leur passage."},
        [14] = {title = 'Mercenariat', class = 'Délit majeur', id = 'P.C. 8014', months = 120, fine = 15000, color = 'orange', description = "Est qualifié de délit majeur de mercenariat le fait pour toute personne de proposer ou de solliciter un prix, un bien ou un service en échange de l’exécution d’un crime. Le délit est constitué par la seule proposition ou demande même si elle n’a pas donné suite. N’est pas un brigand celui qui, pour contribuer à l’action de l’autorité publique et de la Justice, en échange d’une récompense, livre ou neutralise un fugitif ou un évadé dans le respect de la Loi."},
        [15] = {title = 'Mercenariat infâmant', class = 'Crime', id = 'P.C. 8015', months = 180, fine = 20000, color = 'red', description = "Infâmant si : Mutilation, torture, enlèvement, utilisation d’armes explosives ou incendiaires, sur agent des services publics"},
        [16] = {title = 'Évasion', class = 'Délit majeur', id = 'P.C. 8016', months = 60, fine = 6000, color = 'orange', description = "Est considéré comme délit d’évasion le fait pour toute personne d’échapper à la garde judiciaire à laquelle il est astreint dans les cas suivants : Fuite après arrestation, Fuite après placement en détention provisoire, Fuite après condamnation à la détention, Fuite hors de la zone du contrôle judiciaire"},
        [17] = {title = 'Entrave à la justice', class = 'Délit mineur', id = 'P.C. 8017', months = 9, fine = 4000, color = 'yellow', description = "Est qualifiée de délit mineur d’entrave à la justice le fait de ralentir, entraver, compromettre, empêcher ou nuire de quelque manière que ce soit à l’exécution du mandat d’un juge."},
        [18] = {title = 'Entrave à la justice aggravée', class = 'Délit majeur', id = 'P.C. 8018', months = 24, fine = 8000, color = 'orange', description = "Le fait de commettre une entrave à la justice dans les circonstances prévues dans l’Article I de la présente section concernant l’évasion transforme cet acte en entrave à la justice “aggravée”."},
        [19] = {title = 'Altération de preuve', class = 'Délit mineur', id = 'P.C. 8019', months = 15, fine = 4000, color = 'yellow', description = "Est qualifié de délit mineur d’altération de preuve le fait d’altérer, corrompre, dissimuler, dégrader une preuve."},
        [20] = {title = 'Altération de preuve aggravée', class = 'Délit majeur', id = 'P.C. 8020', months = 18, fine = 6000, color = 'orange', description = "Altération entraîne condamnation d’un innocent, conduit à la libération d’une personne coupable."},
        [21] = {title = 'Parjure', class = 'Délit mineur', id = 'P.C. 8021', months = 6, fine = 2000, color = 'yellow', description = "Est qualifié de délit mineur de parjure le fait au cours d’une audience civile ou pénale, devant un juge de déclarer volontairement un fait erroné en connaissance de cause, de s’abstenir volontairement de mentionner toute ou partie de la vérité."},
        [22] = {title = 'Parjure aggravé', class = 'Délit majeur', id = 'P.C. 8022', months = 36, fine = 8000, color = 'orange', description = "Le parjure entraîne la libération d’une personne coupable, le parjure entraine la condamnation d’un innocent, le parjure entraîne un non lieu"},
        [23] = {title = 'Outrage à la cour', class = 'Délit mineur', id = 'P.C. 8023', months = 1, fine = 2500, color = 'yellow', description = "Est qualifié de délit mineur d’outrage à la cour le fait pour une personne au cours d’une audience civile ou pénale de commettre un outrage dans les conditions fixées dans l’article III, section I, chapitre I concernant l’outrage orienté contre un juge."},
        [24] = {title = 'Refus d’obtempérer', class = 'Délit mineur', id = 'P.C. 8024', months = 3, fine = 4000, color = 'yellow', description = "Est qualifié de délit mineur de refus d’obtempérer le fait pour toute personne d’opposer une résistance active à la sommation d’un policier ayant annoncé sa qualité. Pour que l’infraction soit constituée, la résistance doit être active. Le simple fait de résister passivement n’est pas un refus d’obtempérer. Le fait de fuir, de se mouvoir, de résister même sans violence à l’action de la police est en revanche un refus d’obtempérer."},
        [25] = {title = 'Faux à une administration', class = 'Délit mineur', id = 'P.C. 8025', months = 6, fine = 3500, color = 'yellow', description = "Est qualifié de délit mineur de faux à une administration le fait pour toute personne, par une déclaration écrite notamment le remplissage d’un formulaire de faire malicieusement à une administration publique une fausse déclaration en connaissance de cause."},
        [26] = {title = 'Usurpation', class = 'Délit majeur', id = 'P.C. 8026', months = 9, fine = 2500, color = 'orange', description = "Est qualifié de délit majeur d’usurpation le fait pour toute personne de prétendre malicieusement avoir un titre ou une fonction ou bien de laisser croire par un comportement, le port d’un objet ou la présentation d’un document ou d’un uniforme."},
        [27] = {title = 'Falsification de document', class = 'Délit mineur', id = 'P.C. 8027', months = 12, fine = 5000, color = 'yellow', description = "Est qualifié de délit mineur de classification de document le fait pour toute personne de posséder, utiliser, créer, transporter ou stocker, malicieusement et en connaissance de cause, un document présentant l’apparence d’un document officiel donnant un droit, un avantage ou un titre, alors que ce document n’est pas un vrai, est un délit qualifié 'falsification de document'."},
        [28] = {title = 'Falsification de monnaie', class = 'Crime', id = 'P.C. 8028', months = 36, fine = 15000, color = 'red', description = "Est qualifié de crime de falsification de monnaie le fait pour toute personne de posséder, utiliser, créer, transporter ou stocker, malicieusement, une monnaie falsifiant la monnaie officielle, en conséquence de cause, est un crime de 'falsification de monnaie'"},
        [29] = {title = 'Abus de pouvoir', class = 'Délit majeur', id = 'P.C. 8029', months = 18, fine = 5000, color = 'orange', description = "Est qualifié de délit majeur d’abus de pouvoir le fait pour un agent public, ou une personne investie d’une mission de service public, de ne pas suivre les seuls principes énoncés dans les circonstances aggravantes de cet article lors de l’exercice de ses prérogatives. L’abus de pouvoir se définit aussi par les violations des procédures légales, notamment en matière criminelle, que commisent par les agents (notamment de police) dans leurs fonctions, le manquement au devoir que le policier a d’exécuter les lois et de protéger les citoyens, leurs biens, l’ordre public, la Loi et la Justice est également un délit d’abus de pouvoir. Il est aussi qualifié même si l’auteur ne tire aucun bénéfice personnel, et même si il n’y a aucun abus direct d’une prérogative."},
        [30] = {title = 'Abus de pouvoir aggravé', class = 'Crime', id = 'P.C. 8030', months = 36, fine = 15000, color = 'red', description = "Aggravé si : Perquisition illégale du domicile, facilite un crime, atteinte à la justice, permet un meutre ou un assassinat"},
        [31] = {title = 'Corruption', class = 'Délit majeur', id = 'P.C. 8031', months = 36, fine = 8000, color = 'orange', description = "Est qualifié de délit majeur de corruption le fait pour toute personne de proposer ou de solliciter, en l’échange de l’usage indu ou l’absence d’usage d’une prérogative liée à une fonction publique, un bien, un service, ou quelconque autre contrepartie."},
        [32] = {title = 'Séparatisme', class = 'Crime', id = 'P.C. 8032', months = 1200, fine = 50000, color = 'red', description = "Est qualifié de crime de séparatisme l’appropriation d’un territoire, d’un bien, d’un service ou d’une institution par la formation d’un mouvement séditieux ou d’une révolte visant à créer une autonomie vis-à -vis de l’État ou de la nation. - Peine de mort ou perpétuité"},
        [33] = {title = 'Terrorisme', class = 'Crime', id = 'P.C. 8033', months = 1200, fine = 50000, color = 'red', description = "Est qualifié de crime de terrorisme l'atteinte à l'intégrité de la Nation, de ses institutions fédérales, de son (ou leur) fonctionnement, ou de ses intérêts directs (commerciaux inclus), sur ou hors du territoire national, par la commission d’actes répréhensibles par la loi, violents, ou frauduleux en vu de destabiliser durablement le gouvernement, la nation ou sa population, ou bien de terroriser les masses. - Peine de mort ou perpétuité"},
        [34] = {title = 'Sedition', class = 'Crime', id = 'P.C. 8034', months = 1200, fine = 50000, color = 'red', description = "Est qualifié de crime de sédition le crime de séparatisme, lorsqu'il n'est pas commis par des agents publics. - Peine de mort ou perpétuité"},
        [35] = {title = 'Collusion criminelle', class = 'Crime', id = 'P.C. 8035', months = 120, fine = 20000, color = 'red', description = "Est qualifiée de crime de collusion criminelle l’entente volontaire de plusieurs personnes en vue de se préparer à commettre, de commettre, de faciliter à commettre, la commission d’une infraction ; ou bien de faciliter la fuite ou la non identification des auteurs d’une infraction est un crime."},
    },
    [9] = {
        [1] = {title = 'Mendicité', class = 'Infraction pénale', id = 'P.C. 9001', months = 1, fine = 300, color = 'green', description = "Est qualifié d’infraction de mendicité le fait de solliciter de manière active ou nuisible la générosité des passants, notamment en les abordant ou en bloquant toute ou partie de la voie publique. Le mendiant ne peut être puni pénalement que s’il a été sommé par un agent de police en uniforme de cesser sa mendicité et que, malgré cette demande, il a continué au même lieu."},
        [2] = {title = 'Vagabondage', class = 'Délit mineur', id = 'P.C. 9002', months = 2, fine = 500, color = 'yellow', description = "Est qualifié de délit mineur de vagabondage le fait pour une personne d’errer sans but légitime aux abords proches du pénitencier. Le vagabond ne peut être puni pénalement que s’il a été sommé, par un agent de police en uniforme, de cesser son vagabondage et que, malgré cette demande, il a continué ou réitéré la commission de son infraction."},
        [3] = {title = 'Grabuge', class = 'Délit mineur', id = 'P.C. 9003', months = 1, fine = 500, color = 'yellow', description = "Est qualifié de délit mineur de grabuge le fait de causer malicieusement, intentionnellement ou par grave négligence, seul, un trouble à l’ordre public notamment en entravant la circulation sur la voie publique, ou en nuisant gravement à la tranquillité par l’émission de forts bruits ou cris, ou la gêne d’un groupe de personne légalement constitué.L’auteur du grabuge ne peut être puni pénalement que s’il a été sommé, par un agent de police en uniforme, de cesser son grabuge et que, malgré cette demande, il a continué ou réitéré la commission de son infraction."},
        [4] = {title = 'Flânerie', class = 'Délit mineur', id = 'P.C. 9004', months = 3, fine = 800, color = 'yellow', description = "Est qualifié de délit mineur de flânerie le fait de rester en groupe et de manière prolongée sur un lieu public dans des circonstances qui donnent des motifs raisonnables de croire que le but ou l’effet de ce comportement est de permettre à un gang de rue de devenir maître du secteur, de cacher des activités illégales ou d’empêcher autrui, par voie d’intimidation, de circuler librement est un délit de flânerie. Les flâneurs ne peuvent être punis pénalement que s’ils ont été sommés, par un agent de police en uniforme, de cesser leur flânerie et que, malgré cette demande, ils ont continué ou réitéré la commission de leur infraction sur le même lieu."},
        [5] = {title = 'Course illégale', class = 'Délit mineur', id = 'P.C. 9005', months = 5, fine = 4000, color = 'yellow', description = "Est qualifié de délit mineur de course illégale le fait, sur la voie publique, d’organiser ou de participer à une course automobile impliquant logiquement la violation du code de la route."},
        [6] = {title = 'Ivresse sur la voie publique', class = 'Infraction pénale', id = 'P.C. 9006', months = 0, fine = 800, color = 'green', description = "Est qualifiée d’infraction d’ivresse publique le fait d’errer ou de stationner sur la voie publique soit en état d’ivresse manifeste, soit en tenant ostensiblement un emballage d’alcool. - Placement au dégrisement"},
        [7] = {title = 'Atteinte à la pudeur', class = 'Infraction pénale', id = 'P.C. 9007', months = 0, fine = 1000, color = 'green', description = "Est qualifiée d’infraction d’atteinte à la pudeur le fait d’imposer à autrui la vue d’une nudité, d’un acte sexuel, ou d’une quelconque image attenant ostensiblement aux bonnes mœurs"},
        [8] = {title = 'Racolage agressif', class = 'Délit mineur', id = 'P.C. 9008', months = 1, fine = 2000, color = 'yellow', description = "Est qualifié de délit mineur de racolage agressif le fait de proposer ostensiblement et avec insistance, par la parole, sur la voie publique, une prestation sexuelle tarifée, malgré l’indifférence ou le refus des passants."},
        [9] = {title = 'Corruption des moeurs', class = 'Délit mineur', id = 'P.C. 9009', months = 6, fine = 5000, color = 'yellow', description = "Est qualifié de délit mineur de corruption des moeurs le fait de diffuser toute image ou bande sonore représentant des actes sexuels, ou des parties fortement sexuées du corps humain dans leur nudité en direction de mineurs ou de faibles d’esprit."},
        [10] = {title = 'Proxénétisme', class = 'Délit majeur', id = 'P.C. 9010', months = 36, fine = 10000, color = 'orange', description = "Est qualifié de délit majeur de proxénétisme le fait de tirer un profit, pécunier ou non, de la prostitution d’autrui."},
        [11] = {title = 'Proxénétisme aggravé', class = 'Crime', id = 'P.C. 9011', months = 36, fine = 25000, color = 'red', description = "Conditions : Mineur, Exercice de violences physiques, Séquestration ou menaces"},
    },
    [10] = {
        [1] = {title = 'Trafic de stupéfiants', class = 'Délit mineur', id = 'P.C. 10001', months = 24, fine = 2000, color = 'yellow', description = "Est qualifié de délit mineur de trafic de stupéfiant le fait malicieusement, de distribuer ou vendre des stupéfiants, pour un médecin, de fournir une ordonnance pour une raison autre que la seule nécessité médicale, de produire des stupéfiants, ou bien de posséder les éléments ou produits spécifiquement déterminés à leur production (notamment des graines pour des pousses de cannabis), l’acquéreur ou le demandeur des stupéfiants est, dans les cas prévu au A. et au même titre que le cessionnaire, coupable du délit de trafic de stupéfiants."},
        [2] = {title = 'Trafic de stupéfiants aggravé', class = 'Délit majeur', id = 'P.C. 10002', months = 120, fine = 3500, color = 'orange', description = "Quand le trafic concerne une quantité de substance illicite supérieure ou égale à 15 grammes, il est dit 'aggravé'. Il est également aggravé si l’acquéreur des stupéfiants est un mineur ou si la délivrance d’une ordonnance malhonnête est liée au trafic."},
        [3] = {title = 'Intention de vendre des stupéfiants', id = 'P.C. 10003', months = 12, fine = 1500, color = 'yellow', description = "Est qualifié de délit mineur le fait de stationner ou d’errer sur la voie publique ou dans un lieu ouvert au public, et par son attitude, ses actes, ses paroles ou son comportement, de laisser malicieusement croire à son désir d’entreprendre un trafic de stupéfiants. Sont notamment caractéristiques de ce délit: le stationnement à un angle de rue fréquenté en vue d’appeler par la voix ou par les gestes les véhicules afin de leur proposer cette vente."},
        [4] = {title = 'Possession de stupéfiants', class = 'Délit mineur', id = 'P.C. 10004', months = 16, fine = 2000, color = 'yellow', description = "Est qualifié délit mineur de possession de stupéfiant le fait, sans droit, de posséder sur soi, dans son véhicule, dans sa propriété (immobilière ou non) ou à quelque autre endroit, même sans titre de propriété, des stupéfiants de quelque nature que ce soit. Le délit est également constitué lorsque la personne a, volontairement et sans droit, consommer des stupéfiants."},
        [5] = {title = 'Possession de stupéfiants aggravée', class = 'Délit majeur', id = 'P.C. 10005', months = 24, fine = 3050, color = 'green', description = "Le fait de détenir des stupéfiants dans les circonstances prévues dans l’Article II de la présente section concernant le trafic de stupéfiants transforme cet acte en possession de stupéfiants “aggravée”."},
        [6] = {title = 'Trafic d’armes', class = 'Délit majeur', id = 'P.C. 10006', months = 240, fine = 10000, color = 'orange', description = "Le fait de vendre une arme sous contrôle sans posséder la licence de vente d’armes est un délit de trafic d’armes. Le fait de distribuer publiquement une arme sous contrôle sans posséder cette licence est également un trafic d’armes. Le fait de distribuer ou de vendre une arme sous contrôle sans vérifier que l’acquéreur ne possède le permis de port d’armes est également un délit majeur de trafic d’armes. Le fait de distribuer ou de vendre une arme interdite est également un délit de trafic d’armes"},
        [7] = {title = 'Trafic d’armes aggravé', class = 'Crime', id = 'P.C. 10007', months = 300, fine = 20000, color = 'red', description = "Conditions : Acheteur mineur, Achat dans le but de commettre un acte illégal, Plus de 5 armes, Armes explosives ou incendiaires."},
        [8] = {title = 'Intention de vendre des armes', class = 'Délit majeur', id = 'P.C. 10008', months = 48, fine = 5500, color = 'orange', description = "Est qualifié de délit majeur d’intention de vendre des armes le fait de stationner ou d’errer sur la voie publique ou dans un lieu ouvert au public, et par son attitude, ses actes, ses paroles ou son comportement, de laisser malicieusement croire à son désir d’entreprendre un trafic d’armes. Sont notamment caractéristiques de ce délit: le stationnement à un angle de rue fréquenté en vue d’appeler par la voix ou par les gestes les véhicules afin de leur proposer cette vente."},
        [9] = {title = 'Possession illégale d’armes', class = 'Délit majeur', id = 'P.C. 10009', months = 18, fine = 7500, color = 'orange', description = "Est qualifié de délit majeur de possession d’armes illégale le fait de posséder sur soi, à son domicile, dans son véhicule, dans une de ses propriétés ou à quelqu’autre endroit: Une arme interdite, une arme contrôlé sans permis, Des pièces détâchées d’armes sans permis."},
        [10] = {title = 'Possession illégale d’armes', class = 'Délit majeur', id = 'P.C. 10010', months = 36, fine = 12500, color = 'orange', description = "Conditions : Plus de 5 armes à feu, armes explosives ou incendiaires"},
        [11] = {title = 'Exhibition d’arme', class = 'Délit mineur', id = 'P.C. 10011', months = 12, fine = 2000, color = 'yellow', description = "Est qualifié de délit mineur d’exhibition d’armes le fait pour toute personne de détenir légalement une arme mais, sans motif légitime, de l’arborer visiblement, de la brandir ou de l’exhiber, sur la voie publique ou dans un lieu ouvert au public."},
    }
}

Config.AllowedJobs = {}
for index, value in pairs(Config.PoliceJobs) do
    Config.AllowedJobs[index] = value
end
for index, value in pairs(Config.AmbulanceJobs) do
    Config.AllowedJobs[index] = value
end
for index, value in pairs(Config.DojJobs) do
    Config.AllowedJobs[index] = value
end

Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = { label = 'Pacific Bank CAM#1', coords = vector3(257.45, 210.07, 109.08), r = { x = -25.0, y = 0.0, z = 28.05 }, canRotate = false, isOnline = true },
        [2] = { label = 'Pacific Bank CAM#2', coords = vector3(232.86, 221.46, 107.83), r = { x = -25.0, y = 0.0, z = -140.91 }, canRotate = false, isOnline = true },
        [3] = { label = 'Pacific Bank CAM#3', coords = vector3(252.27, 225.52, 103.99), r = { x = -35.0, y = 0.0, z = -74.87 }, canRotate = false, isOnline = true },
        [4] = { label = 'Limited Ltd Grove St. CAM#1', coords = vector3(-53.1433, -1746.714, 31.546), r = { x = -35.0, y = 0.0, z = -168.9182 }, canRotate = false, isOnline = true },
        [5] = { label = "Rob's Liqour Prosperity St. CAM#1", coords = vector3(-1482.9, -380.463, 42.363), r = { x = -35.0, y = 0.0, z = 79.53281 }, canRotate = false, isOnline = true },
        [6] = { label = "Rob's Liqour San Andreas Ave. CAM#1", coords = vector3(-1224.874, -911.094, 14.401), r = { x = -35.0, y = 0.0, z = -6.778894 }, canRotate = false, isOnline = true },
        [7] = { label = 'Limited Ltd Ginger St. CAM#1', coords = vector3(-718.153, -909.211, 21.49), r = { x = -35.0, y = 0.0, z = -137.1431 }, canRotate = false, isOnline = true },
        [8] = { label = '24/7 Supermarkt Innocence Blvd. CAM#1', coords = vector3(23.885, -1342.441, 31.672), r = { x = -35.0, y = 0.0, z = -142.9191 }, canRotate = false, isOnline = true },
        [9] = { label = "Rob's Liqour El Rancho Blvd. CAM#1", coords = vector3(1133.024, -978.712, 48.515), r = { x = -35.0, y = 0.0, z = -137.302 }, canRotate = false, isOnline = true },
        [10] = { label = 'Limited Ltd West Mirror Drive CAM#1', coords = vector3(1151.93, -320.389, 71.33), r = { x = -35.0, y = 0.0, z = -119.4468 }, canRotate = false, isOnline = true },
        [11] = { label = '24/7 Supermarkt Clinton Ave CAM#1', coords = vector3(383.402, 328.915, 105.541), r = { x = -35.0, y = 0.0, z = 118.585 }, canRotate = false, isOnline = true },
        [12] = { label = 'Limited Ltd Banham Canyon Dr CAM#1', coords = vector3(-1832.057, 789.389, 140.436), r = { x = -35.0, y = 0.0, z = -91.481 }, canRotate = false, isOnline = true },
        [13] = { label = "Rob's Liqour Great Ocean Hwy CAM#1", coords = vector3(-2966.15, 387.067, 17.393), r = { x = -35.0, y = 0.0, z = 32.92229 }, canRotate = false, isOnline = true },
        [14] = { label = '24/7 Supermarkt Ineseno Road CAM#1', coords = vector3(-3046.749, 592.491, 9.808), r = { x = -35.0, y = 0.0, z = -116.673 }, canRotate = false, isOnline = true },
        [15] = { label = '24/7 Supermarkt Barbareno Rd. CAM#1', coords = vector3(-3246.489, 1010.408, 14.705), r = { x = -35.0, y = 0.0, z = -135.2151 }, canRotate = false, isOnline = true },
        [16] = { label = '24/7 Supermarkt Route 68 CAM#1', coords = vector3(539.773, 2664.904, 44.056), r = { x = -35.0, y = 0.0, z = -42.947 }, canRotate = false, isOnline = true },
        [17] = { label = "Rob's Liqour Route 68 CAM#1", coords = vector3(1169.855, 2711.493, 40.432), r = { x = -35.0, y = 0.0, z = 127.17 }, canRotate = false, isOnline = true },
        [18] = { label = '24/7 Supermarkt Senora Fwy CAM#1', coords = vector3(2673.579, 3281.265, 57.541), r = { x = -35.0, y = 0.0, z = -80.242 }, canRotate = false, isOnline = true },
        [19] = { label = '24/7 Supermarkt Alhambra Dr. CAM#1', coords = vector3(1966.24, 3749.545, 34.143), r = { x = -35.0, y = 0.0, z = 163.065 }, canRotate = false, isOnline = true },
        [20] = { label = '24/7 Supermarkt Senora Fwy CAM#2', coords = vector3(1729.522, 6419.87, 37.262), r = { x = -35.0, y = 0.0, z = -160.089 }, canRotate = false, isOnline = true },
        [21] = { label = 'Fleeca Bank Hawick Ave CAM#1', coords = vector3(309.341, -281.439, 55.88), r = { x = -35.0, y = 0.0, z = -146.1595 }, canRotate = false, isOnline = true },
        [22] = { label = 'Fleeca Bank Legion Square CAM#1', coords = vector3(144.871, -1043.044, 31.017), r = { x = -35.0, y = 0.0, z = -143.9796 }, canRotate = false, isOnline = true },
        [23] = { label = 'Fleeca Bank Hawick Ave CAM#2', coords = vector3(-355.7643, -52.506, 50.746), r = { x = -35.0, y = 0.0, z = -143.8711 }, canRotate = false, isOnline = true },
        [24] = { label = 'Fleeca Bank Del Perro Blvd CAM#1', coords = vector3(-1214.226, -335.86, 39.515), r = { x = -35.0, y = 0.0, z = -97.862 }, canRotate = false, isOnline = true },
        [25] = { label = 'Fleeca Bank Great Ocean Hwy CAM#1', coords = vector3(-2958.885, 478.983, 17.406), r = { x = -35.0, y = 0.0, z = -34.69595 }, canRotate = false, isOnline = true },
        [26] = { label = 'Paleto Bank CAM#1', coords = vector3(-102.939, 6467.668, 33.424), r = { x = -35.0, y = 0.0, z = 24.66 }, canRotate = false, isOnline = true },
        [27] = { label = 'Del Vecchio Liquor Paleto Bay', coords = vector3(-163.75, 6323.45, 33.424), r = { x = -35.0, y = 0.0, z = 260.00 }, canRotate = false, isOnline = true },
        [28] = { label = "Don's Country Store Paleto Bay CAM#1", coords = vector3(166.42, 6634.4, 33.69), r = { x = -35.0, y = 0.0, z = 32.00 }, canRotate = false, isOnline = true },
        [29] = { label = "Don's Country Store Paleto Bay CAM#2", coords = vector3(163.74, 6644.34, 33.69), r = { x = -35.0, y = 0.0, z = 168.00 }, canRotate = false, isOnline = true },
        [30] = { label = "Don's Country Store Paleto Bay CAM#3", coords = vector3(169.54, 6640.89, 33.69), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = false, isOnline = true },
        [31] = { label = 'Vangelico Jewelery CAM#1', coords = vector3(-627.54, -239.74, 40.33), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = true, isOnline = true },
        [32] = { label = 'Vangelico Jewelery CAM#2', coords = vector3(-627.51, -229.51, 40.24), r = { x = -35.0, y = 0.0, z = -95.78 }, canRotate = true, isOnline = true },
        [33] = { label = 'Vangelico Jewelery CAM#3', coords = vector3(-620.3, -224.31, 40.23), r = { x = -35.0, y = 0.0, z = 165.78 }, canRotate = true, isOnline = true },
        [34] = { label = 'Vangelico Jewelery CAM#4', coords = vector3(-622.57, -236.3, 40.31), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = true, isOnline = true },
    },
}

Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = { label = 'Pacific Bank CAM#1', coords = vector3(257.45, 210.07, 109.08), r = { x = -25.0, y = 0.0, z = 28.05 }, canRotate = false, isOnline = true },
        [2] = { label = 'Pacific Bank CAM#2', coords = vector3(232.86, 221.46, 107.83), r = { x = -25.0, y = 0.0, z = -140.91 }, canRotate = false, isOnline = true },
        [3] = { label = 'Pacific Bank CAM#3', coords = vector3(252.27, 225.52, 103.99), r = { x = -35.0, y = 0.0, z = -74.87 }, canRotate = false, isOnline = true },
        [4] = { label = 'Limited Ltd Grove St. CAM#1', coords = vector3(-53.1433, -1746.714, 31.546), r = { x = -35.0, y = 0.0, z = -168.9182 }, canRotate = false, isOnline = true },
        [5] = { label = "Rob's Liqour Prosperity St. CAM#1", coords = vector3(-1482.9, -380.463, 42.363), r = { x = -35.0, y = 0.0, z = 79.53281 }, canRotate = false, isOnline = true },
        [6] = { label = "Rob's Liqour San Andreas Ave. CAM#1", coords = vector3(-1224.874, -911.094, 14.401), r = { x = -35.0, y = 0.0, z = -6.778894 }, canRotate = false, isOnline = true },
        [7] = { label = 'Limited Ltd Ginger St. CAM#1', coords = vector3(-718.153, -909.211, 21.49), r = { x = -35.0, y = 0.0, z = -137.1431 }, canRotate = false, isOnline = true },
        [8] = { label = '24/7 Supermarkt Innocence Blvd. CAM#1', coords = vector3(23.885, -1342.441, 31.672), r = { x = -35.0, y = 0.0, z = -142.9191 }, canRotate = false, isOnline = true },
        [9] = { label = "Rob's Liqour El Rancho Blvd. CAM#1", coords = vector3(1133.024, -978.712, 48.515), r = { x = -35.0, y = 0.0, z = -137.302 }, canRotate = false, isOnline = true },
        [10] = { label = 'Limited Ltd West Mirror Drive CAM#1', coords = vector3(1151.93, -320.389, 71.33), r = { x = -35.0, y = 0.0, z = -119.4468 }, canRotate = false, isOnline = true },
        [11] = { label = '24/7 Supermarkt Clinton Ave CAM#1', coords = vector3(383.402, 328.915, 105.541), r = { x = -35.0, y = 0.0, z = 118.585 }, canRotate = false, isOnline = true },
        [12] = { label = 'Limited Ltd Banham Canyon Dr CAM#1', coords = vector3(-1832.057, 789.389, 140.436), r = { x = -35.0, y = 0.0, z = -91.481 }, canRotate = false, isOnline = true },
        [13] = { label = "Rob's Liqour Great Ocean Hwy CAM#1", coords = vector3(-2966.15, 387.067, 17.393), r = { x = -35.0, y = 0.0, z = 32.92229 }, canRotate = false, isOnline = true },
        [14] = { label = '24/7 Supermarkt Ineseno Road CAM#1', coords = vector3(-3046.749, 592.491, 9.808), r = { x = -35.0, y = 0.0, z = -116.673 }, canRotate = false, isOnline = true },
        [15] = { label = '24/7 Supermarkt Barbareno Rd. CAM#1', coords = vector3(-3246.489, 1010.408, 14.705), r = { x = -35.0, y = 0.0, z = -135.2151 }, canRotate = false, isOnline = true },
        [16] = { label = '24/7 Supermarkt Route 68 CAM#1', coords = vector3(539.773, 2664.904, 44.056), r = { x = -35.0, y = 0.0, z = -42.947 }, canRotate = false, isOnline = true },
        [17] = { label = "Rob's Liqour Route 68 CAM#1", coords = vector3(1169.855, 2711.493, 40.432), r = { x = -35.0, y = 0.0, z = 127.17 }, canRotate = false, isOnline = true },
        [18] = { label = '24/7 Supermarkt Senora Fwy CAM#1', coords = vector3(2673.579, 3281.265, 57.541), r = { x = -35.0, y = 0.0, z = -80.242 }, canRotate = false, isOnline = true },
        [19] = { label = '24/7 Supermarkt Alhambra Dr. CAM#1', coords = vector3(1966.24, 3749.545, 34.143), r = { x = -35.0, y = 0.0, z = 163.065 }, canRotate = false, isOnline = true },
        [20] = { label = '24/7 Supermarkt Senora Fwy CAM#2', coords = vector3(1729.522, 6419.87, 37.262), r = { x = -35.0, y = 0.0, z = -160.089 }, canRotate = false, isOnline = true },
        [21] = { label = 'Fleeca Bank Hawick Ave CAM#1', coords = vector3(309.341, -281.439, 55.88), r = { x = -35.0, y = 0.0, z = -146.1595 }, canRotate = false, isOnline = true },
        [22] = { label = 'Fleeca Bank Legion Square CAM#1', coords = vector3(144.871, -1043.044, 31.017), r = { x = -35.0, y = 0.0, z = -143.9796 }, canRotate = false, isOnline = true },
        [23] = { label = 'Fleeca Bank Hawick Ave CAM#2', coords = vector3(-355.7643, -52.506, 50.746), r = { x = -35.0, y = 0.0, z = -143.8711 }, canRotate = false, isOnline = true },
        [24] = { label = 'Fleeca Bank Del Perro Blvd CAM#1', coords = vector3(-1214.226, -335.86, 39.515), r = { x = -35.0, y = 0.0, z = -97.862 }, canRotate = false, isOnline = true },
        [25] = { label = 'Fleeca Bank Great Ocean Hwy CAM#1', coords = vector3(-2958.885, 478.983, 17.406), r = { x = -35.0, y = 0.0, z = -34.69595 }, canRotate = false, isOnline = true },
        [26] = { label = 'Paleto Bank CAM#1', coords = vector3(-102.939, 6467.668, 33.424), r = { x = -35.0, y = 0.0, z = 24.66 }, canRotate = false, isOnline = true },
        [27] = { label = 'Del Vecchio Liquor Paleto Bay', coords = vector3(-163.75, 6323.45, 33.424), r = { x = -35.0, y = 0.0, z = 260.00 }, canRotate = false, isOnline = true },
        [28] = { label = "Don's Country Store Paleto Bay CAM#1", coords = vector3(166.42, 6634.4, 33.69), r = { x = -35.0, y = 0.0, z = 32.00 }, canRotate = false, isOnline = true },
        [29] = { label = "Don's Country Store Paleto Bay CAM#2", coords = vector3(163.74, 6644.34, 33.69), r = { x = -35.0, y = 0.0, z = 168.00 }, canRotate = false, isOnline = true },
        [30] = { label = "Don's Country Store Paleto Bay CAM#3", coords = vector3(169.54, 6640.89, 33.69), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = false, isOnline = true },
        [31] = { label = 'Vangelico Jewelery CAM#1', coords = vector3(-627.54, -239.74, 40.33), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = true, isOnline = true },
        [32] = { label = 'Vangelico Jewelery CAM#2', coords = vector3(-627.51, -229.51, 40.24), r = { x = -35.0, y = 0.0, z = -95.78 }, canRotate = true, isOnline = true },
        [33] = { label = 'Vangelico Jewelery CAM#3', coords = vector3(-620.3, -224.31, 40.23), r = { x = -35.0, y = 0.0, z = 165.78 }, canRotate = true, isOnline = true },
        [34] = { label = 'Vangelico Jewelery CAM#4', coords = vector3(-622.57, -236.3, 40.31), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = true, isOnline = true },
    },
}

Config.ColorNames = {
    [0] = "Noir Métallisé",
    [1] = "Noir Graphite Métallisé",
    [2] = "Noir Acier Métallisé",
    [3] = "Gris Foncé Métallisé",
    [4] = "Argent Métallisé",
    [5] = "Bleu Argent Métallisé",
    [6] = "Gris Acier Métallisé",
    [7] = "Gris Argent Métallisé",
    [8] = "Gris Pierre Métallisé",
    [9] = "Gris Minuit Métallisé",
    [10] = "Gris Métal",
    [11] = "Gris Anthracite Mat",
    [12] = "Noir Mat",
    [13] = "Gris Mat",
    [14] = "Gris Clair Mat",
    [15] = "Noir Utilitaire",
    [16] = "Poly Noir Utilitaire",
    [17] = "Gris Foncé Utilitaire",
    [18] = "Argent Utilitaire",
    [19] = "Gris Métal Utilitaire",
    [20] = "Gris Argent Utilitaire",
    [21] = "Noir Usé",
    [22] = "Graphite Usé",
    [23] = "Gris Argent Usé",
    [24] = "Argent Usé",
    [25] = "Bleu Argent Usé",
    [26] = "Gris Argent Usé",
    [27] = "Rouge Métallisé",
    [28] = "Rouge Torino Métallisé",
    [29] = "Rouge Formule Métallisé",
    [30] = "Rouge Blaze Métallisé",
    [31] = "Rouge Gracieux Métallisé",
    [32] = "Rouge Grenat Métallisé",
    [33] = "Rouge Désert Métallisé",
    [34] = "Rouge Cabernet Métallisé",
    [35] = "Rouge Bonbon Métallisé",
    [36] = "Orange Lever de Soleil Métallisé",
    [37] = "Or Classique Métallisé",
    [38] = "Orange Métallisé",
    [39] = "Rouge Mat",
    [40] = "Rouge Foncé Mat",
    [41] = "Orange Mat",
    [42] = "Jaune Mat",
    [43] = "Rouge Utilitaire",
    [44] = "Rouge Vif Utilitaire",
    [45] = "Rouge Grenat Utilitaire",
    [46] = "Rouge Usé",
    [47] = "Rouge Doré Usé",
    [48] = "Rouge Foncé Usé",
    [49] = "Vert Foncé Métallisé",
    [50] = "Vert Course Métallisé",
    [51] = "Vert Marin Métallisé",
    [52] = "Vert Olive Métallisé",
    [53] = "Vert Métallisé",
    [54] = "Bleu Vert Essence Métallisé",
    [55] = "Vert Citron Mat",
    [56] = "Vert Foncé Utilitaire",
    [57] = "Vert Utilitaire",
    [58] = "Vert Foncé Usé",
    [59] = "Vert Usé",
    [60] = "Usé Lavage Marin",
    [61] = "Bleu Nuit Métallisé",
    [62] = "Bleu Foncé Métallisé",
    [63] = "Bleu Saxony Métallisé",
    [64] = "Bleu Métallisé",
    [65] = "Bleu Marin Métallisé",
    [66] = "Bleu Port Métallisé",
    [67] = "Bleu Diamant Métallisé",
    [68] = "Bleu Surf Métallisé",
    [69] = "Bleu Nautique Métallisé",
    [70] = "Bleu Brillant Métallisé",
    [71] = "Bleu Violet Métallisé",
    [72] = "Bleu Spinnaker Métallisé",
    [73] = "Bleu Ultra Métallisé",
    [74] = "Bleu Brillant Métallisé",
    [75] = "Bleu Foncé Utilitaire",
    [76] = "Bleu Nuit Utilitaire",
    [77] = "Bleu Utilitaire",
    [78] = "Bleu Mer Mousse Utilitaire",
    [79] = "Bleu Éclair Utilitaire",
    [80] = "Poly Maui Bleu Utilitaire",
    [81] = "Bleu Brillant Utilitaire",
    [82] = "Bleu Foncé Mat",
    [83] = "Bleu Mat",
    [84] = "Bleu Nuit Mat",
    [85] = "Bleu Foncé Usé",
    [86] = "Bleu Usé",
    [87] = "Bleu Clair Usé",
    [88] = "Jaune Taxi Métallisé",
    [89] = "Jaune Course Métallisé",
    [90] = "Bronze Métallisé",
    [91] = "Canari Jaune Métallisé",
    [92] = "Vert Citron Métallisé",
    [93] = "Champagne Métallisé",
    [94] = "Beige Pueblo Métallisé",
    [95] = "Ivoire Foncé Métallisé",
    [96] = "Brun Chocolat Métallisé",
    [97] = "Brun Doré Métallisé",
    [98] = "Brun Clair Métallisé",
    [99] = "Beige Paille Métallisé",
    [100] = "Brun Mousse Métallisé",
    [101] = "Brun Biston Métallisé",
    [102] = "Bois de Hêtre Métallisé",
    [103] = "Bois de Hêtre Foncé Métallisé",
    [104] = "Orange Chocolat Métallisé",
    [105] = "Sable de Plage Métallisé",
    [106] = "Sable Blanchi par le Soleil Métallisé",
    [107] = "Crème Métallisé",
    [108] = "Brun Utilitaire",
    [109] = "Brun Moyen Utilitaire",
    [110] = "Brun Clair Utilitaire",
    [111] = "Blanc Métallisé",
    [112] = "Blanc Givré Métallisé",
    [113] = "Beige Miel Usé",
    [114] = "Brun Usé",
    [115] = "Brun Foncé Usé",
    [116] = "Beige Paille Usé",
    [117] = "Acier Brossé",
    [118] = "Acier Noir Brossé",
    [119] = "Aluminium Brossé",
    [120] = "Chrome",
    [121] = "Blanc Cassé Usé",
    [122] = "Blanc Utilitaire Cassé",
    [123] = "Orange Usé",
    [124] = "Orange Clair Usé",
    [125] = "Vert Sécuricor Métallisé",
    [126] = "Jaune Taxi Usé",
    [127] = "Bleu de Voiture de Police",
    [128] = "Vert Mat",
    [129] = "Brun Mat",
    [130] = "Orange Usé",
    [131] = "Blanc Mat",
    [132] = "Blanc Usé",
    [133] = "Vert Armée Olive Usé",
    [134] = "Blanc Pur",
    [135] = "Rose Vif",
    [136] = "Rose Saumon",
    [137] = "Rose Vermillon Métallisé",
    [138] = "Orange",
    [139] = "Vert",
    [140] = "Bleu",
    [141] = "Noir Bleu Métallisé",
    [142] = "Noir Violet Métallisé",
    [143] = "Noir Rouge Métallisé",
    [144] = "Vert Chasseur",
    [145] = "Violet Métallisé",
    [146] = "Bleu Foncé Métallisé",
    [147] = "MODSHOP NOIR1",
    [148] = "Violet Mat",
    [149] = "Violet Foncé Mat",
    [150] = "Rouge Lave Métallisé",
    [151] = "Vert Forêt Mat",
    [152] = "Olive Mat",
    [153] = "Brun Désert Mat",
    [154] = "Brun Désert Tan Mat",
    [155] = "Vert Feuillage Mat",
    [156] = "COULEUR DE JANTE PAR DÉFAUT",
    [157] = "Bleu Epsilon",
    [158] = "Inconnu",
    [999] = "Couleur Custom",
}

Config.ColorInformation = {
    [0] = "black",
    [1] = "black",
    [2] = "black",
    [3] = "darksilver",
    [4] = "silver",
    [5] = "bluesilver",
    [6] = "silver",
    [7] = "darksilver",
    [8] = "silver",
    [9] = "bluesilver",
    [10] = "darksilver",
    [11] = "darksilver",
    [12] = "matteblack",
    [13] = "gray",
    [14] = "lightgray",
    [15] = "black",
    [16] = "black",
    [17] = "darksilver",
    [18] = "silver",
    [19] = "utilgunmetal",
    [20] = "silver",
    [21] = "black",
    [22] = "black",
    [23] = "darksilver",
    [24] = "silver",
    [25] = "bluesilver",
    [26] = "darksilver",
    [27] = "red",
    [28] = "torinored",
    [29] = "formulared",
    [30] = "blazered",
    [31] = "gracefulred",
    [32] = "garnetred",
    [33] = "desertred",
    [34] = "cabernetred",
    [35] = "candyred",
    [36] = "orange",
    [37] = "gold",
    [38] = "orange",
    [39] = "red",
    [40] = "mattedarkred",
    [41] = "orange",
    [42] = "matteyellow",
    [43] = "red",
    [44] = "brightred",
    [45] = "garnetred",
    [46] = "red",
    [47] = "red",
    [48] = "darkred",
    [49] = "darkgreen",
    [50] = "racingreen",
    [51] = "seagreen",
    [52] = "olivegreen",
    [53] = "green",
    [54] = "gasolinebluegreen",
    [55] = "mattelimegreen",
    [56] = "darkgreen",
    [57] = "green",
    [58] = "darkgreen",
    [59] = "green",
    [60] = "seawash",
    [61] = "midnightblue",
    [62] = "darkblue",
    [63] = "saxonyblue",
    [64] = "blue",
    [65] = "blue",
    [66] = "blue",
    [67] = "diamondblue",
    [68] = "blue",
    [69] = "blue",
    [70] = "brightblue",
    [71] = "purpleblue",
    [72] = "blue",
    [73] = "ultrablue",
    [74] = "brightblue",
    [75] = "darkblue",
    [76] = "midnightblue",
    [77] = "blue",
    [78] = "blue",
    [79] = "lightningblue",
    [80] = "blue",
    [81] = "brightblue",
    [82] = "mattedarkblue",
    [83] = "matteblue",
    [84] = "matteblue",
    [85] = "darkblue",
    [86] = "blue",
    [87] = "lightningblue",
    [88] = "yellow",
    [89] = "yellow",
    [90] = "bronze",
    [91] = "yellow",
    [92] = "lime",
    [93] = "champagne",
    [94] = "beige",
    [95] = "darkivory",
    [96] = "brown",
    [97] = "brown",
    [98] = "lightbrown",
    [99] = "beige",
    [100] = "brown",
    [101] = "brown",
    [102] = "beechwood",
    [103] = "beechwood",
    [104] = "chocoorange",
    [105] = "yellow",
    [106] = "yellow",
    [107] = "cream",
    [108] = "brown",
    [109] = "brown",
    [110] = "brown",
    [111] = "white",
    [112] = "white",
    [113] = "beige",
    [114] = "brown",
    [115] = "brown",
    [116] = "beige",
    [117] = "steel", 
    [118] = "blacksteel",
    [119] = "aluminium",
    [120] = "chrome",
    [121] = "wornwhite",
    [122] = "offwhite",
    [123] = "orange",
    [124] = "lightorange",
    [125] = "green",
    [126] = "yellow",
    [127] = "blue",
    [128] = "green",
    [129] = "brown",
    [130] = "orange",
    [131] = "white",
    [132] = "white",
    [133] = "darkgreen",
    [134] = "white",
    [135] = "pink",
    [136] = "pink",
    [137] = "pink",
    [138] = "orange",
    [139] = "green",
    [140] = "blue",
    [141] = "blackblue",
    [142] = "blackpurple",
    [143] = "blackred",
    [144] = "darkgreen",
    [145] = "purple",
    [146] = "darkblue",
    [147] = "black",
    [148] = "purple",
    [149] = "darkpurple",
    [150] = "red",
    [151] = "darkgreen",
    [152] = "olivedrab",
    [153] = "brown",
    [154] = "tan",
    [155] = "green",
    [156] = "silver",
    [157] = "blue",
    [158] = "black",
}

Config.ClassList = {
    [0] = "Compact",
    [1] = "Sedan",
    [2] = "SUV",
    [3] = "Coupe",
    [4] = "Muscle",
    [5] = "Sport Classic",
    [6] = "Sport",
    [7] = "Super",
    [8] = "Moto",
    [9] = "Off-Road",
    [10] = "Industriels",
    [11] = "Utilitaire",
    [12] = "Van",
    [13] = "Vélo",
    [14] = "Bateau",
    [15] = "Helicoptère",
    [16] = "Avion",
    [17] = "Services",
    [18] = "Urgence",
    [19] = "Militaire",
    [20] = "Commercial",
    [21] = "Train"
}

Config.WeaponClasses = {
    ['LIGHT_IMPACT'] = "Classe 0",
    ['HEAVY_IMPACT'] = "Classe 1",
    ['SMALL_CALIBER'] = "Classe 2",
    ['MEDIUM_CALIBER'] = "Classe 3",
    ['HIGH_CALIBER'] = "Classe 4",
    ['SHOTGUN'] = "Classe 5",
    ['CUTTING'] = "Classe 6",   
    ['FIRE'] = "Classe 8",
    ['SUFFOCATING'] = "Classe 9",
    ['OTHER'] = "Classe 10",
    ['EXPLOSIVE'] = "Classe 99",
    ['NOTHING'] = "Classe X",
}

Config.WeaponClass = {
    --[[ Small Caliber ]]--
    ['WEAPON_PISTOL'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_COMBATPISTOL'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_APPISTOL'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_COMBATPDW'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_MACHINEPISTOL'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_MICROSMG'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_MINISMG'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_PISTOL_MK2'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_SNSPISTOL'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_SNSPISTOL_MK2'] = Config.WeaponClasses['SMALL_CALIBER'],
    ['WEAPON_VINTAGEPISTOL'] = Config.WeaponClasses['SMALL_CALIBER'],

    --[[ Medium Caliber ]]--
    ['WEAPON_ADVANCEDRIFLE'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_ASSAULTSMG'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_BULLPUPRIFLE'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_BULLPUPRIFLE_MK2'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_CARBINERIFLE'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_CARBINERIFLE_MK2'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_COMPACTRIFLE'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_DOUBLEACTION'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_GUSENBERG'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_HEAVYPISTOL'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_MARKSMANPISTOL'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_PISTOL50'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_REVOLVER'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_REVOLVER_MK2'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_SMG'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_SMG_MK2'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_SPECIALCARBINE'] = Config.WeaponClasses['MEDIUM_CALIBER'],
    ['WEAPON_SPECIALCARBINE_MK2'] = Config.WeaponClasses['MEDIUM_CALIBER'],

    --[[ High Caliber ]]--
    ['WEAPON_ASSAULTRIFLE'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_ASSAULTRIFLE_MK2'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_COMBATMG'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_COMBATMG_MK2'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_HEAVYSNIPER'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_HEAVYSNIPER_MK2'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_MARKSMANRIFLE'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_MARKSMANRIFLE_MK2'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_MG'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_MINIGUN'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_MUSKET'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_RAILGUN'] = Config.WeaponClasses['HIGH_CALIBER'],
    ['WEAPON_HEAVYRIFLE'] = Config.WeaponClasses['HIGH_CALIBER'],

    --[[ Shotguns ]]--
    ['WEAPON_ASSAULTSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_BULLUPSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_DBSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_HEAVYSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_PUMPSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_PUMPSHOTGUN_MK2'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_SAWNOFFSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    ['WEAPON_SWEEPERSHOTGUN'] = Config.WeaponClasses['SHOTGUN'],
    
    --[[ Cutting Weapons ]]--
    ['WEAPON_BATTLEAXE'] = Config.WeaponClasses['CUTTING'],
    ['WEAPON_BOTTLE'] = Config.WeaponClasses['CUTTING'],
    ['WEAPON_DAGGER'] = Config.WeaponClasses['CUTTING'],
    ['WEAPON_HATCHET'] = Config.WeaponClasses['CUTTING'],
    ['WEAPON_KNIFE'] = Config.WeaponClasses['CUTTING'],
    ['WEAPON_MACHETE'] = Config.WeaponClasses['CUTTING'],
    ['WEAPON_SWITCHBLADE'] = Config.WeaponClasses['CUTTING'],

    --[[ Light Impact ]]--
    ['WEAPON_STUNGUN'] = Config.WeaponClasses['LIGHT_IMPACT'],
    ['WEAPON_GARBAGEBAG'] = Config.WeaponClasses['LIGHT_IMPACT'], -- Garbage Bag
    ['WEAPON_BRIEFCASE'] = Config.WeaponClasses['LIGHT_IMPACT'], -- Briefcase
    ['WEAPON_BRIEFCASE_02'] = Config.WeaponClasses['LIGHT_IMPACT'], -- Briefcase 2
    ['WEAPON_BALL'] = Config.WeaponClasses['LIGHT_IMPACT'],
    ['WEAPON_FLASHLIGHT'] = Config.WeaponClasses['LIGHT_IMPACT'],
    ['WEAPON_KNUCKLE'] = Config.WeaponClasses['LIGHT_IMPACT'],
    ['WEAPON_NIGHTSTICK'] = Config.WeaponClasses['LIGHT_IMPACT'],
    ['WEAPON_SNOWBALL'] = Config.WeaponClasses['LIGHT_IMPACT'],
    ['WEAPON_UNARMED'] = Config.WeaponClasses['LIGHT_IMPACT'],
    
    --[[ Heavy Impact ]]--
    ['WEAPON_BAT'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_CROWBAR'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_FIREEXTINGUISHER'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_FIRWORK'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_GOLFLCUB'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_HAMMER'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_PETROLCAN'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_POOLCUE'] = Config.WeaponClasses['HEAVY_IMPACT'],
    ['WEAPON_WRENCH'] = Config.WeaponClasses['HEAVY_IMPACT'],
    
    --[[ Explosives ]]--
    ['WEAPON_EXPLOSION'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_GRENADE'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_COMPACTLAUNCHER'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_HOMINGLAUNCHER'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_PIPEBOMB'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_PROXMINE'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_RPG'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_STICKYBOMB'] = Config.WeaponClasses['EXPLOSIVE'],
    ['WEAPON_EMPLAUNCHER'] = Config.WeaponClasses['EXPLOSIVE'],
    
    --[[ Fire ]]--
    ['WEAPON_ELECTRIC_FENCE'] = Config.WeaponClasses['FIRE'], -- Electric Fence 
    ['WEAPON_FIRE'] = Config.WeaponClasses['FIRE'], -- Fire
    ['WEAPON_MOLOTOV'] = Config.WeaponClasses['FIRE'],
    ['WEAPON_FLARE'] = Config.WeaponClasses['FIRE'],
    ['WEAPON_FLAREGUN'] = Config.WeaponClasses['FIRE'],

    --[[ Suffocate ]]--
    ['WEAPON_BZGAS'] = Config.WeaponClasses['SUFFOCATING'],
    ['WEAPON_SMOKEGRENADE'] = Config.WeaponClasses['SUFFOCATING'],
}

function GetJobType(job)
	if Config.PoliceJobs[job] then
		return 'police'
	elseif Config.AmbulanceJobs[job] then
		return 'ambulance'
	elseif Config.DojJobs[job] then
		return 'doj'
	else
		return nil
	end
end

function IsJobAllowedToMDT(job)
	if Config.PoliceJobs[job] then
		return true
	elseif Config.AmbulanceJobs[job] then
		return true
	elseif Config.DojJobs[job] then
		return true
	else
		return false
	end
end
