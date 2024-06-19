#import "conf.typ": conf
#import "conf.typ": cont
#import "conf.typ": bib

#conf([Εργασία Διαχείρισης Δεδομένων Μεγάλης Κλίμακας], [Ανάλυση σεισμικών δονήσεων και ηφαιστειακών εκρήξεων], 
  [11/04/24], [21/06/24])
#cont()

#set page(numbering: "1")
#counter(page).update(1)

= Εισαγωγή

Σκοπός αυτής της εργασίας είναι η ανάλυση και η σύγκριση των δεδομένων που προέρχονται από τις βάσεις δεδομένων 
Database of Volcanic Eruptions και Significant Earthquakes, 1965-2016.Η βάση δεδομένων των ηφαιστειακών εκρήξεων περιέχει 
την χρονική περίοδο τη έκρηξης (χρόνος, μήνας και μέρα), το όνομα του ηφαιστείου το οποίο εξερράγη, 
την ώρα της έκρηξης ,την τοποθεσία και χώρα άλλα επίσης το γεωγραφικό πλάτος και μήκος και το ύψος του ηφαιστείου.
Η βάση δεδομένων των σεισμικών δονήσεων περιέχει την πλήρης ημερομηνία, την ώρα της έκρηξης  το βάθος, 
το μέγεθος της απόστασης που γίνεται αντιληπτή η σεισμική δόνηση,τ ον τύπο, το γεωγραφικό πλάτος και μήκος του κέντρο της δόνησης
και την απόσταση που γίνεται αντιληπτή η δόνηση. Με την χρήση του γεωγραφικό πλάτους και μήκους θα προσπαθήσουμε  
με την επεξεργασία τους να βρούμε τα κοινά στοιχεία μεταξύ των δύο διαφορετικών βάσεων δεδομένων.
Με τα στοιχεία αυτά θέλουμε να βρούμε εαν υπάρχει συσχέτιση μεταξύ των ηφαιστειακών εκρήξεων και των σεισμικών δονήσεων που γίνονται
σε μικρή απόσταση μεταξύ τους, και πιο φαινόμενο ήταν η αφορμή για την εκδήλωση του άλλου. Κατά την επεξεργασία των δεδομένων 
θα γίνουν οι απαραίτητες τροποποιήσεις ώστε να συμπεριληφθούν μόνο τα δεδομένα που βρίσκονται εντός των προδιαγραφών της μελέτης.

= Ορισμός προβλήματος και κίνητρο

Όπως αναφέρθηκε και στην εισαγωγή το κίνητρο της έρευνας είναι η απάντηση στο κατα πόσο είναι πιθανόν να οφείλονται οι σεισμικές δονήσεις 
σε ηφαιστειακές εκρήξεις, υπάρχει πιθανότητα να συμβαίνει το αντίθετο;. Η απάντηση αυτού του ερωτήματος με στατιστικά στοιχεία 
θα είναι χρήσιμη για τις προβλέψεις που μπορούν να γίνουν σχετικά με τα δύο φυσικά φαινόμενα, την πιθανότητα εκδήλωσης του ενός 
αν έχει προηγηθεί για παράδειγμα σεισμική δόνηση και μετα εκδήλωση ηφαιστειακής έκρηξης και την έγκαιρη προειδοποίηση του τοπικού πληθυσμού. 
Τα στοιχεία δηλαδή θα είναι χρήσιμα και για επιστημονική μελέτη και έρευνες καθώς και για πρόληψη.  


= Σύντομη περιγραφή του συνόλου δεδομένων που χρησιμοποιήσατε

