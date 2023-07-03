# LearningR
---
title: "Εργασία στο μάθημα Επιστήμη των Δεδομένων και Αναλυτική (Data Science and Analytics)"
author: "Τριανταφυλλίδου Μαρία"
date: "2023-06-26"
output:
  html_document:
    df_print: paged
  pdf_document: default
---

![](https://www.ihu.edu.gr/images/logos/IHU_logo_blue_en.jpg)

### Εισαγωγή

Η παρούσα εργασία αναλύει και παρουσιάζει δεδομένα χρησιμοποιώντας την γλώσσα R. Η γλώσσα προγραμματισμού R παρέχει ένα ισχυρό περιβάλλον για την ανάλυση και την οπτικοποίηση δεδομένων. Η εργασία ξεκινά με την ανάγνωση και την επεξεργασία ενός αρχείου CSV που περιέχει συλλογικά δεδομένα. Χρησιμοποιώντας τη γλώσσα R, εκτελούμε αναλύσεις και υπολογισμούς πάνω στα δεδομένα, προετοιμάζοντας τα για την παρουσίαση.

```{r include=FALSE}
# Φόρτωση των απαιτούμενων πακέτων
library(tidyverse)
library(ggplot2)
library(dplyr)


health <- read_delim("health.csv", delim = ";")
ages <- read_delim("Ages.csv", delim = ";")
countryTotal <- read_delim("countryTotal.csv", delim = ";")
total <- read_delim("TotalPopulation.csv", delim = ";")
```

Το website <https://data.worldbank.org/indicator> αποτελεί μία πολύτιμη πηγή δεδομένων που παρέχει πληροφορίες για διάφορα οικονομικά και κοινωνικά δεδομένα από όλο τον κόσμο. Αυτή η πλατφόρμα ανήκει στην Παγκόσμια Τράπεζα και στοχεύει στη συγκέντρωση, οργάνωση και διάθεση ανοικτών δεδομένων που σχετίζονται με την ανάπτυξη και την οικονομία των χωρών.

Στα πλέσια της παρακάτω εργασίας χρησιμοποιήθηκαν δεδομένα απο τα δεδομένα υγείας <https://data.worldbank.org/topic/health?view=chart>.
Παρακάτω θα βρείτε την αναλυτική εργασία μου.
```{r countryTotal}
summary(countryTotal)
```

### Σχεδιαγράμματα

Για να γίνει η παρουσίαση ακόμα πιο πειστική και εύκολη στην κατανόηση, συμπεριλαμβάνουμε γραφήματα και διαγράμματα που δημιουργούνται επίσης με τη χρήση της γλώσσας R. Τα γραφήματα αυτά βοηθούν στην οπτικοποίηση των δεδομένων και στην εύρυθμη παρουσίαση των αναλύσεων που πραγματοποιούνται.

```{r}
library(ggplot2)
plot <- ggplot(data = countryTotal) + 
  geom_point(mapping = aes(x = country, y = male), color = "blue")
plot
```

```{r}
library(ggplot2)
plot <- ggplot(data = countryTotal) + 
  geom_bar(mapping = aes(x = refugee), fill = "lightblue")
plot
```

```{r echo=FALSE}
data <- data.frame(
  Country= c("Greece","Russia","Germany","United Kingdom","France",
           "Italy","Spain","Ukraine","Poland","Romania","Netherlands",
           "Belgium","Czech Republic","Portugal","Sweden","Hungary","Belarus",
           "Austria","Serbia","Switzerland","Bulgaria","Denmark","Finland",	"Norway",
           "Ireland","Croatia",	"Moldova","Bosnia and Herzegovina","Albania",	"Lithuania",
           "North Macedonia","Slovenia","Latvia","Estonia","Montenegro","Luxembourg","Malta",
           "Iceland","Andorra","Monaco","Liechtenstein","San Marino"),
  value=c(1236443,144342397,82348669,65611593,66724104,
          60627498,46484062,45004673,37970087,19702267,
          17030314,11331422,10566332,10325452,9923085,
          9814023,9469379,8736668,3672802,8373338,7127822,
          5728010,5495303,5234519,4755335,4174349,2803186,
          3480986,2876101,2868231,2072490,2065042,1959537,
          1315790,622303,582014,455356,335439,72540,37071,
          37609,33834
)
)
```

```{r}
# Basic piechart
plot <- ggplot(data, aes(x="", y=value, fill=Country)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)
plot
```

### Inner Join με R

Τα Inner Join ανήκουν στις διαδικασίες συνένωσης (join) που μπορούν να γίνουν στη γλώσσα προγραμματισμού R, και χρησιμοποιούνται για να συνδυάσουν δεδομένα από διάφορες πηγές βάσης δεδομένων με βάση ένα κοινό πεδίο ή σύνολο πεδίων.

Συγκεκριμένα, το Inner Join επιστρέφει μόνο τις εγγραφές που έχουν κοινές τιμές στα πεδία που καθορίζονται για τη συνένωση. Αυτό σημαίνει ότι μόνο οι εγγραφές που έχουν αντίστοιχες τιμές στο κοινό πεδίο θα επιστραφούν στο αποτέλεσμα του Inner Join.

Ένα παράδειγμα inner join είναι το παρακάτω που εννώνει δυο πίνακες με την στήλη country

```{r}
merged_data <- merge(total, countryTotal, by = "country")

#View of inner join only for two columns from six total columns
print(merged_data[c("country","PopulationTotal")])
```

### Δομές επανάληψης

Οι for loops είναι ένας από τους βασικούς τρόπους επανάληψης κώδικα στη γλώσσα προγραμματισμού R. Οι for loops σας επιτρέπουν να εκτελέσετε ένα συγκεκριμένο τμήμα κώδικα επανειλημμένα για μια ορισμένη σειρά τιμών ή αντικειμένων.

Η σύνταξη μιας for loop στην R είναι η εξής:

```{r}
for (i in 1:5) {
  # Κώδικας που θέλουμε να εκτελεστεί
}
```

Ας δούμε ένα απλό παράδειγμα. Aς υποθέσουμε πως θέλουμε να εκτυπώσουμε τυχαία δέκα αριθμούς απο το 1 εως το 100. Μπορούμε να χρησιμοποιήσουμε μια for loop για αυτό το σκοπό:

```{r}
output <- for (i in 1:10) {
  random_number <- sample(1:100, 1)
  result <- paste0(i,"-> ", random_number)
  print(result)
}
```

Σε αυτό το παράδειγμα, η μεταβλητή "i" λαμβάνει τις τιμές από το 1 έως το 10, και κάθε φορά εκτελείται ο κώδικας μέσα στη for loop, ο οποίος εκτυπώνει την τρέχουσα τιμή της μεταβλητής "i".

### Function με R

Οι συναρτήσεις (functions) αποτελούν ένα βασικό στοιχείο της γλώσσας προγραμματισμού R. Μια συνάρτηση είναι ένα μπλοκ κώδικα που εκτελεί μια συγκεκριμένη λειτουργία και μπορεί να κληθεί (να εκτελεστεί) από άλλο τμήμα του κώδικα.

```{r}
my_function <- function(arg1, arg2, ...) {
  # Κώδικας που εκτελεί τη λειτουργία της συνάρτησης
  # Επιστρέφει το αποτέλεσμα (αν χρειάζεται)
}
```

Σε αυτήν τη σύνταξη, το my_function είναι το όνομα που δίνουμε στη συνάρτηση, arg1, arg2, κ.λπ. είναι οι παράμετροι που μπορεί να δεχθεί η συνάρτηση, και ο κώδικας που ακολουθεί εκτελείται όταν κληθεί η συνάρτηση. Αν χρειάζεται, μπορούμε να επιστρέψουμε ένα αποτέλεσμα με την εντολή return().

Ας δούμε ένα παράδειγμα για να κατανοήσουμε καλύτερα. Ας υποθέσουμε ότι θέλουμε να ορίσουμε μια συνάρτηση που υπολογίζει τον παραγοντικό ενός αριθμού¨

```{r}
#Function that calculate factorial
factorial <- function(n) {
  result <- 1
  for (i in 1:n) {
    result <- result * i
  }
  return(result)
}

# Usage example
number <- 4
factorial_result <- factorial(number)
sprintf("Ο παραγοντικός του αριθμού: %s",  number)
print(factorial_result)
```


### Reference

[1]	J. C. Branco et al., “Prevalence of Fibromyalgia: A Survey in Five European Countries,” Seminars in Arthritis and Rheumatism, vol. 39, no. 6, pp. 448–453, Jun. 2010, doi: 10.1016/j.semarthrit.2008.12.003.

[2]	D. M. Mihail and P. V. Kloutsiniotis, “The effects of high-performance work systems on hospital employees’ work-related well-being: Evidence from Greece,” European Management Journal, vol. 34, no. 4, pp. 424–438, Aug. 2016, doi: 10.1016/j.emj.2016.01.005.

[3]	D. Podlekareva et al., “THE EUROSIDA STUDY: REGIONAL DIFFERENCES IN THE HIV-1 EPIDEMIC AND TREATMENT RESPONSE TO ANTIRETROVIRAL THERAPY AMONG HIV-INFECTED PATIENTS ACROSS EUROPE − A REVIEW OF PUBLISHED RESULTS”.

[4]	“Who Smokes in Europe? Data From 12 European Countries in the TackSHS Survey (2017–2018).” https://www.jstage.jst.go.jp/article/jea/31/2/31_JE20190344/_article/-char/ja/ (accessed Jun. 29, 2023).
