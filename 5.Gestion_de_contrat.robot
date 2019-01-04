*** Settings ***
Library			SeleniumLibrary

*** Variables ***
${BROWSER}		%{BROWSER}
${URL_DOLIBARR}        http://192.168.200.50:8000/dolibarr/index.php

*** Test Cases ***
CTNM - Acces au site
	Open Browser			http://192.168.200.50:8000/dolibarr/index.php		${BROWSER}
	Location Should Be		${URL_DOLIBARR}
	
CTNM - Authentification
	Input Text    xpath=//*[@id="username"]    admin
	Input Text    xpath=//*[@id="password"]    root
	Click Button  xpath=//*[@id="login_line2"]/input
	Location Should Be		http://192.168.200.50:8000/dolibarr/index.php?mainmenu=home
	
CTNM - Gestion de contrat
	Click Element		  id=mainmenua_commercial
	Location Should Be		http://192.168.200.50:8000/dolibarr/comm/index.php?mainmenu=commercial&leftmenu=
	
CTNM - Creation d'un nouveau contrat
	Click Element	xpath=//*[@id="id-left"]/div/div[5]/div[3]/a
	Location Should Be	http://192.168.200.50:8000/dolibarr/contrat/card.php?action=create&leftmenu=contracts
	Click Element	xpath=//*[@id="id-right"]/div/form/div[2]/table/tbody/tr[4]/td[2]/span/span[1]/span
	
	Select From List By Index	id=socid	1
	
	Comment 	Click Element	xpath=//*[@id="mainbody"]/div[11]

	Comment		Click Element	id=select2-socid-result-1mzf-5
	
	Click Button 	xpath=//*[@id="id-right"]/div/form/div[3]/input[1]
	Location Should Contain		http://192.168.200.50:8000/dolibarr/contrat/card.php?id=
	
CTNM - Gestion de contrat - retour
	Click Element		  id=mainmenua_commercial
	Location Should Be		http://192.168.200.50:8000/dolibarr/comm/index.php?mainmenu=commercial&leftmenu=

CTNM - Suppression d'un contrat
	Click Link		xpath=//*[@id="id-right"]/div/div/div[1]/div[1]/table/tbody/tr[2]/td[1]/a


	Comment		Click Element 		xpath=//*[@id="id-right"]/div/div/div[1]/div[1]/table/tbody/tr[2]/td[1]/a
	
	
	Location Should Contain		http://192.168.200.50:8000/dolibarr/comm/propal/card.php?id=
	
	
	Click Button 	xpath=//*[@id="id-right"]/div/div[3]/div[2]/a
	Click Button 	xpath=//*[@id="mainbody"]/div[12]/div[3]/div/button[1]
	

	
	
	