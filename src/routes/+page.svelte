<script>
	// Variabel untuk menyimpan data dari API
	let apiData = null;
	let error = null;

	// Fungsi untuk mengambil data dari API
	async function fetchData() {
		try {
			const response = await fetch('http://103.183.75.214:8080/');
			if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);

			apiData = await response.json(); // Parsing response ke JSON
		} catch (err) {
			error = err.message;
		}
	}

	// Panggil fetchData saat komponen dimuat
	fetchData();
</script>

<h1>API Data from Backend New temen2 tiktok</h1>

{#if error}
	<p style="color: red;">Error: {error}</p>
{:else if apiData}
	<pre>{JSON.stringify(apiData, null, 2)}</pre>
{:else}
	<p>Loading...</p>
{/if}
