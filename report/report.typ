#import "conf.typ": conf
#import "conf.typ": cont
#import "conf.typ": bib

#conf([Εργασία Διαχείρισης Δεδομένων Μεγάλης Κλίμακας], [Ανάλυση σεισμικών δονήσεων και ηφαιστειακών εκρήξεων], 
  [11/04/24], [21/06/24])
#cont()

#set page(numbering: "1")
#counter(page).update(1)

= Εισαγωγή

// Σκοπός αυτής της εργασίας είναι η ανάλυση και η σύγκριση των δεδομένων που προέρχονται από τις βάσεις δεδομένων 
// Database of Volcanic Eruptions και Significant Earthquakes, 1965-2016.
Σε αυτή την εργασία μελετείται η σχέση μεταξύ σεισμών και ηφαιστειακών εκρήξεων εντός μιας ορισμένης περιοχής αντλώντας 
πληροφορίες από την Βαση Δεδομένων Ηφαιστειακών Εκρήξεων (Database of Volcanic Eruptions) και την βάση δεδομένων με Μείζονες Σεισμούς (Significant Earthquakes, 1965-2016).
Η βάση δεδομένων των ηφαιστειακών εκρήξεων περιέχει 
την χρονική περίοδο τη έκρηξης (χρόνος, μήνας και μέρα), το όνομα του ηφαιστείου το οποίο εξερράγη, 
την ώρα της έκρηξης, την τοποθεσία και χώρα άλλα επίσης το γεωγραφικό πλάτος και μήκος και το ύψος του ηφαιστείου.
Η βάση δεδομένων των σεισμικών δονήσεων περιέχει την πλήρης ημερομηνία, την ώρα της έκρηξης, το βάθος, 
το μέγεθος της απόστασης που γίνεται αντιληπτή η σεισμική δόνηση, τον τύπο, το γεωγραφικό πλάτος και μήκος του κέντρο της δόνησης
και την απόσταση που γίνεται αντιληπτή η δόνηση. Με την χρήση του γεωγραφικό πλάτους και μήκους θα προσπαθήσουμε  
με την επεξεργασία τους να βρούμε τα κοινά στοιχεία μεταξύ των δύο διαφορετικών βάσεων δεδομένων.
// Με τα στοιχεία αυτά θέλουμε να βρούμε ε
Βάσει των παραπάνω στοιχείων θα εξετασθεί
αν υπάρχει συσχέτιση μεταξύ των ηφαιστειακών εκρήξεων και των σεισμικών δονήσεων οι οποίοι γίνονται
σε μικρή απόσταση μεταξύ τους, και ποιο φαινόμενο ήταν η αφορμή για την εκδήλωση του άλλου. Κατά την επεξεργασία των δεδομένων 
θα γίνουν οι απαραίτητες τροποποιήσεις ώστε να συμπεριληφθούν μόνο τα δεδομένα που βρίσκονται εντός των προδιαγραφών της μελέτης.
// [...] εντός των προδιαγραφών της μελέτης.
// ίσως να είναι λίγο ασαφές...


= Ορισμός προβλήματος και κίνητρο

// Όπως αναφέρθηκε και στην εισαγωγή το κίνητρο της έρευνας είναι η απάντηση στο κατά πόσο είναι πιθανόν να οφείλονται οι σεισμικές δονήσεις 
// σε ηφαιστειακές εκρήξεις, υπάρχει πιθανότητα να συμβαίνει το αντίθετο;.
Ορισμένες μελέτες έχουν δείξει ότι οι σεισμοί ενδεχομένως να προκαλούν ηφαιστειακές εκρήξεις, όμως χωρίς να έχει βρεθεί ο ακριβής μηχανισμός. @earthquakes-volcanic-eruptions-review
Η απάντηση αυτού του ερωτήματος με στατιστικά στοιχεία 
θα είναι χρήσιμη για τις προβλέψεις που μπορούν να γίνουν σχετικά με τα δύο φυσικά φαινόμενα, την πιθανότητα εκδήλωσης ηφαιστειακής έκρηξης 
έπειτα από σεισμική δόνηση και την έγκαιρη προειδοποίηση του τοπικού πληθυσμού έτσι ώστε να περιοριστεί ο αριθμός θυμάτων και η καταστροφή περιουσίας. 
Δηλαδή, τα στοιχεία θα είναι χρήσιμα και για επιστημονική μελέτη και έρευνες καθώς και για πρόληψη.  