Τα δεδομένα που έχουμε έχουν το γεωγραφικό πλάτος και μήκος ως κοινές πληροφορίες που θα χρησιμοποιηθούν για την εύρεση συντεταγμένων 
για την σύγκριση τους. Καθώς οι βάσεις οι οποίες χρησιμοποιούνται για την άντληση των δεδομένων έχουν διαφορετικές περιόδους καταγραφής 
θα γίνει σύγκριση μόνο των κοινών περιόδων από το 1965 μέχρι το 2016. Τα δεδομένα που αφορούν στα ονόματα των χωρών ή περιοχών καθώς 
και τα ονόματα των ηφαιστείων δεν χρησιμεύουν στην παρούσα ανάλυση. Ο τύπος της δόνησης περιέχει μόνο δύο υπάρχουσες διαφορετικές τιμές,
σεισμός και πυρηνική έκρηξη όπου το δεύτερο δεν χρησιμοποιηθεί για την σύγκριση των δεδομένων. Τα στοιχεία σχετικά με τις καταστροφές 
και τις ανθρώπινες απώλειες που προκάλεσε η έκρηξη δεν θα χρησιμοποιηθούν. Δηλαδή πέρα από τις γεωγραφικές συντεταγμένες και 
την ημερομηνία των συμβάντων τα άλλα στοιχεία δεν θα είναι χρήσιμα για αυτή την ανάλυση. 

#pagebreak()

= Περιγραφή της μεθόδου ανάλυσης των δεδομένων

Για την ανάλυση των δεδομένων θα χρησιμοποιήσουμε την γλώσσα προγραμματισμού python με την χρήση κυρίως της βιβλιοθήκης pada 
που παρέχει χειρισμό και ανάλυση δομών δεδομένων. Η επιλογή αυτής της βιβλιοθήκης έγινε γιατί μας επιτρέπει με ευκολία τον χειρισμό αρχείων
τύπου βάσεων δεδομένων σε διάφορους τύπους αρχείων ,όπως .csv που είναι και οι βάσεις οι οποίες χρησιμοποιούμε για την ανάλυση,
καθώς και την γρήγορη επεξεργασία των δεδομένων που υπάρχουν. Στο αρχείο dataset.py πραγματοποιούμε μια αρχική επεξεργασία των δεδομένων,
στην αρχή καθορίζουμε την τοποθεσία των βάσεων και φορτώνουμε της το αρχείο που δόθηκε ως όρισμα καθορίζοντας την πρώτη γραμμή ως header 
που περιέχει την ονομασία των τύπου δεδομένων για την κάθε στήλη. Στην συνέχεια όπως αναφέραμε κάνουμε αφαίρεση της γραμμής που δεν είναι 
"τύπου σεισμός", καθώς οι άλλοι τύποι δεν έχουν προκληθεί από φυσικά αίτια. Οι συναρτήσης oad_earthquake_events και load_volcano_events
που καλούνται απο την main φορτώνουν τις βάσεις δεδομένων αντίστιχα, η load_volcano_events επίσης αφαιρεί τις ηφαιστειακές εκρήξεις που
έγιναν πριν το 1965 και μετά το 2016 λόγο μη υπαρξης δεδομένων για αυτήν την περίοδο για την βάση των σεισμών.

Η συνάρτηση convert_to_utm μετατρέπει της γεωγραφικές συντεταγμένες σε Universal Transversal Mercator. Το σύστημα 
αυτό βασίζεται στον διαχωρισμό του χάρτη σε περιοχές για την καλύτερη μέτρηση των αποστάσεων. Η προβολή αυτή είναι 
κυλινδρική με αυτό τον τρόπο η τιμή των γωνιών διατηρείται για να εξασφαλιστεί καλύτερη ακρίβεια κατά 
τον υπολογισμό της θέσης και των αποστάσεων. Οι αποστάσεις δημιουργούν ένα πλέγμα με χρήση των παράλlηλων και των μεσημβρινών
Με αριθμό από το 1 έως 60 ξεκινώντας από το μεσημβρινό που είναι ανατολικά του Γκρίνουιτς. 
Καθένα από αυτά χωρίζεται σε διαφορετικές περιοχές που ονομάζονται με κεφαλαίο γράμμα, ακολουθούν την κατεύθυνση από νότο προς βορρά
και ξεκινούν με το γράμμα C και τελειώνουν με το γράμμα X. Για να μην συγχέεται, δεν υπάρχουν φωνήεντα και τα γράμματα μου που μπορούν 
να συγχέονται με έναν αριθμό.

