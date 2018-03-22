#!/bin/bash
echo "
             ++++++++++++++++++++++++++++++++
             +         APK SIGNER CLI       +
             +                              +
             +              By: Shehu Awwal +
             ++++++++++++++++++++++++++++++++                                                        
"
echo "Generate A Key Or Sign An APK App Or Verify An APK App"

echo "Press 1 To Generate A Certificate, Press 2 To Sign An App, Press 3 To Verify An App"
read num
if [ $num -eq 1 ]
then
	echo "Keystore Name"
	read keystore
	echo "Keystore Alias Name"
	read alias_keystore
	echo "Validity (In Days)"
	read val_date
	keytool -genkey -v -keystore $keystore -alias $alias_keystore -keyalg RSA -keysize 2048 -validity $val_date

elif [ $num -eq 2 ]
then	
	echo "Enter Keystore Name"
	read -e cert
	echo "App Name"
	read -e app_name
	echo "KeyStore Alias Name"
	read alias_name
	jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $cert $app_name $alias_name | grep -i "jar signed"
elif [ $num -eq 3 ]
then
	echo "App Name" 
	read -e a_name
	echo "Verifying APK File"
	jarsigner -verify -verbose $a_name | grep -i "Sign"
else 
	echo "Input A Valid Key"
fi