= Σύνολα δεδομένων

Χρησιμοποιήθηκαν δύο σύνολα δεδομένων: ένα σχετικό με σεισμικές δονήσεις και ένα σχετικό με ηφαιστειακές εκρήξεις. Τα δεδομένα έχουν το γεωγραφικό πλάτος και το γεωγραφικό μήκος ως κοινές πληροφορίες που θα χρησιμοποιηθούν για την εύρεση της σχετικής τοποθεσίας τους και 
για την σύγκριση τους. Καθώς τα σύνολα δεδομένων τα οποία χρησιμοποιούνται για την άντληση των δεδομένων έχουν διαφορετικές περιόδους καταγραφής 
θα γίνει σύγκριση μόνο των κοινών περιόδων από το 1965 μέχρι το 2016. Τα δεδομένα που αφορούν στα ονόματα των χωρών ή περιοχών καθώς 
και τα ονόματα των ηφαιστείων δεν χρησιμεύουν στην παρούσα ανάλυση. Ο τύπος της δόνησης περιέχει μόνο δύο υπάρχουσες διαφορετικές τιμές,
σεισμός και πυρηνική έκρηξη όπου το δεύτερο δεν χρησιμοποιηθεί για την σύγκριση των δεδομένων. Τα στοιχεία σχετικά με τις καταστροφές 
και τις ανθρώπινες απώλειες που προκάλεσε η έκρηξη δεν θα χρησιμοποιηθούν. Δηλαδή, πέρα από τις γεωγραφικές συντεταγμένες και 
την ημερομηνία των συμβάντων τα άλλα στοιχεία δεν θα είναι χρήσιμα για αυτή την ανάλυση. 

// #pagebreak()

= Μέθοδος ανάλυσης

Για την ανάλυση των δεδομένων θα χρησιμοποιήθηκε η γλώσσα προγραμματισμού Python με την χρήση ορισμένων βιβλιοθηκών. Στο αρχείο `requirements.txt` αναγράφονται όλες οι βιβλιοθήκες οι οποίες χρησιμοποιήθηκαν. Οι βιβλιοθήκες μπορούν να εγκατασταθούν αυτοματοποιημένα με χρήση του `pip`, το οποίο είναι διαχειριστής πακέτων.
Μία εκ των βιβλιοθηκών οι οποίες χρησιμοποιήθηκαν είναι η `pandas`, η οποία παρέχει εύκολο χειρισμό και ανάλυση δεδομένων. Η επιλογή αυτής της βιβλιοθήκης έγινε διότι επιτρέπει με ευκολία τον χειρισμό αρχείων τύπου Comma-Separated Values (CSV) που είναι και η μορφή στην οποία βρίσκονται τα σύνολα δεδομένων. 

