// Funkcja do ładowania pliku XML
function loadXMLDoc(filename) {
    var xhttp;
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
    } else { // code for IE5 and IE6
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhttp.open("GET", filename, false);
    xhttp.send();
    return xhttp.responseXML;
}

// Funkcja wyświetlająca listę książek
function displayBooks() {
    var xml = loadXMLDoc("books.xml");
    var xsl = loadXMLDoc("books.xsl");
    
    if (window.ActiveXObject || "ActiveXObject" in window) {
        var ex = xml.transformNode(xsl);
        document.getElementById("bookList").innerHTML = ex;
    } else if (document.implementation && document.implementation.createDocument) {
        var xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xsl);
        var resultDocument = xsltProcessor.transformToFragment(xml, document);
        document.getElementById("bookList").appendChild(resultDocument);
    }

    // Dodajemy obsługę kliknięcia na tytuł książki
    var titles = document.querySelectorAll(".book h2");
    titles.forEach(function(title) {
        title.addEventListener("click", function() {
            showBookDetails(this.textContent.trim());
        });
    });
}

// Funkcja wyświetlająca szczegóły książki
function showBookDetails(title) {
    var xml = loadXMLDoc("books.xml");
    var books = xml.getElementsByTagName("book");

    for (var i = 0; i < books.length; i++) {
        var bookTitle = books[i].getElementsByTagName("title")[0].textContent;
        if (bookTitle.trim() === title) {
            var author = books[i].getElementsByTagName("author")[0].textContent;
            var year = books[i].getElementsByTagName("year")[0].textContent;
            var genre = books[i].getElementsByTagName("genre")[0].textContent;
            var summary = books[i].getElementsByTagName("summary")[0].textContent;

            var detailsHTML = "<p><strong>Title:</strong> " + bookTitle + "</p>" +
                              "<p><strong>Author:</strong> " + author + "</p>" +
                              "<p><strong>Year:</strong> " + year + "</p>" +
                              "<p><strong>Genre:</strong> " + genre + "</p>" +
                              "<p><strong>Summary:</strong> " + summary + "</p>";

            document.getElementById("detailsContent").innerHTML = detailsHTML;
            document.getElementById("bookList").style.display = "none";
            document.getElementById("bookDetails").style.display = "block";
            break;
        }
    }
}

// Funkcja zamykająca szczegóły książki i wracająca do listy książek
function closeDetails() {
    document.getElementById("bookDetails").style.display = "none";
    document.getElementById("bookList").style.display = "block";
}

// Wywołanie funkcji wyświetlającej listę książek przy załadowaniu strony
window.onload = displayBooks;
