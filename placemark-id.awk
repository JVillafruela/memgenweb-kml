#numerote les id des tags Placemark et Style de manière qu'ils soient uniques
#<Placemark id="insee01152"> => <Placemark id="insee01152-123">
#<Style id="failed04136">

BEGIN { p=0; s=0 }

/<Placemark/ {
	p++
	sub("\">", "-" p "\">", $0)
}

/<Style/ {
	s++
	sub("\">", "-" s "\">", $0)
}

{ print }