Στο αρχείο `dataset.py` πραγματοποιείτε μια αρχική επεξεργασία των δεδομένων.
Αρχικά, καθορίζεται την τοποθεσία των βάσεων και φορτώνουμε της το αρχείο που δόθηκε ως όρισμα καθορίζοντας την πρώτη γραμμή ως επικεφαλίδα (header) 
που περιέχει την ονομασία των δεδομένων για την κάθε στήλη. Στην συνέχεια, αφαιρούνται οι γραμμές οι οποίες δεν είναι 
τύπου "σεισμός", καθώς οι άλλοι τύποι δεν αφορούν αυτή την ανάλυση. #footnote[Κάποιοι σεισμοί οι οποίοι καταγράφονται σε αυτό το σύνολο δεδομένων οφείλονται από ανθρωπογενείς παράγοντες (πχ. πυρηνικές εκρήξεις) ή άλλα πιο γενικά αίτια. Αυτή η ανάλυση αφορά τους σεισμούς οι οποίοι προκαλούνται από την μετακίνηση των τεκτονικών πλακών.] Οι συναρτήσεις `load_earthquake_events()` και `load_volcano_events()`
που καλούνται απο την `main()` και φορτώνουν τις βάσεις δεδομένων αντίστοιχα, η `load_volcano_events()` επίσης αφαιρεί τις ηφαιστειακές εκρήξεις που
έγιναν πριν το 1965 και μετά το 2016 λόγω μη ύπαρξης δεδομένων για αυτήν την περίοδο για την βάση των σεισμών.

Η συνάρτηση `convert_to_utm()` μετατρέπει της γεωγραφικές συντεταγμένες σε "Universal Transversal Mercator" (UTM). Το σύστημα 
αυτό βασίζεται στον διαχωρισμό του χάρτη σε περιοχές για την καλύτερη μέτρηση των αποστάσεων. Η προβολή αυτή είναι 
κυλινδρική με τέτοιο τρόπο ώστε η τιμή των γωνιών να διατηρείται εξασφαλίζοντας καλύτερη ακρίβεια κατά 
τον υπολογισμό της θέσης και των αποστάσεων. Οι αποστάσεις δημιουργούν ένα πλέγμα με χρήση των παράλληλων και των μεσημβρινών
με αριθμό από το 1 έως 60 ξεκινώντας από το μεσημβρινό ο οποίος είναι ανατολικά του Γκρίνουιτς. 
Κάθε παράλληλος χωρίζεται σε διαφορετικές περιοχές που ονομάζονται με κεφαλαίο γράμμα, ακολουθούν την κατεύθυνση από νότο προς βορρά
και ξεκινούν με το γράμμα C και τελειώνουν με το γράμμα X. Για να την αποφυγή σύγχυσης, δεν υπάρχουν φωνήεντα ή τα γράμματα τα οποία μπορούν 
να συγχέονται με έναν αριθμό.

Χρησιμοποιείται αυτή η μετατροπή για την εύκολη και κατανοητή σύγκριση των συνόλων δεδομένων από την χρήση των αρχικών γεωγραφικών συντεταγμένων.
Έτσι, παρουσιάζεται πάνω στον χάρτη σε εύκολα αναγνώσιμη μορφή ομαδοποιώντας περιοχές σε πλέγμα και
θεωρώντας το κάθε πλέγμα που σχηματίζεται την περιοχή που τα φυσικά φαινόμενα θα επηρεάζουν την εκδήλωση του άλλου.

#figure(image("utmworld.gif", width: 80%), supplement: "Εικόνα", caption: "UTM συντεταγμένες")

Στην συνάρτηση με την χρήση της βιβλιοθήκης `utm` #footnote[https://github.com/Turbo87/utm] αντιστοιχίζεται το "Latitude" στους παράλληλους, οι οποίοι χρησιμοποιούν
γράμμα ζώνης, και το "Longitude" στους μεσημβρινούς, οι οποίοι αντιστοιχούν στον αριθμό ζώνης, δημιουργώντας δύο νέες στήλες: την
"Zone number" και "Zone letter". Επίσης, η συνάρτηση αφαιρεί τα αποτελέσματα που δεν ήταν δυνατή η μετατροπή τους.
Με την μετατροπή των συντεταγμένων σε UTM τελειώνει η τροποποίηση των δεδομένων. 

// #pagebreak()

