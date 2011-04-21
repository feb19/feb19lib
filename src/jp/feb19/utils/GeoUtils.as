package jp.feb19.utils
{
	import adobe.utils.CustomActions;
	
	/**
	 * ...
	 * @author Nobuhiro Takahashi
	 */
	public class GeoUtils
	{
		public static function codeToCountry(code:String="JP"):String
		{
			for (var i:int = 0; i < areas.length; i++)
			{
				var a:Object = areas[i];
				var area:Array = GeoUtils[a.data];
				
				for (var j:int = 0; j < area.length; j++)
				{
					if (area[j].data == code.toUpperCase())
					{
						return area[j].label;
					}
				}
			}
			
			return "";
		}
		
		public static function get areas():Array
		{
			var areas:Array = [
				{ data:"asia", label:"ASIA"},
				{ data:"oceanian", label:"OCEANIAN"},
				{ data:"middleEast", label:"THE MIDDLE EAST."},
				{ data:"europe", label:"EUROPE"},
				{ data:"africa", label:"AFRICA"},
				{ data:"northAmerica", label:"NORTH AMERICA"},
				{ data:"southAndCentralAmerica", label:"SOUTH AND CENTRAL AMERICA"}
			];
			
			return areas;
		}
		
		public static function get asia():Array
		{
			var countries:Array = [
				{ data:"BD", label:"BANGLADESH" },
				{ data:"BT", label:"BHUTAN" },
				{ data:"BN", label:"BRUNEI DARUSSALAM" },
				{ data:"KH", label:"CAMBODIA" },
				{ data:"CN", label:"CHINA" },
				{ data:"HK", label:"HONG KONG" },
				{ data:"IN", label:"INDIA" },
				{ data:"ID", label:"INDONESIA" },
				{ data:"JP", label:"JAPAN" },
				{ data:"KP", label:"KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF" },
				{ data:"KR", label:"KOREA, REPUBLIC OF" },
				{ data:"LA", label:"LAO PEOPLE'S DEMOCRATIC REPUBLIC" },
				{ data:"MO", label:"MACAO" },
				{ data:"MY", label:"MALAYSIA" },
				{ data:"MV", label:"MALDIVES" },
				{ data:"MN", label:"MONGOLIA" },
				{ data:"MM", label:"MYANMAR" },
				{ data:"NP", label:"NEPAL" },
				{ data:"PK", label:"PAKISTAN" },
				{ data:"PH", label:"PHILIPPINES" },
				{ data:"SG", label:"SINGAPORE" },
				{ data:"LK", label:"SRI LANKA" },
				{ data:"TW", label:"TAIWAN, PROVINCE OF CHINA" },
				{ data:"TH", label:"THAILAND" },
				{ data:"TL", label:"TIMOR-LESTE" },
				{ data:"VN", label:"VIET NAM" }
			];
			
			return countries;
		}
		
		public static function get oceanian():Array
		{
			var countries:Array = [
				{ data:"AU", label:"AUSTRALIA" },
			//	{ data:"CX", label:"CHRISTMAS ISLAND" },
			//	{ data:"CC", label:"COCOS (KEELING) ISLANDS" },
				{ data:"CK", label:"COOK ISLANDS" },
				{ data:"FJ", label:"FIJI" },
			//	{ data:"HM", label:"HEARD ISLAND AND MCDONALD ISLANDS" },
				{ data:"KI", label:"KIRIBATI" },
				{ data:"MH", label:"MARSHALL ISLANDS" },
				{ data:"FM", label:"MICRONESIA, FEDERATED STATES OF" },
				{ data:"NR", label:"NAURU" },
				{ data:"NZ", label:"NEW ZEALAND" },
				{ data:"NU", label:"NIUE" },
			//	{ data:"NF", label:"NORFOLK ISLAND" },
				{ data:"PW", label:"PALAU" },
				{ data:"PG", label:"PAPUA NEW GUINEA" },
				{ data:"WS", label:"SAMOA" },
				{ data:"SB", label:"SOLOMON ISLANDS" },
			//	{ data:"TK", label:"TOKELAU" },
				{ data:"TO", label:"TONGA" },
				{ data:"TV", label:"TUVALU" },
				{ data:"VU", label:"VANUATU" }
			];
			
			return countries;
		}
		
		public static function get middleEast():Array
		{
			var countries:Array = [
				{ data:"AF", label:"AFGHANISTAN" },
				{ data:"BH", label:"BAHRAIN" },
				{ data:"IR", label:"IRAN, ISLAMIC REPUBLIC OF" },
				{ data:"IQ", label:"IRAQ" },
				{ data:"IL", label:"ISRAEL" },
				{ data:"JO", label:"JORDAN" },
				{ data:"KZ", label:"KAZAKHSTAN" },
				{ data:"KW", label:"KUWAIT" },
				{ data:"LB", label:"LEBANON" },
				{ data:"OM", label:"OMAN" },
				{ data:"QA", label:"QATAR" },
				{ data:"SA", label:"SAUDI ARABIA" },
				{ data:"SY", label:"SYRIAN ARAB REPUBLIC" },
				{ data:"TR", label:"TURKEY" },
				{ data:"AE", label:"UNITED ARAB EMIRATES" },
				{ data:"YE", label:"YEMEN" }
			];
			
			return countries;
		}
		
		public static function get europe():Array
		{
			var countries:Array = [
			//	{ data:"AX", label:"ÅLAND ISLANDS" },
				{ data:"AL", label:"ALBANIA" },
				{ data:"AD", label:"ANDORRA" },
			//	{ data:"AI", label:"ANGUILLA" },
				{ data:"AM", label:"ARMENIA" },
			//	{ data:"AW", label:"ARUBA" },
				{ data:"AT", label:"AUSTRIA" },
				{ data:"AZ", label:"AZERBAIJAN" },
				{ data:"BY", label:"BELARUS" },
				{ data:"BE", label:"BELGIUM" },
			//	{ data:"BM", label:"BERMUDA" },
				{ data:"BA", label:"BOSNIA AND HERZEGOVINA" },
			//	{ data:"BV", label:"BOUVET ISLAND" },
			//	{ data:"IO", label:"BRITISH INDIAN OCEAN TERRITORY" },
				{ data:"BG", label:"BULGARIA" },
			//	{ data:"KY", label:"CAYMAN ISLANDS" },
				{ data:"HR", label:"CROATIA" },
				{ data:"CY", label:"CYPRUS" },
				{ data:"CZ", label:"CZECH REPUBLIC" },
				{ data:"DK", label:"DENMARK" },
				{ data:"EE", label:"ESTONIA" },
			//	{ data:"FO", label:"FAROE ISLANDS" },
				{ data:"FI", label:"FINLAND" },
				{ data:"FR", label:"FRANCE" },
			//	{ data:"GF", label:"FRENCH GUIANA" },
			//	{ data:"PF", label:"FRENCH POLYNESIA" },
			//	{ data:"TF", label:"FRENCH SOUTHERN TERRITORIES" },
				{ data:"GE", label:"GEORGIA" },
				{ data:"DE", label:"GERMANY" },
			//	{ data:"GI", label:"GIBRALTAR" },
				{ data:"GR", label:"GREECE" },
			//	{ data:"GP", label:"GUADELOUPE" },
			//	{ data:"GG", label:"GUERNSEY" },
				{ data:"VA", label:"HOLY SEE (VATICAN CITY STATE)" },
				{ data:"HU", label:"HUNGARY" },
				{ data:"IS", label:"ICELAND" },
				{ data:"IE", label:"IRELAND" },
			//	{ data:"IM", label:"ISLE OF MAN" },
				{ data:"IT", label:"ITALY" },
			//	{ data:"JE", label:"JERSEY" },
				{ data:"KG", label:"KYRGYZSTAN" },
				{ data:"LV", label:"LATVIA" },
				{ data:"LI", label:"LIECHTENSTEIN" },
				{ data:"LT", label:"LITHUANIA" },
				{ data:"LU", label:"LUXEMBOURG" },
				{ data:"MK", label:"MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF" },
				{ data:"MT", label:"MALTA" },
			//	{ data:"MQ", label:"MARTINIQUE" },
			//	{ data:"YT", label:"MAYOTTE" },
				{ data:"MD", label:"MOLDOVA, REPUBLIC OF" },
				{ data:"MC", label:"MONACO" },
				{ data:"ME", label:"MONTENEGRO" },
			//	{ data:"MS", label:"MONTSERRAT" },
				{ data:"NL", label:"NETHERLANDS" },
			//	{ data:"AN", label:"NETHERLANDS ANTILLES" },
			//	{ data:"NC", label:"NEW CALEDONIA" },
				{ data:"NO", label:"NORWAY" },
			//	{ data:"PN", label:"PITCAIRN" },
				{ data:"PL", label:"POLAND" },
				{ data:"PT", label:"PORTUGAL" },
			//	{ data:"RE", label:"RÉUNION" },
				{ data:"RO", label:"ROMANIA" },
				{ data:"RU", label:"RUSSIAN FEDERATION" },
			//	{ data:"BL", label:"SAINT BARTHÉLEMY" },
			//	{ data:"SH", label:"SAINT HELENA" },
			//	{ data:"MF", label:"SAINT MARTIN" },
			//	{ data:"PM", label:"SAINT PIERRE AND MIQUELON" },
				{ data:"SM", label:"SAN MARINO" },
				{ data:"RS", label:"SERBIA" },
				{ data:"SK", label:"SLOVAKIA" },
				{ data:"SI", label:"SLOVENIA" },
			//	{ data:"GS", label:"SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS" },
				{ data:"ES", label:"SPAIN" },
			//	{ data:"SJ", label:"SVALBARD AND JAN MAYEN" },
				{ data:"SE", label:"SWEDEN" },
				{ data:"CH", label:"SWITZERLAND" },
				{ data:"TJ", label:"TAJIKISTAN" },
				{ data:"TM", label:"TURKMENISTAN" },
			//	{ data:"TC", label:"TURKS AND CAICOS ISLANDS" },
				{ data:"UA", label:"UKRAINE" },
				{ data:"GB", label:"UNITED KINGDOM" },
				{ data:"UZ", label:"UZBEKISTAN" },
				{ data:"VA", label:"VATICAN CITY STATE" }//,
			//	{ data:"VG", label:"VIRGIN ISLANDS, BRITISH" },
			//	{ data:"WF", label:"WALLIS AND FUTUNA" }
			];
			
			return countries;
		}
		
		public static function get africa():Array
		{
			var countries:Array = [
				{ data:"DZ", label:"ALGERIA" },
				{ data:"AO", label:"ANGOLA" },
				{ data:"BJ", label:"BENIN" },
				{ data:"BW", label:"BOTSWANA" },
				{ data:"BF", label:"BURKINA FASO" },
				{ data:"BI", label:"BURUNDI" },
				{ data:"CM", label:"CAMEROON" },
				{ data:"CV", label:"CAPE VERDE" },
				{ data:"CF", label:"CENTRAL AFRICAN REPUBLIC" },
				{ data:"TD", label:"CHAD" },
				{ data:"KM", label:"COMOROS" },
				{ data:"CG", label:"CONGO" },
				{ data:"CD", label:"CONGO, THE DEMOCRATIC REPUBLIC OF THE" },
				{ data:"CI", label:"CÔTE D'IVOIRE" },
				{ data:"DJ", label:"DJIBOUTI" },
				{ data:"EG", label:"EGYPT" },
				{ data:"GQ", label:"EQUATORIAL GUINEA" },
				{ data:"ER", label:"ERITREA" },
				{ data:"ET", label:"ETHIOPIA" },
				{ data:"GA", label:"GABON" },
				{ data:"GM", label:"GAMBIA" },
				{ data:"GH", label:"GHANA" },
				{ data:"GN", label:"GUINEA" },
				{ data:"GW", label:"GUINEA-BISSAU" },
				{ data:"KE", label:"KENYA" },
				{ data:"LS", label:"LESOTHO" },
				{ data:"LR", label:"LIBERIA" },
				{ data:"LY", label:"LIBYAN ARAB JAMAHIRIYA" },
				{ data:"MG", label:"MADAGASCAR" },
				{ data:"MW", label:"MALAWI" },
				{ data:"ML", label:"MALI" },
				{ data:"MR", label:"MAURITANIA" },
				{ data:"MU", label:"MAURITIUS" },
				{ data:"MA", label:"MOROCCO" },
				{ data:"MZ", label:"MOZAMBIQUE" },
				{ data:"NA", label:"NAMIBIA" },
				{ data:"NE", label:"NIGER" },
				{ data:"NG", label:"NIGERIA" },
				{ data:"RW", label:"RWANDA" },
				{ data:"ST", label:"SAO TOME AND PRINCIPE" },
				{ data:"SN", label:"SENEGAL" },
				{ data:"SC", label:"SEYCHELLES" },
				{ data:"SL", label:"SIERRA LEONE" },
				{ data:"SO", label:"SOMALIA" },
				{ data:"ZA", label:"SOUTH AFRICA" },
				{ data:"SD", label:"SUDAN" },
				{ data:"SZ", label:"SWAZILAND" },
				{ data:"TZ", label:"TANZANIA, UNITED REPUBLIC OF" },
				{ data:"TG", label:"TOGO" },
				{ data:"TN", label:"TUNISIA" },
				{ data:"UG", label:"UGANDA" },
				{ data:"EH", label:"WESTERN SAHARA" }
			];
			
			return countries;
		}
		
		public static function get northAmerica():Array
		{
			var countries:Array = [
			//	{ data:"AS", label:"AMERICAN SAMOA" },
				{ data:"CA", label:"CANADA" },
				{ data:"GL", label:"GREENLAND" },
			//	{ data:"GU", label:"GUAM" },
			//	{ data:"MP", label:"NORTHERN MARIANA ISLANDS" },
				{ data:"US", label:"UNITED STATES" },
			//	{ data:"UM", label:"UNITED STATES MINOR OUTLYING ISLANDS" },
			//	{ data:"VI", label:"VIRGIN ISLANDS, U.S." }
			];
			
			return countries;
		}
		
		public static function get southAndCentralAmerica():Array
		{
			var countries:Array = [
				{ data:"AG", label:"ANTIGUA AND BARBUDA" },
				{ data:"AR", label:"ARGENTINA" },
				{ data:"BS", label:"BAHAMAS" },
				{ data:"BB", label:"BARBADOS" },
				{ data:"BZ", label:"BELIZE" },
				{ data:"BO", label:"BOLIVIA" },
				{ data:"BR", label:"BRAZIL" },
				{ data:"CL", label:"CHILE" },
				{ data:"CO", label:"COLOMBIA" },
				{ data:"CR", label:"COSTA RICA" },
				{ data:"CU", label:"CUBA" },
				{ data:"DM", label:"DOMINICA" },
				{ data:"DO", label:"DOMINICAN REPUBLIC" },
				{ data:"EC", label:"ECUADOR" },
				{ data:"SV", label:"EL SALVADOR" },
			//	{ data:"FK", label:"FALKLAND ISLANDS (MALVINAS)" },
				{ data:"GD", label:"GRENADA" },
				{ data:"GT", label:"GUATEMALA" },
				{ data:"GY", label:"GUYANA" },
				{ data:"HT", label:"HAITI" },
				{ data:"HN", label:"HONDURAS" },
				{ data:"JM", label:"JAMAICA" },
				{ data:"MX", label:"MEXICO" },
				{ data:"NI", label:"NICARAGUA" },
				{ data:"PA", label:"PANAMA" },
				{ data:"PY", label:"PARAGUAY" },
				{ data:"PE", label:"PERU" },
				{ data:"KN", label:"SAINT KITTS AND NEVIS" },
				{ data:"LC", label:"SAINT LUCIA" },
				{ data:"VC", label:"SAINT VINCENT AND THE GRENADINES" },
				{ data:"SR", label:"SURINAME" },
				{ data:"TT", label:"TRINIDAD AND TOBAGO" },
				{ data:"UY", label:"URUGUAY" },
				{ data:"VE", label:"VENEZUELA, BOLIVARIAN REPUBLIC OF" },
				{ data:"ZM", label:"ZAMBIA" },
				{ data:"ZW", label:"ZIMBABWE" }
			];
			
			return countries;
		}
	}
	
}