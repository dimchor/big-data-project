#let cont() = {
  set page(numbering: "i")
  counter(page).update(1)
  outline(title: [Περιεχόμενα])
}

#let conf(title, details, start_date, end_date) = {
  set align(center)
  text(17pt, "ΠΑΝΕΠΙΣΤΗΜΙΟ ΔΥΤΙΚΗΣ ΑΤΤΙΚΗΣ") 
  linebreak()
  text(15pt, "ΤΜΗΜΑ ΜΗΧΑΝΙΚΩΝ ΠΛΗΡΟΦΟΡΙΚΗΣ ΚΑΙ ΥΠΟΛΟΓΙΣΤΩΝ")
  
  v(1fr)

  image("uniwa.png", width: 50%)

  v(2fr)
  
  text(17pt, title)
  linebreak()
  text(15pt, details)
  linebreak()
  text(15pt, "ΔΗΜΗΤΡΙΟΣ ΧΟΡΕΒΑΣ (ΑΜ: 20390261), ΑΝΔΡΕΑΣ ΜΙΧΑΪΛΙΔΗΣ (ΑΜ: 20390149)")
  
  v(1fr)

  text(15pt, "Ημερομηνία διεξαγωγής: ")
  text(15pt, start_date)
  linebreak()
  text(15pt, "Ημερομηνία παράδοσης: ")
  text(15pt, end_date)

  v(1fr)

  text(15pt, "ΑΘΗΝΑ ")
  text(15pt, datetime.today().display("[year]"))
}

#let bib(str) = {
  bibliography(str, title: [Βιβλιογραφία])
}