Στο αρχείο `association.py` πραγματοποιείται η συσχέτιση των UTM συντεταγμένων των δύο βάσεων δεδομένων. Με την συνάρτηση `hot_encoding()`
δημιουργείται ένα νέο σύνολο δεδομένων το οποίο περιέχει μόνο έναν δείκτη στις συντεταγμένες UTM και τις δύο στήλες οι οποίες αντιστοιχούν
στις δύο βάσεις δεδομένων με τιμή μηδέν ή ένα. Η συνάρτηση ελέγχει ξεχωριστά αν υπάρχουν γραμμές οι οποίες περιέχουν
συγκεκριμένο αριθμό ζώνης και γράμμα ζώνης. Στο τελικό σύνολο δεδομένων καταγράφονται μόνο οι τοποθεσίες στις οποίες έχει υπάρξει τουλάχιστον ένα από τα δύο φυσικά φαινόμενα.

Η συνάρτηση `fp.apriori()` από τη βιβλιοθήκη `mlxtend.frequent_patterns` εφαρμόζει τον αλγόριθμο Apriori στο `DataFrame` "df" 
και επιστρέφει ένα νέο `DataFrame` το οποίο περιέχει τα συχνά σύνολα στοιχείων μαζί με την υποστήριξή (support) τους. Αυτό επιτυγχάνετε με την εύρεση 
συχνών ζεύγων δεδομένων και την αφαίρεση των μη-συχνών. Ενα ζεύγος θεωρείτε συχνό αν και τα δύο μέλη του είναι συχνά. Αυτό συνεχίζεται
μέχρι την κατασκευή τριπλέτας δεδομένων και την μη-εύρεση νέων συχνών συνόλων. Ο αλγόριθμος τρέχει πολλές φορές κάθε φορά εξαλείφοντας 
δεδομένα μέχρι να βρεθεί το τελικό αποτέλεσμα. Τα αποτελέσματα δείχνουν
ότι στις σεισμικές δονήσεις η στήριξη είναι 0.989919, το οποίο σημαίνει ότι το 98.9919% των περιπτώσεων περιέχουν σεισμό. Για τις 
ηφαιστειακές εκρήξεις η στήριξη είναι 0.120968, το οποίο σημαίνει ότι το 12.0968% των περιπτώσεων περιέχουν ηφαιστειακή έκρηξη.
Τα δύο συμβάντα μαζί έχουν τελική στήριξη 0.110887, το οποίο σημαίνει ότι το 11.0887% των περιπτώσεων περιέχουν και τα δύο γεγονότα. Εδώ
φαίνεται ότι ο μεγάλος αριθμός σεισμικών δονήσεων σε σχέση με τις λίγες ηφαιστειακές εκρήξεις στις αντίστοιχες βάσεις ενδεχομένως να έχει
αλλοιώσει τα αποτελέσματα.

#figure(image("final.png", width: 80%), supplement: "Εικόνα", caption: "Apriori")


Με βάση την στήριξη προηγουμένου (0.120968) και στήριξη επακόλουθου (0.989919) φαίνεται ότι υπάρχει 91.6667% να εκδηλωθεί σεισμική δόνηση
άν έχει προηγηθεί ηφαιστειακή έκρηξη.

zhangs_metric: Μια εναλλακτική μέτρηση η οποία συγκρίνει την εμπιστοσύνη με τη στήριξη του επακόλουθου. Εδώ είναι -0.083333. Επειδή η ανύψωση είναι μικρότερη του 1 και η επιρροή είναι αρνητική τιμή με βάση των αλγόριθμο τα δύο φαινόμενα δεν παρουσιάζουν
ισχυρή συσχέτιση.

= Πειραματικά Αποτελέσματα

