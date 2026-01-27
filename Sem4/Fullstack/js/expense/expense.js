
    const expenses = [];

    function addExpense() {
        const name = document.getElementById("name").value;
        const amount = Number(document.getElementById("expense").value);

        if (name === "" || amount === 0) {
            alert("Enter valid name and expense");
            return;
        }

        expenses.push({ name, amount });

        document.getElementById("name").value = "";
        document.getElementById("expense").value = "";

        displayExpenses();
        calculateSummary();
    }

    function displayExpenses() {
        const list = document.getElementById("expenseList");
        list.innerHTML = "";

        expenses.forEach(e => {
            const p = document.createElement("p");
            p.textContent = `${e.name}: ₹${e.amount.toFixed(2)}`;
            list.appendChild(p);
        });
    }

    function calculateSummary() {
        const summary = document.getElementById("summary");
        summary.innerHTML = "";

        const total = expenses.reduce((sum, e) => sum + e.amount, 0);
        const average = total / expenses.length;

        expenses.forEach(e => {
            const diff = e.amount - average;
            const p = document.createElement("p");

            if (diff > 0) {
                p.textContent = `${e.name} is owed ₹${diff.toFixed(2)} by others.`;
            } else if (diff < 0) {
                p.textContent = `${e.name} owes ₹${Math.abs(diff).toFixed(2)} to others.`;
            } else {
                p.textContent = `${e.name} is settled.`;
            }

            summary.appendChild(p);
        });
    }
