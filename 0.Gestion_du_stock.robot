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
	
CTNM - Gestion de Stock
	Click Element		  id=mainmenua_products
	Location Should Be		http://192.168.200.50:8000/dolibarr/product/index.php?mainmenu=products&leftmenu=
	
CTNM - Creation d'un nouveau produit
	Click Element		xpath=//*[@id="id-left"]/div/div[3]/div[3]/a
	Location Should Be		http://192.168.200.50:8000/dolibarr/product/card.php?leftmenu=product&action=create&type=0
	Input Text	  id=ref		Reference1
	Input Text	  xpath=//*[@id="id-right"]/div/form/div[2]/table[1]/tbody/tr[2]/td[2]/input		Libelle1
	Click Button	  xpath=//*[@id="id-right"]/div/form/div[3]/input[1]
	Location Should Contain 		http://192.168.200.50:8000/dolibarr/product/card.php?id=
	
	
CTEX - Creation d'un produit deja existant
	Click Element		xpath=//*[@id="id-left"]/div/div[3]/div[3]/a
	Location Should Be		http://192.168.200.50:8000/dolibarr/product/card.php?leftmenu=product&action=create&type=0
	Input Text	  id=ref		Reference1
	Input Text	  xpath=//*[@id="id-right"]/div/form/div[2]/table[1]/tbody/tr[2]/td[2]/input		Libelle1
	Click Button	  xpath=//*[@id="id-right"]/div/form/div[3]/input[1]
	Location Should Be 		http://192.168.200.50:8000/dolibarr/product/card.php
	Comment 	Page Should Contain		Un produit avec la
	
		
CTNM - Suppression d'un produit
	Comment 	Retour sur la page produit
	Click Element		  id=mainmenua_products
	Location Should Be		http://192.168.200.50:8000/dolibarr/product/index.php?mainmenu=products&leftmenu=
	
	Comment		Selection et suppression d'un produit existant
	Click Element 		xpath=//*[@id="id-right"]/div/div/div[2]/div/div/table/tbody/tr[2]/td[1]/a
	Click Element		xpath=//*[@id="action-delete"]
	Click Button		xpath=//*[@id="mainbody"]/div[14]/div[3]/div/button[1]

	
	
	
	