Μετά τις απαραίτητες τροποποιήσεις τα αποτελέσματα αφού μετατράπηκαν σε utm συντεταγμένες φαίνονται στις παρακάτω εικόνες.
Παρατηρούμε ότι οι σεισμικές δονήσεις έχουν περισσότερες εγγραφές (23.217) από τις ηφαιστειακές εκρήξεις (265). 
Λόγω αυτού τα αποτέλεσμα μπορεί να επηρεαστούν και να παρουσιάζουν την βάση με τα περισσότερα αποτελέσματα με μεγαλύτερη βαρύτητα.
Η εκτέλεση τους δεν διέφερε από το φόρτωμα των βάσεων και την εκτύπωση των πληροφοριών τους.

#figure(image("earthquake_events.png", width: 80%), supplement: "Εικόνα", caption: "Μέρος της βάσεις σεισμικές δονήσεις")
#figure(image("volcano_events.png", width: 80%), supplement: "Εικόνα", caption: "Μέρος της βάσεις ηφαιστειακές εκρήξεις")

Μετά την συσχέτιση των δεδομένων ο αριθμός των εγγραφών είναι μόνο 495 και βρίσκονται στο αρχείο `association.csv`, η διαδικασία 
αυτή κυρίως στις πρώτες μορφές που είχε ο αλγόριθμος έπαιρνε μέχρι και 10 δευτερόλεπτα για την εκτέλεση της. Στον υπάρχοντα
κώδικα η διαδικασία συσχέτισης των δεδομένων και της εκτέλεσης του αλγόριθμου apriori διαρκεί περίπου 5 δευτερόλεπτα.

Αφού έχει πραγματοποιηθεί η συσχέτιση των δεδομένων με χρήση του αλγόριθμου apriori, ο οποίος πραγματοποιεί πολλαπλά  
διαδοχικά περάσματα των δεδομένων μέχρι την εύρεση του τελικού συνόλου, θέτουμε το min_support (ελάχιστή υποστήριξη) ως 
0.1, δηλαδή το ποσοστό που θα πρέπει να έχουν τα δεδομένα για να θεωρηθούν συχνά. Η υποστήριξη είναι χαμηλή επειδή μια 
ενδεχόμενη αύξηση της μπορούσε να οδηγήσει στην μείωση των συχνών δεδομένων και κυρίως μείωση έως εξάλειψη των περισσότερων
δεδομένων που αφορούν στις εκρήξεις λόγο του μικρού όγκου τον δεδομένων σε σύγκριση με τις σεισμικές δονήσεις.

#figure(image("final.png", width: 80%), supplement: "Εικόνα 6", caption: "Αποτελέσματα apriori,min_support=0.1")

Τα αποτελέσματα δείχνουν ότι στις σεισμικές δονήσεις η στήριξη είναι 0.989919, το οποίο σημαίνει ότι το 98.9919% των περιπτώσεων 
περιέχουν σεισμό. Για τις ηφαιστειακές εκρήξεις η στήριξη είναι 0.120968, το οποίο σημαίνει ότι το 12.0968% των περιπτώσεων 
περιέχουν ηφαιστειακή έκρηξη. Τα δύο συμβάντα μαζί έχουν τελική στήριξη 0.110887, το οποίο σημαίνει ότι το 11.0887% των περιπτώσεων
περιέχουν και τα δύο γεγονότα. Εδώ φαίνεται ότι ο μεγάλος αριθμός σεισμικών δονήσεων σε σχέση με τις λίγες ηφαιστειακές εκρήξεις
στις αντίστοιχες βάσεις ενδέχεται να έχει αλλοιώσει τα αποτελέσματα.

#figure(image("final.png", width: 80%), supplement: "Εικόνα 3", caption: "Apriori")


