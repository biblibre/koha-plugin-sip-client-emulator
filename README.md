# koha-plugin-sip-client-emulator

fields :
* Host & Port => (e.g. : localhost/6001)
* Location => the site of the account
* Login & Password => of the account (see in /home/koha/etc/SIPconfig.xml)
* Item => barcode
* User card n° => N° card number
* Message => the command line to run (see below) :

commands :
* checkout
* checkin
* item_information
* patron_information
* patron_status_request
* hold
* renew

Note : once typed for the first time in the browser, these 7 commands will be offered in a drop-down list in focus
See https://suivi.biblibre.com/view.php?id=38109
