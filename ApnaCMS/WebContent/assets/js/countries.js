/*
	*	Original script by: Shafiul Azam
	*	Version 4.0
	*	Modified by: Luigi Balzano

	*	Description:
	*	Inserts Countries and/or States as Dropdown List
	*	How to Use:

		In Head section:
		----------------
		<script type= "text/javascript" src = "countries.js"></script>
		
		In Body Section:
		----------------
		Select Country (with states):   <select id="country" name ="country"></select>
			
		Select State: <select name ="state" id ="state"></select>

        Select Country (without states):   <select id="country2" name ="country2"></select>
			
		<script language="javascript">
			populateCountries("country", "state");
			populateCountries("country2");
		</script>

	*
	*	License: Free to copy, distribute, modify, whatever you want to.
	*	Aurthor's Website: http://bdhacker.wordpress.com
	*
*/

// Countries
var state2_arr = new Array("Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu Kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand", "West Bengal", "Andaman Nicobar","Chandigarh","Dadra Nagar Haveli","Daman Diu","Delhi","Lakshadweep","Ladakh","Puducherry");

// States
var s_a = new Array();
s_a[0]="";
s_a[1]="Anantapur|Chittoor|East Godavari|Guntur|Kadapa|Krishna|Kurnool|Nellore|Prakasam|Srikakulam|Visakhapatnam|Vizianagaram|West Godavari";
s_a[2]="Anjaw|Siang|Changlang|Dibang Valley|East Kameng|East Siang|Kamle|Kra Daadi|Kurung Kumey|Lepa Rada|Lohit|Longding|Lower Dibang Valley|Lower Siang|Lower Subansiri|Namsai|Pakke Kessang|Papum Pare|Shi Yomi|Tawang|Tirap|Upper Siang|Upper Subansiri|West Kameng|West Siang";
s_a[3]="Bajali|Baksa|Barpeta|Biswanath|Bongaigaon|Cachar|Charaideo|Chirang|Darrang|Dhemaji|Dhubri|Dibrugarh|Dima Hasao|Goalpara|Golaghat|Hailakandi|Hojai|Jorhat|Kamrup|Kamrup Metropolitan|Karbi Anglong|Karimganj|Kokrajhar|Lakhimpur|Majuli|Morigaon|Nagaon|Nalbari|Sivasagar|Sonitpur|South Salmara-Mankachar|Tinsukia|Udalguri|West Karbi Anglong";
s_a[4]="Araria|Arwal|Aurangabad|Banka|Begusarai|Bhagalpur|Bhojpur|Buxar|Darbhanga|East Champaran|Gaya|Gopalganj|Jamui|Jehanabad|Kaimur|Katihar|Khagaria|Kishanganj|Lakhisarai|Madhepura|Madhubani|Munger|Muzaffarpur|Nalanda|Nawada|Patna|Purnia|Rohtas|Saharsa|Samastipur|Saran|Sheikhpura|Sheohar|Sitamarhi|Siwan|Supaul|Vaishali|West Champaran";
s_a[5]="Balod|Baloda Bazar|Balrampur Ramanujganj|Bastar|Bemetara|Bijapur|Bilaspur|Dantewada|Dantewada|Durg|Gariaband|Gaurela Pendra Marwahi|Janjgir Champa|Jashpur|Kabirdham|Kanker|Kondagaon|Korba|Koriya|Mahasamund|Mungeli|Narayanpur|Raigarh|Raipur|Rajnandgaon|Sukma|Surajpur|Surguja";
s_a[6]="North Goa|South Goa";
s_a[7]="Ahmedabad|Amreli|Anand|Aravalli|Banaskantha|Bharuch|Bhavnagar|Botad|Chhota Udaipur|Dahod|Dang|Devbhoomi Dwarka|Gandhinagar|Gir Somnath|Jamnagar|Junagadh|Kheda|Kutch|Mahisagar|Mehsana|Morbi|Narmada|Navsari|Panchmahal|Patan|Porbandar|Rajkot|Sabarkantha|Surat|Surendranagar|Tapi|Vadodara|Valsad";
s_a[8]="Ambala|Bhiwani|Charkhi Dadri|Faridabad|Fatehabad|Gurugram |Hisar|Jhajjar|Jind|Kaithal|Karnal|Kurukshetra|Mahendragarh|Mewat|Palwal|Panchkula|Panipat|Rewari|Rohtak|Sirsa|Sonipat|Yamunanagar";
s_a[9]="Bilaspur|Chamba|Hamirpur|Kangra|Kinnaur|Kullu|Lahaul Spiti|Lahaul Spiti|Shimla|Sirmaur|Solan|Una";
s_a[10]="Anantnag|Bandipora|Baramulla|Budgam|Doda|Ganderbal|Jammu|Kathua|Kishtwar|Kulgam|Kupwara|Poonch|Pulwama|Rajouri|Ramban|Reasi|Samba|Shopian|Srinagar|Udhampur";
s_a[11]="Bokaro|Chatra|Deoghar|Dhanbad|Dumka|East Singhbhum|Garhwa|Giridih|Godda|Gumla|Hazaribagh|Jamtara|Khunti|Koderma|Latehar|Lohardaga|Pakur|Palamu|Ramgarh|Ranchi|Sahebganj|Seraikela Kharsawan|Simdega|West Singhbhum"
s_a[12]="Alappuzha|Ernakulam|Idukki|Kannur|Kasaragod|Kollam|Kottayam|Kozhikode|Malappuram|Palakkad|Pathanamthitta|Thiruvananthapuram|Thrissur|Wayanad";
s_a[13]="Bagalkot|Bangalore Rural|Bangalore Urban|Belgaum|Bellary|Bidar|Chamarajanagar|Chikkaballapur|Chikkamagaluru|Chitradurga|Dakshina Kannada|Davanagere|Dharwad|Gadag|Gulbarga|Hassan|Haveri|Kodagu|Kolar|Koppal|Mandya|Mysore|Raichur|Ramanagara|Shimoga|Tumkur|Udupi|Uttara Kannada|Vijayanagara|Vijayapura|Yadgir";
s_a[14]="Agar Malwa|Alirajpur|Anuppur|Ashoknagar|Balaghat|Barwani|Betul|Bhind|Bhopal|Burhanpur|Chachaura*|Chhatarpur|Chhindwara|Damoh|Datia|Dewas|Dhar|Dindori|Guna|Gwalior|Harda|Hoshangabad|Indore|Jabalpur|Jhabua|Katni|Khandwa|Khargone|Maihar*|Mandla|Mandsaur|Morena|Nagda*|Narsinghpur|Neemuch|Niwari *|Panna|Raisen|Rajgarh|Ratlam|Rewa|Sagar|Satna|Sehore|Seoni|Shahdol|Shajapur|Sheopur|Shivpuri|Sidhi|Singrauli|Tikamgarh|Ujjain|Umaria|Vidisha";
s_a[15]="Ahmednagar|Akola|Amravati|Aurangabad|Beed|Bhandara|Buldhana|Chandrapur|Dhule|Gadchiroli|Gondia|Hingoli|Jalgaon|Jalna|Kolhapur|Latur|Mumbai City|Mumbai Suburban|Nagpur|Nanded|Nandurbar|Nashik|Osmanabad|Palghar|Parbhani|Pune|Raigad|Ratnagiri|Sangli|Satara|Sindhudurg|Solapur|Thane|Wardha|Washim|Yavatmal";
s_a[16]="Bishnupur|Chandel|Churachandpur|Imphal East|Imphal West|Jiribam|Kakching|Kamjong|Kangpokpi|Noney|Pherzawl|Senapati|Tamenglong|Tengnoupal|Thoubal|Ukhrul";
s_a[17]="East Garo Hills|East Jaintia Hills|East Khasi Hills|North Garo Hills|Ri Bhoi|South Garo Hills|South West Garo Hills|South West Khasi Hills|West Garo Hills|West Jaintia Hills|West Khasi Hills";
s_a[18]="Aizawl|Champhai|Hnahthial|Khawzawl|Kolasib|Lawngtlai|Lunglei|Mamit|Saiha|Saitual|Serchhip";
s_a[19]="Mon|Dimapur|Kiphire|Kohima|Longleng|Mokokchung|Noklak|Peren|Phek|Tuensang|Wokha|Zunheboto";
s_a[20]="Angul|Balangir|Balasore|Bargarh|Bhadrak|Boudh|Cuttack|Debagarh|Dhenkanal|Gajapati|Ganjam|Jagatsinghpur|Jajpur|Jharsuguda|Kalahandi|Kandhamal|Kendrapara|Kendujhar|Khordha *|Koraput|Malkangiri|Mayurbhanj|Nabarangpur|Nayagarh|Nuapada|Puri|Rayagada|Sambalpur|Subarnapur|Sundergarh";
s_a[21]="Amritsar|Barnala|Bathinda|Faridkot|Fatehgarh Sahib|Fazilka|Firozpur|Gurdaspur|Hoshiarpur|Jalandhar|Kapurthala|Ludhiana|Mansa|Moga|Mohali|Muktsar|Pathankot|Patiala|Rupnagar|Sangrur|Shaheed Bhagat Singh Nagar|Tarn Taran";
s_a[22]="East Sikkim|North Sikkim|South Sikkim|West Sikkim";
s_a[23]="Ariyalur|Chengalpattu *|Chennai|Coimbatore|Cuddalore|Dharmapuri|Dindigul|Erode|Kallakurichi *|Kanchipuram|Kanyakumari|Karur|Krishnagiri|Madurai|Mayiladuthurai*|Nagapattinam|Namakkal|Nilgiris|Perambalur|Pudukkottai|Ramanathapuram|Ranipet*|Salem|Sivaganga|Tenkasi *|Thanjavur|Theni|Thoothukudi|Tiruchirappalli|Tirunelveli|Tirupattur*|Tiruppur|Tiruvallur|Tiruvannamalai|Tiruvarur|Vellore|Viluppuram|Virudhunagar";
s_a[24]="Adilabad|Bhadradri Kothagudem|Hyderabad|Jagtial|Jangaon|Jayashankar Bhupalpally|Jogulamba Gadwal|Kamareddy|Karimnagar|Khammam|Komaram Bheem|Mahabubabad|Mahbubnagar|Mancherial|Medak|Medchal|Mulugu *|Nagarkurnool|Nalgonda|Narayanpet *|Nirmal|Nizamabad|Peddapalli|Rajanna Sircilla|Ranga Reddy|Sangareddy|Siddipet|Suryapet|Vikarabad|Wanaparthy|Warangal Rural|Warangal Urban|Yadadri Bhuvanagiri";
s_a[25]="Dhalai|Gomati|Khowai|North Tripura|Sepahijala|South Tripura|Unakoti|West Tripura";
s_a[26]="Agra|Aligarh|Prayagraj*|Ambedkar Nagar|Amethi *|Amroha *|Auraiya|Azamgarh|Baghpat|Bahraich|Ballia|Balrampur|Banda|Barabanki|Bareilly|Basti|Bhadohi|Bijnor|Budaun|Bulandshahr|Chandauli|Chitrakoot|Deoria|Etah|Etawah|Ayodhya *|Farrukhabad|Fatehpur|Firozabad|Gautam Buddha Nagar|Ghaziabad|Ghazipur|Gonda|Gorakhpur|Hamirpur|Hapur *|Hardoi|Hathras *|Jalaun|Jaunpur|Jhansi|Kannauj|Kanpur Dehat *|Kanpur Nagar|Kasganj *|Kaushambi|Kheri|Kushinagar|Lalitpur|Lucknow|Maharajganj|Mahoba|Mainpuri|Mathura|Mau|Meerut|Mirzapur|Moradabad|Muzaffarnagar|Pilibhit|Pratapgarh|Raebareli|Rampur|Saharanpur|Sambhal *|Sant Kabir Nagar|Shahjahanpur|Shamli *|Shravasti|Siddharthnagar|Sitapur|Sonbhadra|Sultanpur|Unnao|Varanasi";
s_a[27]="Almora|Bageshwar|Chamoli|Champawat|Dehradun|Haridwar|Nainital|Pauri|Pithoragarh|Rudraprayag|Tehri|Udham Singh Nagar|Uttarkashi";
s_a[28]="Alipurduar|Bankura|Birbhum|Cooch Behar|Dakshin Dinajpur|Darjeeling|Hooghly|Howrah|Jalpaiguri|Jhargram|Kalimpong|Kolkata|Malda|Murshidabad|Nadia|North 24 Parganas|Paschim Bardhaman|Paschim Medinipur|Purba Bardhaman|Purba Medinipur|Purulia|South 24 Parganas|Uttar Dinajpur";
s_a[29]="Nicobar|North Middle Andaman|South Andaman";
s_a[23]="East Sikkim|North Sikkim|South Sikkim|West Sikkim";
s_a[31]="Chandigarh";
s_a[32]="Dadra Nagar Haveli";	
s_a[33]="Daman|Diu";
s_a[34]="Central Delhi|East Delhi|New Delhi|North Delhi|North East Delhi|North West Delhi|Shahdara|South Delhi|South East Delhi|South West Delhi|West Delhi";
s_a[35]="Lakshadweep";
s_a[36]="Kargil|Leh";
s_a[37]="Karaikal|Mahe|Puducherry|Yanam";

function populateCities( stateElementId, cityElementId ){
	
	var selectedStateIndex = document.getElementById( stateElementId ).selectedIndex;

	var cityElement = document.getElementById( cityElementId );
	
	cityElement.length=0;	// Fixed by Julian Woods
	cityElement.options[0] = new Option('Select City...','');
	cityElement.selectedIndex = 0;
	
	var state_arr = s_a[selectedStateIndex].split("|");
	
	for (var i=0; i<state_arr.length; i++) {
		cityElement.options[cityElement.length] = new Option(state_arr[i],state_arr[i]);
	}
}

function populateStates(stateElementId, cityElementId){
	// given the id of the <select> tag as function argument, it inserts <option> tags
	var stateElement = document.getElementById(stateElementId);
	stateElement.length=0;
	stateElement.options[0] = new Option('Select State...','-1');
	stateElement.selectedIndex = 0;
	for (var i=0; i<state2_arr.length; i++) {
		stateElement.options[stateElement.length] = new Option(state2_arr[i],state2_arr[i]);
	}

	// Assigned all countries. Now assign event listener for the states.

	if( cityElementId ){
		stateElement.onchange = function(){
			populateCities( stateElementId, cityElementId );
		};
	}
}