Με βάση την στήριξη προηγουμένου (0.120968) και στήριξη επακόλουθου( 0.989919) δείχνουν ότι υπάρχει 91.6667% να εκδηλωθεί σεισμική δόνηση
εάν έχει προηγηθεί ηφαιστειακή έκρηξη. Το αποτέλεσμα του αλγορίθμου αυτού είναι αντίθετο από το αναμενόμενο και είναι επίσης αντίθετο
με τις μελέτες οι οποίες έχουν γίνει, δηλαδή ότι υπάρχει πιθανότητα σεισμοί να προκαλούν ηφαιστειακές εκρήξεις.
Όμως, σε αυτή την έρευνα όχι μόνο έχουμε αντίθετα αποτελέσματα άλλα υπάρχει συντριπτικά μεγάλη εμπιστοσύνη για την εκδήλωση σεισμού και μετά
έκρηξης. Ακόμα και στις υπόλοιπες μελέτες δεν θεωρείτε δεδομένο τι προκάλεσε το άλλο πόσο μάλλον με τόσες πιθανότητες. 

Επειδή όμως η συνολική ανύψωση είναι 0.926001 μικρότερη του 1, μειώνεται ελαφρώς η εμφάνιση του προηγουμένου, δηλαδή των ηφαιστειακών εκρήξεων
εμφάνισης του επακόλουθου (σεισμικών δονήσεων), υπενθυμίζουμε ότι αν η ανύψωση ήταν 1 τότε τα γεγονότα θα ήταν ανεξάρτητα. Το Zhang's Metric και
Leverage όντας και τα δύο αρνητικά -0.083333 και -0.008861 αντίστοιχα, δείχνουν και τα δύο αρνητική συσχέτιση.

Καθώς χρειάζεται πρώτα η συσχέτιση των δεδομένων ο αλγόριθμος apriori έχει σχεδόν άμεση εκτέλεση αν λάβουμε υπόψη μας
την εκτέλεση πρώτα της συσχέτισης των δεδομένων.
Μια δοκιμή εκτέλεσης του αλγορίθμου με τιμές ελάχιστή υποστήριξη πάνω του 0.1 δεν θα παραχθούν συχνά σύνολα 

#figure(image("final_empty.png", width: 80%), supplement: "Εικόνα 6", caption: "Αποτελέσματα apriori,min_support=0.1")

= Κριτική αποτίμηση αποτελεσμάτων

Με τις συντεταγμένες UTM παρότι είναι δυνατή η εύκολη διαμοίραση περιοχών πάνω στο χάρτη ο αλγόριθμος συσχέτισης
που χρησιμοποιείται δεν ελέγχει τις γύρω περιοχές/πλέγματα για να συγκρίνει και τις περιοχές αυτές σε περίπτωση που 
ένα συμβάν βρίσκεται κοντά στις άκρες ενός πλέγματος. Αν γινόταν και αυτή η σύγκριση τα αποτελέσματα ενδεχομένως να διέφεραν σε έναν βαθμό
κυρίως στις περιοχές που συγκρούονται οι τεκτονικές πλάκες και υπάρχουν ηφαιστειογενείς ζώνες.

Επιπλέον, θα μπορούσε να υπάρξει και ισορρόπηση των αποτελεσμάτων μεταξύ των δύο βάσεων δεδομένων με την ενδεχόμενη απαλοιφή
των σεισμικών δονήσεων που έγιναν σε μια περιοχή λόγω της ύπαρξης πολλών επακόλουθων σεισμικών δονήσεων  
την ίδια χρονική περίοδο πριν την συσχέτιση. 

= Συμπεράσματα

Λαμβάνοντας υπόψη τα τελικά αποτελέσματα, οι ηφαιστειακές εκρήξεις προηγούνται των σεισμών. Παρόλα αυτά, λόγω πιθανών λαθών μεθοδολογίας δεν μπορεί να δοθεί ξεκάθαρη απάντηση. Όπως προαναφέρθηκε στην εισαγωγή, με βάση την υπάρχουσα βιβλιογραφία οι σεισμοί ορισμένες φορές προκαλούν ηφαιστειακές εκρήξεις, κάτι το οποίο έξω από αυτή την ερεύνα έχει αποτελέσει αφορμή για πολλές συζήτησης.

#pagebreak()

#bib("bib.yml")