Χρησιμοποιούμε την μετατροπή αυτή για την εύκολη και κατανοητή σύγκριση  των βάσεων από την χρήση των αρχικών γεωγραφικών συντεταγμένων
επειδή έχουμε συγκεκριμένες τιμές για να παρουσιάσουμε πάνω στον χάρτη σε εύκολα αναγνώσιμη μορφή, και την ομαδοποίηση περιοχών σε πλέγμα,
θεωρώντας το κάθε πλέγμα που σχηματίζεται την περιοχή που τα  φυσικά φαινόμενα θα επιρεάζουν την εκδήλωση του άλλου.

#figure(image("utmworld.gif", width: 80%), supplement: "Εικόνα 1", caption: "UTM συντεταγμένες")

Στην συνάρτηση με την χρήση της βιβλιοθήκης utm(https://github.com/Turbo87/utm) αντιστοιχούμε το Latitude στους παράλληλους που χρησιμοποιούν
γράμμα ζώνης και το Longitude στους μεσημβρινών που αντιστοιχούν στον αριθμό ζώνης δημιουργώντας δύο νέες στήλες την
Zone number και Zone letter. Η συνάρτηση επίσης αφαιρεί τα αποτελέσματα που δεν ήταν δυνατή η μετατροπή τους, όλες οι συντεταγμένες 
αυτές βρίσκονται στον βόρειο πόλο και είναι αδύνατον να μετατραπούν καθώς δεν αντιπροσωπεύονται με την χρήση των συντεταγμένων utm
Με την μετατραπεί των συντεταγμένων έχουμε τελειώσει την τροποποίηση των δεδομένων. 

#pagebreak()

Στο αρχείο association.py πραγματοποιείτε η συσχέτιση των utm συντεταγμένων των δύο βάσεων δεδομένων. Με την συνάρτηση hot_encoding
δημιουργούμε ένα καινούργιο dataset που περιέχει μόνο ένα index number τις συντεταγμένες utm και τις δύο στήλες που αντιστοιχούν
στις δύο βάσεις δεδομένων με τιμή 0 ή 1,true or false. Η συνάρτηση ελέγχει ξεχωριστά αν υπάρχουν γραμμές που περιέχουν
συγκεκριμένο αριθμό ζώνης και γράμμα ζώνης, και με τον συνδυασμό αν ικανοποιούνται και οι δύο συνθήκες επιστρέφει true.
Ανάλογα με την βάση δεδομένων θέτει 1 την τιμή στην βάση όρισμα και 0 στην άλλη βάση, τιμές που υπάρχουν ήδη δεν προστίθενται ένα
είναι από την βάση των σεισμικών δονήσεων άλλα αν υπάρχει ήδη η ζώνη αυτή τότε η βάση των ηφαιστειακών εκρήξεων θέτει την εγράφη  σε 1.

Η συνάρτηση fp.apriori από τη βιβλιοθήκη mlxtend.frequent_patterns εφαρμόζει τον αλγόριθμο Apriori στο DataFrame df 
και επιστρέφει ένα νέο DataFrame που περιέχει τα συχνά σύνολα στοιχείων μαζί με την υποστήριξή τους. Τα αποτελέσματα δείχνουν
ότι στις σεισμικές δονήσεις η στήριξη είναι 0.989919, που σημαίνει ότι το 98.9919% των περιπτώσεων περιέχουν σεισμό για τις 
ηφαιστειακές εκρήξεις  η στήριξη είναι 0.120968, που σημαίνει ότι το 12.0968% των περιπτώσεων περιέχουν ηφαιστειακή έκρηξη, ενώ
και τα δύο συμβάντα έχουν στήριξη είναι 0.110887, που σημαίνει ότι το 11.0887% των περιπτώσεων περιέχουν και τα δύο γεγονότα. Εδώ
φαίνεται ότι ο μεγάλος αριθμός σεισμικών δονήσεων σε σχέση με τις λίγες ηφαιστειακές εκρήξεις στις αντίστοιχες βάσεις μπορεί να έχει
αλλοιώσει τα αποτελέσματα.

Με βάση την στήριξη προηγουμένου(0.120968) και στήριξη επακόλουθου(0.989919) δείχνουν ότι υπάρχει 91.6667% να εκδηλωθεί σεισμική δόνηση
εάν έχει προηγηθεί ηφαιστειακή έκρηξη. Λόγο ότι η συνολική ανύψωση είναι 0.926001 μιρκότερη του 1 το αποτέλεσμα είναι 
η μειώνει πιθανότητας εμφάνισης σεισμού σε σχέση με την συνολική πιθανότητα εμφάνισης σεισμού.

-conviction

zhangs_metric: Μια εναλλακτική μέτρηση που συγκρίνει την εμπιστοσύνη με τη στήριξη του επακόλουθου. Εδώ είναι -0.083333.

Επειδή η ανύψωση είναι μιρκότερη του 1 και η επιρροή είναι αρνητική τιμή με βάση των αλγόριθμο τα δύο φαινόμενα δεν παρουσιάζουν
ισχυρή συσχέτιση.

= Πειραματικά Αποτελέσματα

Μετά τις απαραίτητες τροποποιήσεις τα αποτελέσματα αφού μετατράπηκαν σε utm συντεταγμένες φαίνονται στις παρακάτω εικόνες
παρατηρούμε ότι οι σεισμικές δονήσεις έχουν πολλές περισσότερες εγγραφές(23.217) από τις ηφαιστειακές εκρήξεις(265), 
λόγο αυτού τα αποτέλεσμα μπορεί να επηρεαστούν και να παρουσιάζουν την βάση με τα περισσότερα αποτελέσματα, 
στην περίπτωση μας των σεισμικών δονήσεων, εως αυτή που έχει την μεγαλύτερη βαρύτητα. 

#figure(image("earthquake_events.png, width: 80%), supplement: "Εικόνα 2", caption: "Μέρος της βάσεις σεισμικές δονήσεις")
#figure(image("volcano_events.png, width: 80%), supplement: "Εικόνα 3", caption: "Μέρος της βάσεις ηφαιστειακές εκρήξεις")

Μετά την συσχέτιση των δεδομένων ο άριθμός των εγγραφών είναι μόνο 495 που βρίσκονται στο αρχείο Association.csv,

τελικά αποτελέσματα..............

=Κριτική αποτίμηση αποτελεσμάτων

Με τις συντεταγμένες utm παρότι είναι δυνατή η εύκολη διαμοίραση περιοχών πάνω στο χάρτη ο αλγόριθμος συσχέτισης
που χρησιμοποιούμε δεν ελέγχει τις γύρω περιοχές/πλέγματα για να συγκρίνει και τις περιοχές αυτές σε περίπτωση που 
ένα συμβάν βρίσκεται κοντά στις άκρες ενός πλέγματος είναι λογικό να υποθέσουμε ότι θα επηρεαστούν και τα πλέγματα
που πρόσκεινται σε αυτό. Εαν γινόνταν και αυτή η σύγκριση τα αποτελέσματα ενδεχομένως να διαφέρανε σε έναν βαθμό
κυρίως στις περιχές που συγκρούονται οι τεκτονικές πλάκες και υπάρχουν ηφαιστιογενής ζώνες.

Επίσης θα μπορούσε να υπάρξει και ισοροποίηση των αποτελεσμάτων μεταξύ των δύο βάσεων δεδομένων με την ενδεχόμενη απαλοιφή
πριν την συσχέτιση, των σεισμικών δονήσεων που έγιναν σε μια περιοχή λόγο της ύπαρξης πολλών επακόλουθων σεισμικών δονήσεων  
την ίδια χρονική περίοδο. 

=Συμπεράσματα


#pagebreak()

#bib("bib.yml")