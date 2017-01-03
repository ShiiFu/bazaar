#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.6.1
	Author:         ShiiFu

	Script Function: Automatic phishing in Aura Kingdom game
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

HotKeySet("{ESC}", "quitter")

HotKeySet("{F1}", "init1")
HotKeySet("{F2}", "init2")
HotKeySet("{F3}", "init3")

Opt("MouseClickDelay", 50) ;10 milliseconds
Opt("MouseClickDownDelay", 50)
Global $posPoisson

$i = 1
$j = 0
$appat = InputBox("Appat", "Combien avez vous d'appat d'équipé ?")

Global $quitter = False
Global $posDroiteStart
$ok = 0
$ok2 = 0
$colorPoisson = 14583095
$posMouseClick = MouseGetPos()
TrayTip("Info", "Placé la souris sur la lieu de pêche (rond) et appuyé sur F1.", 1)


While Not $quitter

	If $ok2 == 1 Then
;~ 			TrayTip("Info", "Vérification en cours...", 1)
			$coord = PixelSearch($posDroiteStart[0], $posDroiteStart[1]-2, $posDroiteStart[0] + 350, $posDroiteStart[1]+2, 14583095, 10, 2)
			If @error = 1 Then
				$j = $j + 1
				Sleep(75)
				If $j == 3 Then
					$i = $i + 1
					TrayTip("Info", "Poisson attrapé ! C'est le numéro " & $i & @CRLF & "Poisson restant : " & $appat - $i, 1)
					If $i = $appat Then
						If MsgBox(1, "Info", "Vous n'avez plus d'appat d'équipé, veuillez en rajouter ou appuyez sur annulé.") == 2 Then
							Exit
						Else
							$i = 0
							$appat = InputBox("Appat", "Combien aez vous d'appat d'équipé ?")
							TrayTip("Info", "Reprise de la pêche automatique.", 1)
						EndIf
					EndIf
					Sleep(Random(6500, 7500))
					$ok2 = 0
					$j = 0
				EndIf
			ElseIf $coord[0] > $posPoisson[0] Then
				MouseDown("left")
				$j = 0
				;TrayTip("Info", "MouseDown", 1)
				Sleep(80)
			Else
				MouseUp("left")
				$j = 0
				;TrayTip("Info", "MouseUp", 1)
				Sleep(80)
			EndIf
	Else
		If $ok == 1 Then
			launch()
			initPosition()
			$ok2 = 1
		EndIf
	EndIf

WEnd

;fin du prog
TrayTip("", "Programme arreter", 5)
Sleep(2000)


Func quitter()
		$quitter = True
	EndFunc

Func init1()
		$posMouseClick = MouseGetPos()
		MouseMove($posMouseClick[0], $posMouseClick[1])
		MouseDown("left")
		Sleep(Random(12, 77))
		MouseUp("left")
		TrayTip("Info", "Placé la souris sur le début de la droite de pêche et appuyé sur F2.", 1)
		Sleep(Random(5955, 6955))
		MouseMove($posMouseClick[0], $posMouseClick[1])
		MouseDown("left")
		Sleep(Random(12, 77))
		MouseUp("left")
	EndFunc

Func init2()
		$posDroiteStart = MouseGetPos()
		TrayTip("Info", "Initialisation réussi, premier poisson manuel. Appuyer sur F3 après.", 1)
		MouseMove($posMouseClick[0], $posMouseClick[1])
	EndFunc

Func init3()
		$ok = 1
		TrayTip("Info", "Lancement du mode automatique.", 1)
		Sleep(500)
	EndFunc

Func launch()
		TrayTip("Info", "Lancement de la canne à pêche.", 1)
		MouseMove($posMouseClick[0], $posMouseClick[1])
		MouseDown("left")
		Sleep(Random(12, 77))
		MouseUp("left")
		Sleep(Random(5955, 6955))
		MouseMove($posMouseClick[0], $posMouseClick[1])
		MouseDown("left")
		Sleep(Random(12, 77))
		MouseUp("left")
	EndFunc

Func initPosition()
		Sleep(Random(150,200))
		$posPoisson = PixelSearch($posDroiteStart[0], $posDroiteStart[1]-2, $posDroiteStart[0] + 300, $posDroiteStart[1]+2, 14583095, 10, 2)
		If @error = 1 Then
			$posPoisson = PixelSearch($posDroiteStart[0], $posDroiteStart[1]-2, $posDroiteStart[0] + 300, $posDroiteStart[1]+2, 14583095, 10, 2)
			If @error = 1 Then
				TrayTip("Info", "Erreur, longue pause ...", 1)
				Sleep(Random(35000, 65000))
				$ok2 = 0
			EndIf
		EndIf
;~ 		MsgBox(0,"test", @error,1)
		TrayTip("Info", "Initialisation de la position initiale.", 1)
	EndFunc