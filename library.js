let books = [
    { id: 1, title: "java", author: "scott", subject: "coding", date: "1999-04-10" },
    { id: 2, title: "the guardian", author: "Robert", subject: "fiction", date: "2008-08-01" },
    { id: 3, title: "the saviour", author: "rahna", subject: "Biography", date: "2011-01-01" }
];

const bookForm = document.getElementById('bookForm');
const bookList = document.getElementById('bookList');
const searchBar = document.getElementById('searchBar');
const loading = document.getElementById('loading');

function displayBooks(data) {
    bookList.innerHTML = "";
    data.forEach(book => {
        const div = document.createElement('div');
        div.className = 'book-card';
        div.innerHTML = `
            <div>
                <strong>${book.title}</strong><br>
                <small>By: ${book.author} | Subject: ${book.subject}</small><br>
                <small>Date: ${book.date}</small>
            </div>
            <button class="delete-btn" onclick="deleteBook(${book.id})">Delete</button>
        `;
        bookList.appendChild(div);
    });
}

bookForm.addEventListener('submit', (e) => {
    e.preventDefault();
    
    const newBook = {
        id: Date.now(), 
        title: document.getElementById('title').value,
        author: document.getElementById('author').value,
        subject: document.getElementById('subject').value,
        date: document.getElementById('publishDate').value
    };

    books.push(newBook);
    displayBooks(books);
    bookForm.reset();
});

function deleteBook(id) {
    books = books.filter(book => book.id !== id);
    displayBooks(books);
}

searchBar.addEventListener('input', (e) => {
    const searchTerm = e.target.value.toLowerCase();
    const filteredBooks = books.filter(book => 
        book.title.toLowerCase().includes(searchTerm) || 
        book.author.toLowerCase().includes(searchTerm)
    );
    displayBooks(filteredBooks);
});

displayBooks(books);

