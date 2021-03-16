#!/bin/bash
#############################################################################
##
##  restore distribution lists
##
#############################################################################

# cdl  - create distribution list
# ddl  - delete distribution list
# qdl  - query distribution list

# gdlm - get distribution list members
# adlm - add distribution list member
# rdlm - remove distribution list member

# gadl - get all distribution lists


#############################################################################
##
##  brassbandapeldoorn.nl
##
#############################################################################

# info
su - zimbra -c 'zmprov adlm info@brassbandapeldoorn.nl richard@uzori.com' 

# bestuur
su - zimbra -c 'zmprov adlm bestuur@brassbandapeldoorn.nl ellenkluin@hetnet.nl'
su - zimbra -c 'zmprov adlm bestuur@brassbandapeldoorn.nl monique.kluin@hotmail.com'
su - zimbra -c 'zmprov adlm bestuur@brassbandapeldoorn.nl rvanteinde@gmail.com'
su - zimbra -c 'zmprov adlm bestuur@brassbandapeldoorn.nl richard@uzori.com'

# voorzitter
su - zimbra -c 'zmprov adlm voorzitter@brassbandapeldoorn.nl monique.kluin@hotmail.com'

# penningmeester
su - zimbra -c 'zmprov adlm penningmeester@brassbandapeldoorn.nl ellenkluin@hetnet.nl'

# secretaris
su - zimbra -c 'zmprov adlm secretaris@brassbandapeldoorn.nl ellenkluin@hetnet.nl'

# spelende-leden
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl a.pluim@gmail.com'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl a.yntema@gmail.com'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl brigitta1974@live.nl'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl coberco@gmail.com'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl corkrommenhoek@gmail.com'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl dhbuitenhuis@hotmail.com'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl edwinkrommenhoek@gmail.com'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl ellenkluin@hetnet.nl'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl haralt@mediaworks.nl'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl jankluin57@gmail.com'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl lomanteitsma@upcmail.nl'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl mariannebrandemann@hotmail.com'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl monique.kluin@hotmail.com'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl mulfaas@planet.nl'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl raymondkluin@hotmail.com'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl richard@uzori.com'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl roelkluin1951@outlook.com'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl rvanteinde@gmail.com'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl s.westerink3@chello.nl'
su - zimbra -c 'zmprov adlm spelende-leden@brassbandapeldoorn.nl whsmits@gmail.com'

# semi-leden
su - zimbra -c 'zmprov adlm semi-leden@brassbandapeldoorn.nl berend.kemper@planet.nl'
su - zimbra -c 'zmprov adlm semi-leden@brassbandapeldoorn.nl e.kuper@home.nl'
su - zimbra -c 'zmprov adlm semi-leden@brassbandapeldoorn.nl g.j.degroot@chello.nl'
su - zimbra -c 'zmprov adlm semi-leden@brassbandapeldoorn.nl hanneke.brink@upcmail.nl'
su - zimbra -c 'zmprov adlm semi-leden@brassbandapeldoorn.nl hekkyman@gmail.com'
su - zimbra -c 'zmprov adlm semi-leden@brassbandapeldoorn.nl j.westra67@upcmail.nl'
su - zimbra -c 'zmprov adlm semi-leden@brassbandapeldoorn.nl mark.debets@gmail.com'
su - zimbra -c 'zmprov adlm semi-leden@brassbandapeldoorn.nl sten.v.tongeren@gmail.com'

# overige-leden
su - zimbra -c 'zmprov adlm overige-leden@brassbandapeldoorn.nl arma37@tele2.nl'
su - zimbra -c 'zmprov adlm overige-leden@brassbandapeldoorn.nl f.fonteijn@gmail.com'
su - zimbra -c 'zmprov adlm overige-leden@brassbandapeldoorn.nl jffaas@telfort.nl'
su - zimbra -c 'zmprov adlm overige-leden@brassbandapeldoorn.nl mulfaas@planet.nl'
su - zimbra -c 'zmprov adlm overige-leden@brassbandapeldoorn.nl lenykluin@hotmail.com'

# leden
su - zimbra -c 'zmprov adlm leden@brassbandapeldoorn.nl info@janbosveld.nl'
su - zimbra -c 'zmprov adlm leden@brassbandapeldoorn.nl overige-leden@brassbandapeldoorn.nl'
su - zimbra -c 'zmprov adlm leden@brassbandapeldoorn.nl semi-leden@brassbandapeldoorn.nl'
su - zimbra -c 'zmprov adlm leden@brassbandapeldoorn.nl spelende-leden@brassbandapeldoorn.nl'


#############################################################################
##
##  kleinleugemors.com
##
#############################################################################

# info
su - zimbra -c 'zmprov adlm info@kleinleugemors.com richard@uzori.com'


#############################################################################
##
##  niet.nu
##
#############################################################################

# info
su - zimbra -c 'zmprov adlm info@niet.nu richard@uzori.com'


#############################################################################
##
##  ruralwf.org
##
#############################################################################

# info
su - zimbra -c 'zmprov adlm info@ruralwf.org charles@ruralwf.org'
su - zimbra -c 'zmprov adlm info@ruralwf.org ngozi@ruralwf.org'
su - zimbra -c 'zmprov adlm info@ruralwf.org richard@uzori.com'
su - zimbra -c 'zmprov adlm info@ruralwf.org uzo@uzori.com'

# board
su - zimbra -c 'zmprov adlm board@ruralwf.org charles@ruralwf.org'
su - zimbra -c 'zmprov adlm board@ruralwf.org ngozi@ruralwf.org'
su - zimbra -c 'zmprov adlm board@ruralwf.org richard@uzori.com'
su - zimbra -c 'zmprov adlm board@ruralwf.org uzo@uzori.com'


#############################################################################
##
##  stichtingrwf.nl
##
#############################################################################

# info
su - zimbra -c 'zmprov adlm info@stichtingrwf.nl richard@uzori.com'
su - zimbra -c 'zmprov adlm info@stichtingrwf.nl uzo@uzori.com'

# bestuur
su - zimbra -c 'zmprov adlm bestuur@stichtingrwf.nl a.dondorp@gmail.com'
su - zimbra -c 'zmprov adlm bestuur@stichtingrwf.nl a.dondorp@yahoo.com'
su - zimbra -c 'zmprov adlm bestuur@stichtingrwf.nl richard@uzori.com'
su - zimbra -c 'zmprov adlm bestuur@stichtingrwf.nl uzo@uzori.com'


#############################################################################
##
##  catisa.org
##
#############################################################################

# info
su - zimbra -c 'zmprov adlm info@catisa.org richard@uzori.com'


#############################################################################
##
##  cmrte.org
##
#############################################################################

# info
su - zimbra -c 'zmprov adlm info@cmrte.org richard@uzori.com'


#############################################################################
##
##  morama.org
##
#############################################################################

# info
su - zimbra -c 'zmprov adlm info@morama.org richard@uzori.com'


#############################################################################
##
##  uzori.com
##
#############################################################################

# info
su - zimbra -c 'zmprov adlm info@uzori.com richard@uzori.com'

# ouders
su - zimbra -c 'zmprov adlm ouders@uzori.com richard@uzori.com'
su - zimbra -c 'zmprov adlm ouders@uzori.com uzo@uzori.com'


### EOF #####################################################################
